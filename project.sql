-- Tạo tables users, categories, posts, reactions, comments, votes, reported_posts, saved_posts, notifications
-- Table: users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    bio VARCHAR(100),
    avatar_url VARCHAR(50),
    age SMALLINT,
    is_registered BOOLEAN DEFAULT true,
    role_id BOOLEAN, -- 1 là user, 0 là admin
    is_delete BOOLEAN DEFAULT false,
    is_reputations BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
	password varchar(20)
);

-- Table: categories
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Table: posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    content TEXT,
    image_url VARCHAR(50),
    location_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    is_delete BOOLEAN DEFAULT false,
    is_approved BOOLEAN DEFAULT false,
    category_id INT REFERENCES categories(id)
);

-- Table: reactions
CREATE TABLE reactions (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    user_id INT REFERENCES users(id),
    reaction_type VARCHAR(20) NOT NULL CHECK (reaction_type IN ('like', 'dislike')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, post_id, reaction_type)
);

-- Table: comments
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    user_id INT REFERENCES users(id),
    content VARCHAR(400) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    is_delete BOOLEAN DEFAULT false
);

-- Table: reported_posts
CREATE TABLE reported_posts (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    user_id INT REFERENCES users(id),
    report_reason VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_delete BOOLEAN DEFAULT false
);

-- Table: votes
CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id),
    value SMALLINT, -- 1, 2, 3, 4, 5
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, post_id)
);

-- Table: saved_posts
CREATE TABLE saved_posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id),
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, post_id)
);

-- Table: notifications
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    type VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

--  Đã tạo tables xong

