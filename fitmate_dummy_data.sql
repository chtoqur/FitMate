-- user 테이블 더미 데이터 삽입
INSERT INTO users (id, password, name, nickname, email, age, fitness_level, post_code, address, liked_videos, img) VALUES
('user1', 'password1', 'Alice', 'alice', 'alice@example.com', 25, '하', '12345', '123 Main St', '[1, 2]', 'img1.jpg'),
('user2', 'password2', 'Bob', 'bob', 'bob@example.com', 30, '중', '23456', '456 Oak St', '[2, 3]', 'img2.jpg'),
('user3', 'password3', 'Charlie', 'charlie', 'charlie@example.com', 35, '상', '34567', '789 Pine St', '[3, 4]', 'img3.jpg'),
('user4', 'password4', 'David', 'david', 'david@example.com', 40, '하', '45678', '101 Maple St', '[4, 5]', 'img4.jpg'),
('user5', 'password5', 'Eve', 'eve', 'eve@example.com', 28, '중', '56789', '202 Birch St', '[5, 6]', 'img5.jpg'),
('user6', 'password6', 'Frank', 'frank', 'frank@example.com', 33, '상', '67890', '303 Cedar St', '[6, 7]', 'img6.jpg'),
('user7', 'password7', 'Grace', 'grace', 'grace@example.com', 27, '하', '78901', '404 Walnut St', '[7, 8]', 'img7.jpg'),
('user8', 'password8', 'Hank', 'hank', 'hank@example.com', 32, '중', '89012', '505 Elm St', '[8, 9]', 'img8.jpg'),
('user9', 'password9', 'Ivy', 'ivy', 'ivy@example.com', 26, '상', '90123', '606 Ash St', '[9, 10]', 'img9.jpg'),
('user10', 'password10', 'Jack', 'jack', 'jack@example.com', 29, '하', '01234', '707 Beech St', '[10, 1]', 'img10.jpg');

-- video 테이블 더미 데이터 삽입
INSERT INTO video (title, description, thumbnail, channel_name, view_cnt, youtube_videoId) VALUES
('Workout 1', 'Full body workout', 'thumb1.jpg', 'Channel A', 1000, 'vid1'),
('Workout 2', 'Cardio session', 'thumb2.jpg', 'Channel B', 2000, 'vid2'),
('Workout 3', 'Strength training', 'thumb3.jpg', 'Channel C', 1500, 'vid3'),
('Workout 4', 'Yoga for beginners', 'thumb4.jpg', 'Channel D', 2500, 'vid4'),
('Workout 5', 'Advanced HIIT', 'thumb5.jpg', 'Channel E', 3000, 'vid5'),
('Workout 6', 'Pilates routine', 'thumb6.jpg', 'Channel F', 1200, 'vid6'),
('Workout 7', 'Morning stretches', 'thumb7.jpg', 'Channel G', 1300, 'vid7'),
('Workout 8', 'Evening relaxation', 'thumb8.jpg', 'Channel H', 2200, 'vid8'),
('Workout 9', 'Core exercises', 'thumb9.jpg', 'Channel I', 1700, 'vid9'),
('Workout 10', 'Upper body strength', 'thumb10.jpg', 'Channel J', 1100, 'vid10');

-- video_comment 테이블 더미 데이터 삽입
INSERT INTO video_comment (video_id, writer, content, reg_date, parent) VALUES
(1, 'user1', 'Great workout!', '2024-05-01 10:00:00', NULL),
(2, 'user2', 'Really enjoyed this session', '2024-05-02 11:00:00', NULL),
(3, 'user3', 'Challenging but worth it', '2024-05-03 12:00:00', NULL),
(4, 'user4', 'Loved the yoga routine', '2024-05-04 13:00:00', NULL),
(5, 'user5', 'Perfect HIIT workout', '2024-05-05 14:00:00', NULL),
(6, 'user6', 'Good pilates exercises', '2024-05-06 15:00:00', NULL),
(7, 'user7', 'Helped me stretch', '2024-05-07 16:00:00', NULL),
(8, 'user8', 'Relaxing and calm', '2024-05-08 17:00:00', NULL),
(9, 'user9', 'Core workout was intense', '2024-05-09 18:00:00', NULL),
(10, 'user10', 'Great for upper body', '2024-05-10 19:00:00', NULL),
(1, 'user2', 'Indeed it was!', '2024-05-11 10:00:00', 1),
(2, 'user3', 'I felt the same!', '2024-05-12 11:00:00', 2);

