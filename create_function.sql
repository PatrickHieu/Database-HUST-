-- Tạo các hàm
-- admin id = 1->10
select post_id, avg(value) as vote_value_avg_per_post
from votes
where post_id = 207 
group by post_id
order by post_id

select user_id , id as post_id
from posts
where user_id = 21
order by user_id 

select id
from users
where is_reputations = true

-- 1. Hàm tính số lượng vote trung bình các bài đăng của moi người dùng
CREATE OR REPLACE FUNCTION calculate_average_votes()
RETURNS TABLE(user_id INT, vote_value_avg DOUBLE PRECISION) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.user_id,
        COALESCE(AVG(v.vote_value_avg_per_post)::DOUBLE PRECISION, 0) AS vote_value_avg
    FROM
        posts p
    LEFT JOIN (
        SELECT
            post_id,
            COALESCE(AVG(value)::DOUBLE PRECISION, 0) AS vote_value_avg_per_post
        FROM
            votes
        GROUP BY
            post_id
    ) v ON p.id = v.post_id
    GROUP BY
        p.user_id
    ORDER BY 
        p.user_id;
END;
$$ LANGUAGE plpgsql;

-- 2. Tạo hàm cập nhật uy tín của người dùng dựa trên số lượt vote trung bình
CREATE OR REPLACE FUNCTION update_user_reputations()
RETURNS VOID AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT user_id, vote_value_avg
        FROM calculate_average_votes()
    LOOP
        UPDATE users
        SET is_reputations = (rec.vote_value_avg >= 4.0)
        WHERE id = rec.user_id;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Test hàm 2 : mỗi tháng chạy 1 lần
SELECT update_user_reputations()
-- 3. Tạo tự động cập nhật vào đầu tháng
-- Cập nhật bằng tay :)))

-- 3. Hàm đăng bài và kiểm tra nếu người dùng uy tín thì không cần duyệt bài + trigger để thông báo bài viết đã được đăng chưa
CREATE FUNCTION create_post(user_id INT, title VARCHAR, content TEXT, image_url VARCHAR, location_name VARCHAR, category_id INT)
RETURNS VOID AS $$
BEGIN
    IF (SELECT is_reputations FROM users WHERE id = user_id) THEN
        INSERT INTO posts (user_id, title, content, image_url, location_name, category_id, created_at, updated_at, is_approved)
        VALUES (user_id, title, content, image_url, location_name, category_id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE);
    ELSE
        INSERT INTO posts (user_id, title, content, image_url, location_name, category_id, created_at, updated_at, is_approved)
        VALUES (user_id, title, content, image_url, location_name, category_id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE);
    END IF;
END;
$$
LANGUAGE PLPGSQL;

-- Test hàm 3
select create_post(57, 'Test reputation title', 'Test reputation content', 'Test reputation image_url', 'Test reputation location_name', 1)
select create_post(56, 'Test no reputation title', 'Test no reputation content', 'Test no reputation image_url', 'Test no reputation location_name', 1)

-- Select những người dùng uy tín để test hàm
select id, is_reputations
from users
where is_reputations = true