--  Thêm dữ liệu cho bảng
-- Thêm dữ liệu cho bảng users
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('mmarks0', 'Madel', 'Marks', 'mmarks0@biglobe.ne.jp', 'This is a bio', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 21, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'sB5$pBe7');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('klanglois1', 'Karalynn', 'Langlois', 'klanglois1@goodreads.com', 'This is a bio', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 28, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'wL5<>pE7gQ''XlE');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('samps2', 'Shea', 'Amps', 'samps2@ucoz.ru', 'This is a bio', 'http://dummyimage.com/214x100.png/cc0000/ffffff', 38, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'iA5''ZV=7?EWXcR');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('sferrolli3', 'Stephanus', 'Ferrolli', 'sferrolli3@delicious.com', 'This is a bio', 'http://dummyimage.com/248x100.png/cc0000/ffffff', 34, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'fC0_?O1y<leqbQE');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('splacide4', 'Shandie', 'Placide', 'splacide4@tinypic.com', 'This is a bio', 'http://dummyimage.com/234x100.png/dddddd/000000', 31, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'wM9%Euw.A>p\tS');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('cdruett5', 'Constantino', 'Druett', 'cdruett5@meetup.com', 'This is a bio', 'http://dummyimage.com/108x100.png/cc0000/ffffff', 20, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'wA9>)''m207Nb');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('harpe6', 'Harwilll', 'Arpe', 'harpe6@marriott.com', 'This is a bio', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 25, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'iL3{OipO0');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('tbyham7', 'Tallie', 'Byham', 'tbyham7@bing.com', 'This is a bio', 'http://dummyimage.com/228x100.png/ff4444/ffffff', 35, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'cB6!)bf0GnOH6C#|');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('eingre8', 'Eada', 'Ingre', 'eingre8@wikipedia.org', 'This is a bio', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 34, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'yQ7*YMu8haPw');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('lgandrich9', 'Lynea', 'Gandrich', 'lgandrich9@globo.com', 'This is a bio', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 39, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'kG1|?p@DMJxR2@6~');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('mzorenera', 'Margette', 'Zorener', 'mzorenera@cbc.ca', 'This is a bio', 'http://dummyimage.com/116x100.png/dddddd/000000', 29, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oR7+uFqUCQVT?hfw');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('dfenelonb', 'Delphinia', 'Fenelon', 'dfenelonb@who.int', 'This is a bio', 'http://dummyimage.com/208x100.png/cc0000/ffffff', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oY8<ysD=ETe');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ssymersc', 'Sonia', 'Symers', 'ssymersc@bravesites.com', 'This is a bio', 'http://dummyimage.com/242x100.png/ff4444/ffffff', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'pC4%+=JnL');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ybranthwaited', 'Yoshi', 'Branthwaite', 'ybranthwaited@nymag.com', 'This is a bio', 'http://dummyimage.com/190x100.png/cc0000/ffffff', 18, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'kH0\PYX"@)~%1x');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jugolottie', 'Jennica', 'Ugolotti', 'jugolottie@sun.com', 'This is a bio', 'http://dummyimage.com/151x100.png/cc0000/ffffff', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'rS7~|{mP5');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ameddf', 'Arnold', 'Medd', 'ameddf@statcounter.com', 'This is a bio', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 30, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'uB5)4jO>~4#$`O');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('aoharneyg', 'Arliene', 'O''Harney', 'aoharneyg@nyu.edu', 'This is a bio', 'http://dummyimage.com/222x100.png/5fa2dd/ffffff', 28, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'jP0,k$k8/jJf.i"c');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('odupoyh', 'Oswald', 'Dupoy', 'odupoyh@godaddy.com', 'This is a bio', 'http://dummyimage.com/112x100.png/dddddd/000000', 27, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oM3%sh''q5%!"');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('lcarlissoi', 'Leicester', 'Carlisso', 'lcarlissoi@unblog.fr', 'This is a bio', 'http://dummyimage.com/216x100.png/ff4444/ffffff', 33, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'lO6_,|7p|mDBaI4');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jchallacej', 'Justina', 'Challace', 'jchallacej@eepurl.com', 'This is a bio', 'http://dummyimage.com/142x100.png/dddddd/000000', 28, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'fZ6?Q<JrgH');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ksiddaleyk', 'Kerry', 'Siddaley', 'ksiddaleyk@businessweek.com', 'This is a bio', 'http://dummyimage.com/144x100.png/5fa2dd/ffffff', 31, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'tF8`Ga9dDe\bYN>8');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('dhaineyl', 'Dickie', 'Hainey`', 'dhaineyl@dion.ne.jp', 'This is a bio', 'http://dummyimage.com/189x100.png/dddddd/000000', 28, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oL8&HdgG0"a');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('mgleetonm', 'Mariellen', 'Gleeton', 'mgleetonm@discuz.net', 'This is a bio', 'http://dummyimage.com/248x100.png/5fa2dd/ffffff', 27, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'zQ1%IrS2o9++62');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('fmurleyn', 'Florencia', 'Murley', 'fmurleyn@networkadvertising.org', 'This is a bio', 'http://dummyimage.com/213x100.png/cc0000/ffffff', 21, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'vD8<TjOwyu');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ggippo', 'Glynda', 'Gipp', 'ggippo@acquirethisname.com', 'This is a bio', 'http://dummyimage.com/132x100.png/ff4444/ffffff', 38, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'qJ1<Met4`');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('cfurnissp', 'Chloris', 'Furniss', 'cfurnissp@netlog.com', 'This is a bio', 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 18, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'rB1_uFbg''');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('rsnazelq', 'Rudd', 'Snazel', 'rsnazelq@nbcnews.com', 'This is a bio', 'http://dummyimage.com/138x100.png/dddddd/000000', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'yT0%$k9jh2B');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ojestr', 'Oralle', 'Jest', 'ojestr@upenn.edu', 'This is a bio', 'http://dummyimage.com/149x100.png/5fa2dd/ffffff', 32, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'fF4?fYJ1,<B#.');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('aackerss', 'Ashlie', 'Ackers', 'aackerss@arizona.edu', 'This is a bio', 'http://dummyimage.com/133x100.png/dddddd/000000', 31, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'lF2)D#I_m');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('vcaccavarit', 'Vere', 'Caccavari', 'vcaccavarit@ycombinator.com', 'This is a bio', 'http://dummyimage.com/142x100.png/ff4444/ffffff', 22, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'gV8)1uz8DDY7');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('bsimsonu', 'Benny', 'Simson', 'bsimsonu@themeforest.net', 'This is a bio', 'http://dummyimage.com/174x100.png/ff4444/ffffff', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'rS2?q?Z,2KmV&g');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('fbullenv', 'Feliks', 'Bullen', 'fbullenv@netlog.com', 'This is a bio', 'http://dummyimage.com/178x100.png/ff4444/ffffff', 36, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'yS5.t9xRj8Te?');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('calvaradow', 'Chandler', 'Alvarado', 'calvaradow@vinaora.com', 'This is a bio', 'http://dummyimage.com/207x100.png/5fa2dd/ffffff', 22, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'nV7@eK/|d<ad');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jquyex', 'Joni', 'Quye', 'jquyex@ebay.co.uk', 'This is a bio', 'http://dummyimage.com/207x100.png/5fa2dd/ffffff', 32, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'fN4.=yv&');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('gzanuttiy', 'Gualterio', 'Zanutti', 'gzanuttiy@sakura.ne.jp', 'This is a bio', 'http://dummyimage.com/199x100.png/ff4444/ffffff', 33, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'nY1~Z"zt9C');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ldillewayz', 'Lauralee', 'Dilleway', 'ldillewayz@elegantthemes.com', 'This is a bio', 'http://dummyimage.com/151x100.png/5fa2dd/ffffff', 20, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'rT5|$6/r');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jstreak10', 'Jackie', 'Streak', 'jstreak10@vk.com', 'This is a bio', 'http://dummyimage.com/218x100.png/dddddd/000000', 23, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'fG9~Q9aO\g');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('csurgison11', 'Carlen', 'Surgison', 'csurgison11@amazonaws.com', 'This is a bio', 'http://dummyimage.com/218x100.png/dddddd/000000', 26, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'vR7}pKU}PGj');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('sbudgeon12', 'Sharleen', 'Budgeon', 'sbudgeon12@slashdot.org', 'This is a bio', 'http://dummyimage.com/119x100.png/ff4444/ffffff', 39, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'bL8@W/lmr)f}');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jsteptowe13', 'Janice', 'Steptowe', 'jsteptowe13@fda.gov', 'This is a bio', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 28, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mC1&EJ3m');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('csproson14', 'Cora', 'Sproson', 'csproson14@oaic.gov.au', 'This is a bio', 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 22, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'tZ9%w(Io16CB|acq');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('mmatelyunas15', 'Murielle', 'Matelyunas', 'mmatelyunas15@discovery.com', 'This is a bio', 'http://dummyimage.com/169x100.png/dddddd/000000', 25, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oW0)ARrz{');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('mdackombe16', 'Miranda', 'Dackombe', 'mdackombe16@prnewswire.com', 'This is a bio', 'http://dummyimage.com/106x100.png/5fa2dd/ffffff', 40, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'zZ1!tyyL');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ehurles17', 'Elana', 'Hurles', 'ehurles17@soundcloud.com', 'This is a bio', 'http://dummyimage.com/104x100.png/cc0000/ffffff', 35, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'dL8\%$1ISx');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('aarndt18', 'Aldridge', 'Arndt', 'aarndt18@hp.com', 'This is a bio', 'http://dummyimage.com/174x100.png/cc0000/ffffff', 25, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'nW3!6h%LIZ');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('jmallows19', 'Jacqui', 'Mallows', 'jmallows19@cargocollective.com', 'This is a bio', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 28, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'dS5_Dw0/ZC9+wqV');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('ohenrion1a', 'Odie', 'Henrion', 'ohenrion1a@ow.ly', 'This is a bio', 'http://dummyimage.com/171x100.png/cc0000/ffffff', 34, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'yA8,7z">B6KBf}');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('cbriddle1b', 'Cesaro', 'Briddle', 'cbriddle1b@sakura.ne.jp', 'This is a bio', 'http://dummyimage.com/189x100.png/dddddd/000000', 37, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'mU1}O_njfU{EE');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('sdumelow1c', 'Shae', 'Dumelow', 'sdumelow1c@rakuten.co.jp', 'This is a bio', 'http://dummyimage.com/215x100.png/cc0000/ffffff', 38, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'aD0_17LtIOA');
insert into users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('fgresswell1d', 'Freddy', 'Gresswell', 'fgresswell1d@amazon.com', 'This is a bio', 'http://dummyimage.com/231x100.png/cc0000/ffffff', 29, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'uG3"uJ5k{a+k"`l');
-- Thêm xong bảng users

-- Thêm dữ liệu cho bảng categories
insert into categories (category_name)
values ('Noodles'),
('Pho'),
('Rice'),
('Vermicelli'),
('Hu Tieu'),
('Sandwiches'),
('Salads'),
('Soft Drinks'),
('Coofee'),
('Tea')
-- Thêm xong bảng categories

-- Thêm dữ liệu cho bảng posts
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'http://dummyimage.com/134x100.png/dddddd/000000', '4 Bluejay Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/242x100.png/5fa2dd/ffffff', '285 Moose Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/248x100.png/ff4444/ffffff', '11 Spaight Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/191x100.png/5fa2dd/ffffff', '94450 Westport Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/242x100.png/ff4444/ffffff', '3 Lindbergh Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (42, 'This is a title', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', '396 Forest Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/133x100.png/5fa2dd/ffffff', '678 Barnett Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/233x100.png/5fa2dd/ffffff', '65787 Independence Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/198x100.png/ff4444/ffffff', '3 Eagan Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (42, 'This is a title', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/164x100.png/cc0000/ffffff', '49017 Hollow Ridge Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (27, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', '20359 Hallows Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (34, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', '75 Havey Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (36, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/246x100.png/cc0000/ffffff', '07 Coleman Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/121x100.png/cc0000/ffffff', '08 Jana Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/155x100.png/ff4444/ffffff', '98 Karstens Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/104x100.png/5fa2dd/ffffff', '06 Mayer Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (22, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/244x100.png/ff4444/ffffff', '41567 Parkside Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/106x100.png/cc0000/ffffff', '84 Declaration Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (34, 'This is a title', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/170x100.png/dddddd/000000', '56 Grasskamp Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/164x100.png/cc0000/ffffff', '9674 Hagan Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', '50 Schurz Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (49, 'This is a title', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/198x100.png/5fa2dd/ffffff', '4 Hudson Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/152x100.png/cc0000/ffffff', '90863 Tennessee Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/170x100.png/dddddd/000000', '70242 Kipling Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (34, 'This is a title', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/202x100.png/dddddd/000000', '332 Melvin Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (49, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/226x100.png/dddddd/000000', '62 Butterfield Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/185x100.png/5fa2dd/ffffff', '7600 Schurz Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (33, 'This is a title', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/248x100.png/cc0000/ffffff', '7 8th Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/211x100.png/5fa2dd/ffffff', '2249 Bobwhite Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/147x100.png/ff4444/ffffff', '55870 Montana Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/179x100.png/dddddd/000000', '38 Lillian Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/115x100.png/dddddd/000000', '07346 Randy Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', '20 2nd Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (24, 'This is a title', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/143x100.png/5fa2dd/ffffff', '3439 Veith Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/134x100.png/cc0000/ffffff', '6768 Rieder Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/131x100.png/cc0000/ffffff', '664 Gale Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', '5988 Elmside Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/238x100.png/5fa2dd/ffffff', '12 Holy Cross Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (49, 'This is a title', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/168x100.png/dddddd/000000', '65534 Wayridge Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/177x100.png/ff4444/ffffff', '887 Mitchell Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/103x100.png/ff4444/ffffff', '155 Jay Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (38, 'This is a title', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/191x100.png/ff4444/ffffff', '02959 Mandrake Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/247x100.png/cc0000/ffffff', '6 Talisman Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/241x100.png/dddddd/000000', '8668 Fordem Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (48, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', '465 Stone Corner Trail', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/132x100.png/cc0000/ffffff', '3763 Judy Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (33, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/132x100.png/dddddd/000000', '14 Old Shore Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/149x100.png/dddddd/000000', '51645 6th Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/226x100.png/ff4444/ffffff', '39519 Armistice Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/129x100.png/ff4444/ffffff', '28 Carpenter Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (29, 'This is a title', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/166x100.png/cc0000/ffffff', '16499 Forest Dale Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/222x100.png/ff4444/ffffff', '4695 Harper Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/134x100.png/cc0000/ffffff', '5 Sunnyside Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/239x100.png/dddddd/000000', '9 Onsgard Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/120x100.png/dddddd/000000', '4257 Hoard Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', '17914 Kings Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/166x100.png/5fa2dd/ffffff', '60 Corben Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/119x100.png/cc0000/ffffff', '9950 Prairieview Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/221x100.png/cc0000/ffffff', '94251 Moulton Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/128x100.png/ff4444/ffffff', '0 Onsgard Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/242x100.png/ff4444/ffffff', '45368 Clarendon Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/184x100.png/ff4444/ffffff', '44 Marquette Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/117x100.png/dddddd/000000', '605 Bayside Trail', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/101x100.png/cc0000/ffffff', '96320 Prairieview Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/149x100.png/dddddd/000000', '32 Homewood Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/115x100.png/dddddd/000000', '8 Morrow Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/181x100.png/cc0000/ffffff', '175 Muir Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/160x100.png/cc0000/ffffff', '64 Dawn Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/142x100.png/cc0000/ffffff', '934 Luster Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/165x100.png/dddddd/000000', '6 Ruskin Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/179x100.png/ff4444/ffffff', '34175 Kenwood Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/231x100.png/cc0000/ffffff', '2767 Helena Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (48, 'This is a title', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/209x100.png/cc0000/ffffff', '74 Daystar Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (22, 'This is a title', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/238x100.png/dddddd/000000', '4 Stang Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (26, 'This is a title', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/101x100.png/cc0000/ffffff', '53 Red Cloud Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/202x100.png/cc0000/ffffff', '96646 Fairfield Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (38, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/157x100.png/cc0000/ffffff', '67 Glendale Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/198x100.png/cc0000/ffffff', '990 Debs Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/250x100.png/5fa2dd/ffffff', '5856 School Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/134x100.png/dddddd/000000', '7 Carberry Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/165x100.png/dddddd/000000', '5973 Leroy Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (49, 'This is a title', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/140x100.png/cc0000/ffffff', '92089 Butterfield Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (49, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/167x100.png/cc0000/ffffff', '086 Crowley Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', '23106 Sundown Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/224x100.png/5fa2dd/ffffff', '3 Pennsylvania Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/124x100.png/cc0000/ffffff', '83 Springview Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/199x100.png/ff4444/ffffff', '44 Eagan Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/248x100.png/dddddd/000000', '18100 Lakewood Gardens Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/162x100.png/cc0000/ffffff', '9177 Nobel Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/172x100.png/5fa2dd/ffffff', '79761 Fairfield Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/175x100.png/dddddd/000000', '00 Burning Wood Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (22, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/146x100.png/5fa2dd/ffffff', '18 Straubel Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (24, 'This is a title', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/187x100.png/5fa2dd/ffffff', '88472 Anniversary Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff', '76 Milwaukee Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/203x100.png/dddddd/000000', '605 Carberry Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/163x100.png/ff4444/ffffff', '9 Jenna Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (48, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/148x100.png/ff4444/ffffff', '99 Summit Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (27, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/144x100.png/5fa2dd/ffffff', '64 High Crossing Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/238x100.png/cc0000/ffffff', '3910 Fairfield Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/236x100.png/ff4444/ffffff', '1 Surrey Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (22, 'This is a title', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/134x100.png/cc0000/ffffff', '7 Gulseth Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/108x100.png/5fa2dd/ffffff', '050 Jay Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/189x100.png/5fa2dd/ffffff', '8 Continental Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/141x100.png/5fa2dd/ffffff', '0 Kipling Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/174x100.png/ff4444/ffffff', '21525 Loomis Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', '9 Doe Crossing Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/184x100.png/ff4444/ffffff', '41 Colorado Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (38, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/247x100.png/cc0000/ffffff', '03 Vera Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', '8602 Oakridge Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/242x100.png/cc0000/ffffff', '5780 Pine View Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/140x100.png/5fa2dd/ffffff', '5203 Haas Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/222x100.png/ff4444/ffffff', '46 Donald Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (29, 'This is a title', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/199x100.png/5fa2dd/ffffff', '5 Bultman Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', '411 Vidon Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/156x100.png/ff4444/ffffff', '677 Morningstar Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (38, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/189x100.png/ff4444/ffffff', '85060 North Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (33, 'This is a title', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/242x100.png/ff4444/ffffff', '7941 Toban Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (48, 'This is a title', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/245x100.png/dddddd/000000', '364 Coolidge Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/111x100.png/5fa2dd/ffffff', '03935 Gale Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff', '0 Delladonna Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/245x100.png/dddddd/000000', '41 Morning Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (42, 'This is a title', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/230x100.png/ff4444/ffffff', '59 Cambridge Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'http://dummyimage.com/173x100.png/cc0000/ffffff', '66 Nevada Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/190x100.png/cc0000/ffffff', '30140 Homewood Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/155x100.png/ff4444/ffffff', '58 Bobwhite Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/193x100.png/ff4444/ffffff', '097 Holmberg Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/213x100.png/cc0000/ffffff', '42 Carpenter Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (26, 'This is a title', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/108x100.png/dddddd/000000', '20 Morrow Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (26, 'This is a title', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/139x100.png/cc0000/ffffff', '1078 Tomscot Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/237x100.png/dddddd/000000', '71 Crowley Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (24, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/115x100.png/dddddd/000000', '9 Banding Street', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/240x100.png/ff4444/ffffff', '53 Armistice Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/241x100.png/ff4444/ffffff', '0759 Saint Paul Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/135x100.png/dddddd/000000', '8858 Ludington Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/235x100.png/cc0000/ffffff', '43042 Lotheville Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/232x100.png/dddddd/000000', '80 Northview Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/124x100.png/5fa2dd/ffffff', '93 Walton Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/180x100.png/ff4444/ffffff', '51469 Sachs Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/200x100.png/cc0000/ffffff', '6694 Dapin Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/122x100.png/dddddd/000000', '1 Park Meadow Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/108x100.png/dddddd/000000', '534 Waxwing Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '66612 Gulseth Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/200x100.png/cc0000/ffffff', '76024 Eggendart Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (42, 'This is a title', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/108x100.png/dddddd/000000', '93693 Sloan Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/208x100.png/cc0000/ffffff', '9435 Hooker Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (21, 'This is a title', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/120x100.png/5fa2dd/ffffff', '099 Northland Lane', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/118x100.png/cc0000/ffffff', '354 Lillian Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/101x100.png/5fa2dd/ffffff', '9 Gateway Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (34, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/146x100.png/ff4444/ffffff', '4 Mesta Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/212x100.png/5fa2dd/ffffff', '8447 Tennyson Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/101x100.png/dddddd/000000', '0 Pine View Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/186x100.png/cc0000/ffffff', '90168 Forest Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/138x100.png/cc0000/ffffff', '8586 Pawling Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/200x100.png/dddddd/000000', '64 Sheridan Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/228x100.png/cc0000/ffffff', '646 Stang Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 1);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/164x100.png/5fa2dd/ffffff', '9 Canary Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/209x100.png/cc0000/ffffff', '1306 Schiller Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/160x100.png/5fa2dd/ffffff', '19206 Roth Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (46, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/139x100.png/ff4444/ffffff', '10413 Hauk Crossing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (36, 'This is a title', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/150x100.png/5fa2dd/ffffff', '0 Coolidge Point', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/212x100.png/dddddd/000000', '9 West Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/244x100.png/cc0000/ffffff', '392 Ridge Oak Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/141x100.png/dddddd/000000', '48948 Garrison Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/136x100.png/dddddd/000000', '9358 Haas Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (36, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/131x100.png/ff4444/ffffff', '0001 Morning Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/221x100.png/5fa2dd/ffffff', '69974 Service Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/170x100.png/ff4444/ffffff', '92516 David Court', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (26, 'This is a title', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/165x100.png/ff4444/ffffff', '59250 Ridgeview Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/110x100.png/dddddd/000000', '85814 Macpherson Trail', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (42, 'This is a title', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/154x100.png/dddddd/000000', '8399 Basil Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 9);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (34, 'This is a title', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/244x100.png/cc0000/ffffff', '221 Mandrake Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/102x100.png/dddddd/000000', '24 Carioca Trail', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/147x100.png/ff4444/ffffff', '365 Grover Junction', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/193x100.png/ff4444/ffffff', '7640 Ohio Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/186x100.png/cc0000/ffffff', '54 Kinsman Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (26, 'This is a title', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/246x100.png/cc0000/ffffff', '18 Sutteridge Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (44, 'This is a title', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/129x100.png/dddddd/000000', '914 Superior Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (43, 'This is a title', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/168x100.png/dddddd/000000', '77 Comanche Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (29, 'This is a title', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/224x100.png/cc0000/ffffff', '6 Moose Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (35, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/162x100.png/cc0000/ffffff', '24246 Messerschmidt Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (30, 'This is a title', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/231x100.png/cc0000/ffffff', '2 Ryan Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/118x100.png/dddddd/000000', '853 Anzinger Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/173x100.png/cc0000/ffffff', '10 Cottonwood Plaza', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 7);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (31, 'This is a title', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', '01 Sloan Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/247x100.png/ff4444/ffffff', '26361 Spenser Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (47, 'This is a title', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/189x100.png/5fa2dd/ffffff', '881 Charing Cross Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (45, 'This is a title', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/111x100.png/5fa2dd/ffffff', '1 Lawn Park', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (37, 'This is a title', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/180x100.png/ff4444/ffffff', '49843 Loomis Pass', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (50, 'This is a title', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/144x100.png/cc0000/ffffff', '6180 Karstens Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/195x100.png/5fa2dd/ffffff', '61 Canary Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (40, 'This is a title', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/165x100.png/ff4444/ffffff', '3 Loeprich Parkway', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 10);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (39, 'This is a title', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/135x100.png/ff4444/ffffff', '2426 Little Fleur Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 6);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (23, 'This is a title', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/116x100.png/ff4444/ffffff', '80 Mcguire Alley', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (22, 'This is a title', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/139x100.png/ff4444/ffffff', '808 Morning Place', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (28, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', '4444 Mendota Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (38, 'This is a title', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/180x100.png/cc0000/ffffff', '72146 Bluestem Hill', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 4);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (25, 'This is a title', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/233x100.png/dddddd/000000', '80303 Laurel Terrace', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 3);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', '79 Becker Circle', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, true, 8);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (32, 'This is a title', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/244x100.png/ff4444/ffffff', '85 Atwood Drive', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 2);
insert into posts (user_id, title, content, image_url, location_name, created_at, updated_at, is_delete, is_approved, category_id) values (41, 'This is a title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/103x100.png/dddddd/000000', '17 Russell Way', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, false, 5);
-- Thêm xong bảng post

-- Thêm dữ liệu cho bảng reactions
insert into reactions (post_id, user_id, reaction_type) values (138, 12, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (190, 38, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (62, 19, 'like');
insert into reactions (post_id, user_id, reaction_type) values (77, 50, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (102, 34, 'like');
insert into reactions (post_id, user_id, reaction_type) values (36, 24, 'like');
insert into reactions (post_id, user_id, reaction_type) values (58, 31, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (37, 27, 'like');
insert into reactions (post_id, user_id, reaction_type) values (144, 14, 'like');
insert into reactions (post_id, user_id, reaction_type) values (193, 26, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (143, 32, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (16, 22, 'like');
insert into reactions (post_id, user_id, reaction_type) values (15, 47, 'like');
insert into reactions (post_id, user_id, reaction_type) values (124, 17, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (167, 25, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (74, 22, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (196, 23, 'like');
insert into reactions (post_id, user_id, reaction_type) values (100, 29, 'like');
insert into reactions (post_id, user_id, reaction_type) values (1, 17, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (111, 24, 'like');
insert into reactions (post_id, user_id, reaction_type) values (199, 39, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (188, 20, 'like');
insert into reactions (post_id, user_id, reaction_type) values (96, 40, 'like');
insert into reactions (post_id, user_id, reaction_type) values (153, 11, 'like');
insert into reactions (post_id, user_id, reaction_type) values (25, 13, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (27, 45, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (62, 35, 'like');
insert into reactions (post_id, user_id, reaction_type) values (59, 22, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (99, 35, 'like');
insert into reactions (post_id, user_id, reaction_type) values (21, 29, 'like');
insert into reactions (post_id, user_id, reaction_type) values (16, 33, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (130, 40, 'like');
insert into reactions (post_id, user_id, reaction_type) values (81, 11, 'like');
insert into reactions (post_id, user_id, reaction_type) values (63, 29, 'like');
insert into reactions (post_id, user_id, reaction_type) values (52, 23, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (121, 12, 'like');
insert into reactions (post_id, user_id, reaction_type) values (179, 21, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (38, 35, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (101, 28, 'like');
insert into reactions (post_id, user_id, reaction_type) values (48, 11, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (130, 16, 'like');
insert into reactions (post_id, user_id, reaction_type) values (189, 15, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (137, 46, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (62, 18, 'like');
insert into reactions (post_id, user_id, reaction_type) values (67, 49, 'like');
insert into reactions (post_id, user_id, reaction_type) values (157, 30, 'like');
insert into reactions (post_id, user_id, reaction_type) values (1, 33, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (53, 11, 'like');
insert into reactions (post_id, user_id, reaction_type) values (119, 18, 'dislike');
insert into reactions (post_id, user_id, reaction_type) values (71, 43, 'dislike');
-- Thêm xong bảng reactions

-- Thêm dữ liệu cho bảng saved_posts
insert into saved_posts (user_id, post_id, saved_at) values (32, 192, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (11, 180, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (29, 172, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (35, 147, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (40, 105, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (24, 139, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (16, 137, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (28, 157, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (39, 192, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (14, 1, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (45, 86, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (45, 80, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (46, 139, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (48, 95, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (14, 122, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (41, 130, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (23, 197, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (24, 31, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (21, 32, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (31, 1, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (17, 130, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (27, 24, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (38, 179, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (13, 47, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (39, 20, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (41, 46, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (50, 93, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (45, 44, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (12, 130, CURRENT_TIMESTAMP);
insert into saved_posts (user_id, post_id, saved_at) values (13, 124, CURRENT_TIMESTAMP);
-- Thêm xong dữ liệu cho bảng saved_posts

-- Thêm dữ liệu cho bảng votes
insert into votes (user_id, post_id, value, created_at) values (38, 139, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 170, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (40, 55, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (26, 50, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (20, 127, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (20, 72, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (16, 139, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (13, 183, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 142, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (37, 86, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (14, 181, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (32, 75, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (42, 199, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (24, 122, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (31, 116, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 86, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (31, 14, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (23, 139, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 43, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (25, 183, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (20, 159, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (22, 180, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (21, 36, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (48, 126, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 154, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (11, 146, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (37, 192, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (49, 90, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (35, 130, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (46, 137, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (19, 60, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (42, 136, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (43, 140, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (28, 66, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (43, 17, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (29, 62, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (48, 159, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 129, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (30, 143, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (25, 184, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (21, 120, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 19, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (23, 126, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (45, 101, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (11, 93, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (17, 96, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (33, 185, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 78, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (43, 89, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (24, 92, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (39, 94, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (49, 131, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (37, 106, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 172, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 15, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (32, 138, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (31, 107, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (47, 56, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 11, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 105, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (33, 52, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (23, 104, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (48, 37, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (46, 130, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (40, 96, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (46, 48, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (15, 25, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (22, 194, 4, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 198, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (18, 54, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (34, 40, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (39, 34, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (45, 48, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (25, 163, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 180, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (25, 36, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (43, 36, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (30, 153, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (13, 29, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (29, 180, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (23, 155, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (36, 83, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (18, 47, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (47, 157, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (20, 189, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (27, 190, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (50, 71, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (32, 161, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 16, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (20, 188, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (39, 4, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (14, 178, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 196, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (41, 55, 3, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (34, 6, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (13, 139, 2, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (15, 106, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (46, 193, 1, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (38, 197, 5, CURRENT_TIMESTAMP);
insert into votes (user_id, post_id, value, created_at) values (32, 126, 5, CURRENT_TIMESTAMP);
-- Thêm xong bảng votes

-- Thêm dữ liệu cho bảng reported_posts
insert into reported_posts (post_id, user_id, report_reason, created_at) values (178, 50, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (16, 45, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (85, 25, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (136, 38, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (87, 31, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (1, 35, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (71, 32, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (41, 48, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (117, 25, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (5, 13, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (58, 13, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (30, 50, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (200, 17, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (52, 49, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (80, 14, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (199, 16, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (196, 25, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (159, 50, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (151, 19, 'Bài viết có từ ngữ tục tĩu', CURRENT_TIMESTAMP);
insert into reported_posts (post_id, user_id, report_reason, created_at) values (93, 41, 'Bài viết có thông tin thiếu chính xác', CURRENT_TIMESTAMP);
-- Thêm xong bảng reported_posts

-- Bảng comments sẽ được thêm sau để trước đó tạo trigger tự động thêm thông báo khi có comment cho người đăng bài

-- Tạo các hàm và trigger
-- 0. Trigger để thông báo comment
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

-- Thêm dữ liệu cho bảng comment để test trigger
insert into comments (post_id, user_id, content, created_at, updated_at) values (89, 36, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (189, 30, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (103, 16, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (30, 45, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (134, 20, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (2, 13, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (79, 42, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (37, 28, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (112, 20, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (95, 37, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (169, 38, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (2, 38, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (57, 48, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (94, 35, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (24, 24, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (3, 48, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (63, 50, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (168, 18, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (14, 38, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (23, 20, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (26, 27, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (47, 11, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (155, 50, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (132, 34, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (3, 37, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (101, 50, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (123, 47, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (11, 33, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (100, 46, 'In congue. Etiam justo. Etiam pretium iaculis justo.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (62, 30, 'Fusce consequat. Nulla nisl. Nunc nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (186, 12, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (158, 42, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (96, 22, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (168, 23, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (20, 37, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (174, 37, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (79, 23, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (39, 16, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (60, 19, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (181, 33, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (164, 50, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (196, 30, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (159, 41, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (20, 45, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (4, 11, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (34, 30, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (118, 18, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (117, 37, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (161, 25, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (57, 24, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (115, 35, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (154, 27, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (71, 50, 'Fusce consequat. Nulla nisl. Nunc nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (32, 42, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (78, 33, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (115, 22, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (179, 43, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (160, 19, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (153, 48, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (118, 44, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (193, 19, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (157, 34, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (36, 34, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (180, 44, 'Fusce consequat. Nulla nisl. Nunc nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (29, 26, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (72, 31, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (17, 42, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (108, 50, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (119, 49, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (8, 17, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (176, 27, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (121, 46, 'Fusce consequat. Nulla nisl. Nunc nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (193, 21, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (183, 26, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (7, 34, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (12, 42, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (6, 31, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (39, 45, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (28, 46, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (107, 22, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (140, 12, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (40, 11, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (20, 14, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (136, 40, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (131, 26, 'Fusce consequat. Nulla nisl. Nunc nisl.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (169, 32, 'In congue. Etiam justo. Etiam pretium iaculis justo.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (96, 11, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (64, 37, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (96, 23, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (134, 34, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (113, 49, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (55, 22, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (133, 49, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (4, 28, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (94, 35, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (161, 50, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (34, 23, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (9, 50, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into comments (post_id, user_id, content, created_at, updated_at) values (146, 34, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- Thêm xong bảng comments

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

-- Test hàm update_user_reputations : mỗi tháng chạy 1 lần
SELECT update_user_reputations()

-- 3. Hàm đăng bài và kiểm tra nếu người dùng uy tín thì không cần duyệt bài 
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
-- Test hàm create_post với người dùng uy tín id = 30 và chưa uy tín id = 31
select create_post(30, 'Test reputation title', 'Test reputation content', 'Test reputation image_url', 'Test reputation location_name', 1)
select create_post(31, 'Test no reputation title', 'Test no reputation content', 'Test no reputation image_url', 'Test no reputation location_name', 1)

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
-- Test hàm get_unapproved_posts
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
select update_post_status(3, 2, true)
select update_post_status(30, 31, false) -- user 30 không phải admin
select update_post_status(2, 1110, false) -- Bài viết với id 1110 không tồn tại

-- 7. Admin confirm report và xóa report
CREATE OR REPLACE FUNCTION confirm_report(admin_id INT, report_id INT, is_accepted BOOLEAN)
RETURNS VOID AS $$
DECLARE
    post_id_cr INT; -- bài viết đang confirm
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

-- Test hàm confirm_report số 1 bởi admin id = 1 rằng report đó đúng 
select confirm_report(1, 1, true)

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
-- Test hàm mark_notification_as_read đọc thông báo có id = 1 và xóa luôn 
select mark_notification_as_read(1)

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

-- Trigger tự động đánh giá 5 sao của chủ sử hữu vào bài đăng (mục đích để tự động khi người dùng đăng bài bài đó sẽ được chủ sở hữu vote 5 sao)
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


-- 1 số chức năng 
-- Đăng kí tài khoản
INSERT INTO users (username, first_name, last_name, email, bio, avatar_url, age, role_id, created_at, updated_at, password) values ('hieupatrick', 'Hieu', 'Nguyen', 'mhieu@biglobe.ne.jp', 'This is a bio', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 20, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'sB5$asaaa');

-- Đăng nhập tài khoản
SELECT PASSWORD
FROM users
WHERE email = 'gzanuttiy@sakura.ne.jp';

-- Đăng bài viết mới là dùng hàm create_post
SELECT create_post(15, 'New title', 'New content', 'New image_url', 'New location_name', 2)

-- Tính năng tìm kiếm và xem chi tiết bài đăng dựa trên danh mục 
SELECT id, title, content
FROM posts
WHERE category_id = 1;

-- Tính năng đánh giá bài viết: vote
INSERT INTO votes(user_id, post_id, value, created_at)
VALUES (13, 25, 2, CURRENT_TIMESTAMP)


-- Các câu lệnh select cơ bản
-- Lấy ra tất cả các bài đăng của người dùng id = 28
SELECT *
FROM posts
WHERE user_id = 28

-- Lấy ra số lượt like trong bài viết có post_id = 62
SELECT count(*) AS like_count
FROM reactions
WHERE post_id = 62 AND reaction_type = 'like';

-- Lấy ra tất cả các thông báo của người dùng id = 21
SELECT *
FROM notifications
WHERE user_id = 21;

-- Lấy ra tất cả các thông báo của bài viết post_id = 2
SELECT *
FROM notifications
WHERE post_id = 2;

-- Lấy ra các bài đăng mà người dùng id = 16 đã lưu và lượt like của bài viết đó
SELECT saved_posts.user_id, 
       saved_posts.post_id, 
       posts.title, 
       posts.content, 
       COUNT(reactions.id) AS like_count
FROM saved_posts
JOIN posts ON saved_posts.post_id = posts.id
LEFT JOIN reactions ON posts.id = reactions.post_id AND reactions.reaction_type = 'like'
WHERE saved_posts.user_id = 16
GROUP BY saved_posts.user_id, saved_posts.post_id, posts.title, posts.content;