-- community 테이블 더미 데이터 삽입
INSERT INTO community (title, writer, content, reg_date, like_cnt, view_cnt, category, comment_cnt, file) VALUES
('Fitness Tips', 'user1', 'Share your best fitness tips', '2024-05-01 08:00:00', 10, 100, 'Tips', 5, 'file1.jpg'),
('Healthy Eating', 'user2', 'Discuss healthy eating habits', '2024-05-02 09:00:00', 20, 200, 'Nutrition', 10, 'file2.jpg'),
('Workout Routines', 'user3', 'Post your workout routines here', '2024-05-03 10:00:00', 15, 150, 'Workouts', 8, 'file3.jpg'),
('Yoga Practices', 'user4', 'Yoga for mind and body', '2024-05-04 11:00:00', 25, 250, 'Yoga', 12, 'file4.jpg'),
('Running Techniques', 'user5', 'Improve your running', '2024-05-05 12:00:00', 30, 300, 'Running', 20, 'file5.jpg'),
('Gym Experiences', 'user6', 'Share your gym experiences', '2024-05-06 13:00:00', 18, 180, 'Gym', 7, 'file6.jpg'),
('Home Workouts', 'user7', 'Workouts you can do at home', '2024-05-07 14:00:00', 22, 220, 'Home', 11, 'file7.jpg'),
('Motivation', 'user8', 'Stay motivated to exercise', '2024-05-08 15:00:00', 35, 350, 'Motivation', 15, 'file8.jpg'),
('Injury Prevention', 'user9', 'Prevent workout injuries', '2024-05-09 16:00:00', 28, 280, 'Health', 9, 'file9.jpg'),
('Fitness Gadgets', 'user10', 'Best gadgets for fitness', '2024-05-10 17:00:00', 12, 120, 'Gadgets', 6, 'file10.jpg');

-- community_comment 테이블 더미 데이터 삽입
INSERT INTO community_comment (community_id, writer, content, reg_date, parent) VALUES
(1, 'user2', 'Great tips!', '2024-05-01 09:00:00', NULL),
(2, 'user3', 'Very informative', '2024-05-02 10:00:00', NULL),
(3, 'user4', 'Thanks for sharing', '2024-05-03 11:00:00', NULL),
(4, 'user5', 'Loved the insights', '2024-05-04 12:00:00', NULL),
(5, 'user6', 'This is helpful', '2024-05-05 13:00:00', NULL),
(6, 'user7', 'Appreciate the advice', '2024-05-06 14:00:00', NULL),
(7, 'user8', 'Good read', '2024-05-07 15:00:00', NULL),
(8, 'user9', 'Very useful', '2024-05-08 16:00:00', NULL),
(9, 'user10', 'Thanks!', '2024-05-09 17:00:00', NULL),
(10, 'user1', 'Great discussion', '2024-05-10 18:00:00', NULL),
(1, 'user3', 'Absolutely!', '2024-05-11 09:00:00', 1),
(2, 'user4', 'I agree!', '2024-05-12 10:00:00', 2);

-- routine 테이블 더미 데이터 삽입
INSERT INTO routine (title, level, courses, part) VALUES
('Beginner Routine', 1, 'course1,course2,course3', 'Full Body'),
('Intermediate Routine', 2, 'course4,course5,course6', 'Upper Body'),
('Advanced Routine', 3, 'course7,course8,course9', 'Lower Body'),
('Yoga Routine', 1, 'course10,course11,course12', 'Full Body'),
('Pilates Routine', 2, 'course13,course14,course15', 'Core'),
('HIIT Routine', 3, 'course16,course17,course18', 'Full Body'),
('Strength Routine', 2, 'course19,course20,course21', 'Upper Body'),
('Cardio Routine', 1, 'course22,course23,course24', 'Full Body'),
('Flexibility Routine', 1, 'course25,course26,course27', 'Lower Body'),
('Core Routine', 2, 'course28,course29,course30', 'Core');

-- exercise 테이블 더미 데이터 삽입
INSERT INTO exercise (name, gifSrc, description, part) VALUES
('Push Up', 'pushup.gif', 'A basic push up exercise', 'Upper Body'),
('Squat', 'squat.gif', 'A basic squat exercise', 'Lower Body'),
('Plank', 'plank.gif', 'A basic plank exercise', 'Core'),
('Lunge', 'lunge.gif', 'A basic lunge exercise', 'Lower Body'),
('Sit Up', 'situp.gif', 'A basic sit up exercise', 'Core'),
('Burpee', 'burpee.gif', 'A full body burpee exercise', 'Full Body'),
('Mountain Climber', 'mountainclimber.gif', 'A basic mountain climber exercise', 'Full Body'),
('Bicep Curl', 'bicepcurl.gif', 'A basic bicep curl exercise', 'Upper Body'),
('Tricep Dip', 'tricepdip.gif', 'A basic tricep dip exercise', 'Upper Body'),
('Leg Raise', 'legraise.gif', 'A basic leg raise exercise', 'Core');
