INSERT INTO categories (category_name) VALUES
('Main Course'),
('Dessert'),
('Beverage'),
('Appetizer'),
('Sticky Rice Dishes'),
('Salad'),
('Soup'),
('Stir-fry'),
('Grilled Dishes'),
('Hot Pot');

-- Thêm dữ liệu vào bảng users
INSERT INTO users (username, first_name, last_name, email, bio, avatar_url, age, is_registered, role_id, is_delete, is_reputations, created_at, updated_at) VALUES
('user1', 'John', 'Doe', 'john@example.com', 'Hello, I am John!', 'avatar1.jpg', 30, true, true, false, false, NOW(), NOW()),
('user2', 'Jane', 'Smith', 'jane@example.com', 'Hi there! I am Jane.', 'avatar2.jpg', 25, true, true, false, false, NOW(), NOW()),
('user3', 'Alice', 'Johnson', 'alice@example.com', 'Nice to meet you!', 'avatar3.jpg', 28, true, true, false, false, NOW(), NOW()),
('user4', 'Michael', 'Brown', 'michael@example.com', 'I love coding!', 'avatar4.jpg', 32, true, true, false, false, NOW(), NOW()),
('user5', 'Emily', 'Jones', 'emily@example.com', 'Travel enthusiast!', 'avatar5.jpg', 27, true, true, false, false, NOW(), NOW()),
('user6', 'David', 'Wilson', 'david@example.com', 'Food lover!', 'avatar6.jpg', 35, true, true, false, false, NOW(), NOW()),
('user7', 'Emma', 'Martinez', 'emma@example.com', 'Coffee addict!', 'avatar7.jpg', 29, true, true, false, false, NOW(), NOW()),
('user8', 'Daniel', 'Taylor', 'daniel@example.com', 'Fitness freak!', 'avatar8.jpg', 31, true, true, false, false, NOW(), NOW()),
('user9', 'Olivia', 'Garcia', 'olivia@example.com', 'Bookworm!', 'avatar9.jpg', 26, true, true, false, false, NOW(), NOW()),
('user10', 'James', 'Rodriguez', 'james@example.com', 'Music lover!', 'avatar10.jpg', 33, true, true, false, false, NOW(), NOW()),
('user11', 'Sophia', 'Hernandez', 'sophia@example.com', 'Nature enthusiast!', 'avatar11.jpg', 28, true, true, false, false, NOW(), NOW()),
('user12', 'William', 'Lopez', 'william@example.com', 'Pet lover!', 'avatar12.jpg', 30, true, true, false, false, NOW(), NOW()),
('user13', 'Isabella', 'Martinez', 'isabella@example.com', 'Photography lover!', 'avatar13.jpg', 29, true, true, false, false, NOW(), NOW()),
('user14', 'Ethan', 'Flores', 'ethan@example.com', 'Movie buff!', 'avatar14.jpg', 34, true, true, false, false, NOW(), NOW()),
('user15', 'Mia', 'King', 'mia@example.com', 'Art enthusiast!', 'avatar15.jpg', 27, true, true, false, false, NOW(), NOW()),
('user16', 'Alexander', 'Young', 'alexander@example.com', 'Gamer!', 'avatar16.jpg', 32, true, true, false, false, NOW(), NOW()),
('user17', 'Ava', 'Scott', 'ava@example.com', 'Fashionista!', 'avatar17.jpg', 28, true, true, false, false, NOW(), NOW()),
('user18', 'Benjamin', 'Nguyen', 'benjamin@example.com', 'Tech geek!', 'avatar18.jpg', 31, true, true, false, false, NOW(), NOW()),
('user19', 'Charlotte', 'Chen', 'charlotte@example.com', 'Wanderlust!', 'avatar19.jpg', 30, true, true, false, false, NOW(), NOW()),
('user20', 'Lucas', 'Wang', 'lucas@example.com', 'Fitness enthusiast!', 'avatar20.jpg', 29, true, true, false, false, NOW(), NOW());