-- 4. Một hàm cho admin thấy được những bài đăng nào chưa được accept
CREATE FUNCTION get_unapproved_posts() 
RETURNS TABLE (
	id int,
	user_id int,
	title varchar(255),
	content text,
	image_url varchar(50),
	location_name varchar(50),
	created_at timestamp,
	updated_at timestamp,
	category_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN 
	RETURN QUERY
	SELECT posts.id, posts.user_id, posts.title, posts.content, posts.image_url, posts.location_name, posts.created_at, posts.updated_at, posts.category_id
	FROM posts
	WHERE posts.is_approved = false
	ORDER BY posts.created_at; 
END 
$$
-- Test hàm 4
SELECT * FROM get_unapproved_posts();

-- 5. Admin update trạng thái post
CREATE OR REPLACE FUNCTION update_post_status(admin_id INT, post_id INT, is_approved_new BOOLEAN)
RETURNS VOID AS $$
DECLARE
    is_admin BOOLEAN;
	post_owner INT;
BEGIN
    -- Kiểm tra xem admin_id có phải là admin không
    SELECT CASE WHEN users.role_id = false THEN TRUE ELSE FALSE END INTO is_admin
    FROM users
    WHERE users.id = admin_id;
	
	SELECT user_id INTO post_owner
    FROM posts
    WHERE id = post_id;

    IF NOT is_admin THEN
        RAISE EXCEPTION 'User id % không phải admin.', admin_id;
    END IF;
	
	IF NOT FOUND THEN
        RAISE EXCEPTION 'Bài viết với ID: % không tồn tại.', post_id;
    END IF;

    -- Cập nhật trạng thái bài viết nếu admin_id là admin
    UPDATE posts
    SET is_approved = is_approved_new,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = post_id;

	IF is_approved_new THEN
        INSERT INTO notifications (user_id, post_id, message, created_at, type)
        VALUES (post_owner, post_id, 'Bài viết của bạn với ID: ' || post_id || ' đã được chấp nhận bởi admin.', CURRENT_TIMESTAMP, 'post_accepted');
    ELSE
        INSERT INTO notifications (user_id, post_id, message, created_at, type)
        VALUES (post_owner, post_id, 'Bài viết của bạn với ID: ' || post_id || ' đã bị từ chối bởi admin.', CURRENT_TIMESTAMP, 'post_rejected');
    END IF;
END;
$$ LANGUAGE plpgsql;
-- Test hàm 5
select update_post_status(3, 207, true)
select update_post_status(30, 31, false) -- user 30 không phải admin
select update_post_status(2, 1110, false) -- Bài viết với id 1110 không tồn tại

-- 7. Admin confirm report và xóa report
CREATE OR REPLACE FUNCTION confirm_report(admin_id INT, report_id INT, is_accepted BOOLEAN)
RETURNS VOID AS $$
DECLARE
    post_id_cr INT;
    post_owner INT;
BEGIN
    -- Lấy thông tin về post_id từ report
    SELECT post_id INTO post_id_cr
    FROM reported_posts
    WHERE id = report_id;	

    -- Nếu report được chấp nhận
    IF is_accepted THEN
        -- Lấy thông tin về post_owner từ bài đăng
        SELECT user_id INTO post_owner
        FROM posts
        WHERE id = post_id_cr;
        -- Cập nhật trạng thái bài viết là từ chối
        UPDATE posts
        SET is_approved = FALSE,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = post_id_cr;
        -- Cập nhật trạng thái tất cả các report liên quan đến bài viết là đã xử lý
        UPDATE reported_posts
        SET is_delete = TRUE
        WHERE post_id = post_id_cr;
        -- Thêm thông báo cho người dùng về việc bài viết bị từ chối
        INSERT INTO notifications (user_id, post_id, message, created_at, type)
        VALUES (post_owner, post_id_cr, 'Bài viết của bạn với ID: ' || post_id_cr || ' đã bị từ chối bởi admin do report.', CURRENT_TIMESTAMP, 'report_rejected');
    ELSE
        -- Nếu report không được chấp nhận, chỉ xóa report
		UPDATE reported_posts
        SET is_delete = TRUE
        WHERE id = report_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

select confirm_report(1, 99, true)
select confirm_report(1, 50, true)
select confirm_report(1, 6, false)

-- 8. Đánh dấu thông báo là đã đọc
CREATE OR REPLACE FUNCTION mark_notification_as_read(notification_id INT)
RETURNS VOID AS $$
BEGIN
    -- Đánh dấu thông báo là đã đọc
    UPDATE notifications
    SET is_read = TRUE
    WHERE id = notification_id;
END;
$$ LANGUAGE plpgsql;
-- 
select mark_notification_as_read(434)

-- 9. Trigger xóa thông báo khi đã đọc
CREATE OR REPLACE FUNCTION delete_notification_after_read()
RETURNS TRIGGER AS $$
BEGIN
    -- Xóa thông báo nếu đã đọc
    DELETE FROM notifications
    WHERE id = NEW.id;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_notification_read
AFTER UPDATE OF is_read
ON notifications
FOR EACH ROW
WHEN (NEW.is_read = TRUE)
EXECUTE FUNCTION delete_notification_after_read();

-- 10. Trigger để thông báo comment
CREATE OR REPLACE FUNCTION notify_post_owner_on_comment()
RETURNS TRIGGER AS $$
DECLARE
    post_owner INT;
    comment_user INT;
BEGIN
    -- Lấy thông tin về chủ bài viết
    SELECT user_id INTO post_owner
    FROM posts
    WHERE id = NEW.post_id;

    -- Lấy thông tin về người bình luận
    SELECT user_id INTO comment_user
    FROM comments
    WHERE id = NEW.id;

    -- Chỉ tạo thông báo nếu người bình luận không phải là chủ bài viết
    IF post_owner != comment_user THEN
        -- Thêm thông báo vào bảng notifications
        INSERT INTO notifications (user_id, post_id, message, created_at, type)
        VALUES (post_owner, NEW.post_id, 'Bài viết của bạn với ID: ' || NEW.post_id || ' có bình luận mới.', CURRENT_TIMESTAMP, 'new_comment');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_notify_post_owner_on_comment
AFTER INSERT ON comments
FOR EACH ROW
EXECUTE FUNCTION notify_post_owner_on_comment();

-- Test trigger thong bao cmt den nguoi dung
insert into comments (post_id, user_id, content, created_at, updated_at, is_delete)
values(360,	25,	'test comments new', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false)



-- user đăng bài admin tiếp nhận accept thì thông báo, reject không làm gì không có thông báo
-- admin tiếp nhận report admin confirm report thì thay đổi trang thái post thông báo cho người dùng, không confirm thì xóa
-- user khác comment thì thông báo cho owner 
-- nếu người dùng uy tín thì không có thông báo chỉ có thể tự check qua cờ khi đăng bài thì kh cần admin accept

-- Trigger tự động đánh giá 5 sao của chủ sử hữu vào bài đăng
CREATE OR REPLACE FUNCTION add_vote_by_owner()
RETURNS TRIGGER AS $$
BEGIN
    -- Thêm vote của chủ sở hữu
    INSERT INTO votes (user_id, post_id, value, created_at)
    VALUES (NEW.user_id, NEW.id, 5, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_post_insert
AFTER INSERT ON posts
FOR EACH ROW
EXECUTE FUNCTION add_vote_by_owner();
select create_post(24, 'Test reputation title', 'Test reputation content', 'Test reputation image_url', 'Test reputation location_name', 1)
select create_post(23, 'Test auto vote title new', 'Test auto vote content new', 'Test auto vote image_url new', 'Test auto vote location_name new', 1)


select id, title, content
from posts
where category_id = 1

insert into votes(user_id, post_id, value, created_at)
values (13, 145, 5, CURRENT_TIMESTAMP)