-- Thêm dữ liệu vào bảng posts
INSERT INTO posts (user_id, title, content, image_url, location_name, category_id, created_at, updated_at, is_delete, is_approved) VALUES
(1, 'Amazing Recipe', 'Check out this delicious recipe!', 'recipe1.jpg', 'Kitchen', 1, NOW(), NOW(), false, true),
(2, 'Tasty Dessert', 'Indulge in this mouthwatering dessert!', 'dessert1.jpg', 'Bakery', 2, NOW(), NOW(), false, true),
(3, 'Exploring New Destination', 'Adventures await at this beautiful destination!', 'destination1.jpg', 'Beach', 3, NOW(), NOW(), false, true),
(4, 'Healthy Breakfast', 'Start your day with this nutritious breakfast!', 'breakfast1.jpg', 'Home', 1, NOW(), NOW(), false, true),
(5, 'Cozy Coffee Shop', 'Discover the best coffee spots in town!', 'coffee1.jpg', 'Coffee Shop', 3, NOW(), NOW(), false, true),
(6, 'Outdoor Adventure', 'Embark on an exciting outdoor adventure!', 'outdoor1.jpg', 'Mountains', 4, NOW(), NOW(), false, true),
(7, 'Summer Salad', 'Enjoy the fresh flavors of summer with this delicious salad!', 'salad1.jpg', 'Garden', 2, NOW(), NOW(), false, true),
(8, 'Family Dinner', 'Gather around the table for a hearty family dinner!', 'dinner1.jpg', 'Home', 1, NOW(), NOW(), false, true),
(9, 'Relaxing Getaway', 'Escape to a tranquil getaway for ultimate relaxation!', 'getaway1.jpg', 'Resort', 3, NOW(), NOW(), false, true),
(10, 'Homemade Pizza Night', 'Make pizza night a family tradition with this homemade recipe!', 'pizza1.jpg', 'Kitchen', 1, NOW(), NOW(), false, true),
(11, 'Sushi Feast', 'Indulge in a sushi feast with the freshest ingredients!', 'sushi1.jpg', 'Restaurant', 5, NOW(), NOW(), false, true),
(12, 'Weekend Brunch', 'Brunch like a boss with these mouthwatering dishes!', 'brunch1.jpg', 'Café', 2, NOW(), NOW(), false, true),
(13, 'Mountain Hike', 'Take in breathtaking views on a scenic mountain hike!', 'hike1.jpg', 'Mountain', 4, NOW(), NOW(), false, true),
(14, 'Healthy Smoothie', 'Kickstart your day with a refreshing and nutritious smoothie!', 'smoothie1.jpg', 'Home', 1, NOW(), NOW(), false, true),
(15, 'Street Food Adventure', 'Explore the vibrant street food scene in the city!', 'streetfood1.jpg', 'City', 6, NOW(), NOW(), false, true),
(16, 'Picnic in the Park', 'Enjoy a relaxing picnic in the park with friends and family!', 'picnic1.jpg', 'Park', 7, NOW(), NOW(), false, true),
(17, 'Weekend Getaway', 'Escape the hustle and bustle with a weekend getaway to the countryside!', 'weekend1.jpg', 'Countryside', 3, NOW(), NOW(), false, true),
(18, 'Authentic Italian Pasta', 'Experience the flavors of Italy with this authentic pasta dish!', 'pasta1.jpg', 'Restaurant', 5, NOW(), NOW(), false, true),
(19, 'BBQ Party', 'Fire up the grill and host the ultimate BBQ party!', 'bbq1.jpg', 'Backyard', 8, NOW(), NOW(), false, true),
(20, 'Healthy Snacks', 'Satisfy your cravings with these guilt-free healthy snacks!', 'snacks1.jpg', 'Home', 1, NOW(), NOW(), false, true),
(1, 'Cocktail Hour', 'Mix up some delicious cocktails and unwind after a long day!', 'cocktails1.jpg', 'Bar', 9, NOW(), NOW(), false, true),
(2, 'Weekend Road Trip', 'Hit the open road and embark on an epic weekend road trip!', 'roadtrip1.jpg', 'Various', 10, NOW(), NOW(), false, true),
(3, 'Gourmet Burger', 'Sink your teeth into a juicy gourmet burger loaded with all the fixings!', 'burger1.jpg', 'Restaurant', 5, NOW(), NOW(), false, true),
(4, 'Healthy Meal Prep', 'Simplify your week with these easy and nutritious meal prep ideas!', 'mealprep1.jpg', 'Kitchen', 1, NOW(), NOW(), false, true),
(5, 'Scenic Bike Ride', 'Explore picturesque landscapes on a scenic bike ride!', 'bikeride1.jpg', 'Countryside', 10, NOW(), NOW(), false, true),
(6, 'Date Night Dinner', 'Impress your date with a romantic dinner at home!', 'datenight1.jpg', 'Home', 1, NOW(), NOW(), false, true),
(7, 'Yoga Retreat', 'Rejuvenate your mind, body, and soul with a relaxing yoga retreat!', 'yogaretreat1.jpg', 'Retreat Center', 9, NOW(), NOW(), false, true),
(8, 'Tropical Paradise', 'Escape to a tropical paradise and unwind on pristine beaches!', 'tropical1.jpg', 'Beach Resort', 3, NOW(), NOW(), false, true);


-- Thêm dữ liệu vào bảng reactions
INSERT INTO reactions (post_id, user_id, reaction_type, created_at, updated_at)
SELECT 
    FLOOR(RANDOM() * 28) + 1 AS post_id,
    FLOOR(RANDOM() * 20) + 1 AS user_id,
    CASE 
        WHEN RANDOM() < 0.3 THEN 'like'
        WHEN RANDOM() < 0.5 THEN 'dislike'
        WHEN RANDOM() < 0.6 THEN 'love'
        WHEN RANDOM() < 0.7 THEN 'haha'
        WHEN RANDOM() < 0.8 THEN 'wow'
        WHEN RANDOM() < 0.9 THEN 'sad'
        ELSE 'angry'
    END AS reaction_type,
    NOW() AS created_at,
    NOW() AS updated_at
FROM
    information_schema.tables
LIMIT 30;

-- Thêm dữ liệu vào bảng saved_posts
INSERT INTO saved_posts (user_id, post_id, saved_at)
SELECT 
    (FLOOR(RANDOM() * 20) + 1)::INT AS user_id,
    (FLOOR(RANDOM() * 28) + 1)::INT AS post_id,
    NOW() AS saved_at
FROM
    information_schema.tables
LIMIT 10;

-- Thêm dữ liệu vào bảng votes
INSERT INTO votes (user_id, post_id, value, created_at)
SELECT 
    (FLOOR(RANDOM() * 20) + 1)::INT AS user_id,
    (FLOOR(RANDOM() * 28) + 1)::INT AS post_id,
    (FLOOR(RANDOM() * 5) + 1)::INT AS value,
    NOW() AS created_at
FROM
    information_schema.tables
LIMIT 28;

-- Thêm dữ liệu vào bảng comments
INSERT INTO comments (post_id, user_id, content, parent_comment_id, created_at, updated_at)
SELECT 
    (FLOOR(RANDOM() * 28) + 1)::INT AS post_id,
    (FLOOR(RANDOM() * 20) + 1)::INT AS user_id,
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' AS content,
    NULL AS parent_comment_id,
    NOW() AS created_at,
    NOW() AS updated_at
FROM
    information_schema.tables
LIMIT 30;






	   