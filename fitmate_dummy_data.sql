-- user 테이블 더미 데이터 삽입
INSERT INTO users (id, password, name, nickname, email, age, fitness_level, post_code, address, liked_videos, saved_routine, liked_community, img) VALUES
('ssafy', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'ssafy', 'ssafy', 'ssafy@ssafy.com', '25', '중', '08760', '서울특별시 관악구 관천로 10길 34', '[1, 3, 5]', '[1, 3, 5]', '[1, 3, 5]','ssafy.jpg'),
('user1', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Alice', 'alice', 'alice@example.com', 25, '하', '12345', '123 Main St', '[1, 2]', '[1, 3, 5]', '[1, 3, 5]','img1.jpg'),
('user2', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Bob', 'bob', 'bob@example.com', 30, '중', '23456', '456 Oak St', '[2, 3]', '[2, 3]', '[2, 3]','img2.jpg'),
('user3', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Charlie', 'charlie', 'charlie@example.com', 35, '상', '34567', '789 Pine St', '[3, 4]', '[2, 3]', '[2, 3]', 'img3.jpg'),
('user4', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'David', 'david', 'david@example.com', 40, '하', '45678', '101 Maple St', '[4, 5]', '[2, 3]', '[2, 3]', 'img4.jpg'),
('user5', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Eve', 'eve', 'eve@example.com', 28, '중', '56789', '202 Birch St', '[5, 6]', '[2, 3]', '[2, 3]', 'img5.jpg'),
('user6', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Frank', 'frank', 'frank@example.com', 33, '상', '67890', '303 Cedar St', '[6, 7]', '[2, 3]', '[2, 3]' ,'img6.jpg'),
('user7', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Grace', 'grace', 'grace@example.com', 27, '하', '78901', '404 Walnut St', '[7, 8]', '[2, 3]', '[2, 3]' ,'img7.jpg'),
('user8', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Hank', 'hank', 'hank@example.com', 32, '중', '89012', '505 Elm St', '[8, 9]', '[2, 3]', '[2, 3]', 'img8.jpg'),
('user9', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Ivy', 'ivy', 'ivy@example.com', 26, '상', '90123', '606 Ash St', '[9, 10]', '[2, 3]', '[2, 3]', 'img9.jpg'),
('user10', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 'Jack', 'jack', 'jack@example.com', 29, '하', '01234', '707 Beech St', '[10, 1]', '[2, 3]', '[2, 3]', 'img10.jpg');

-- video 테이블 더미 데이터 삽입
INSERT INTO video (title, part, description, thumbnail, channel_name, view_cnt, youtube_videoId)
VALUES
('전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]', '어깨', '전신운동입니다', 'https://i.ytimg.com/vi/gMaB-fG4u4g/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLBCYL_b5RWp6EGD3vhWaugQqB-opA', '채널1', 25, 'gMaB-fG4u4g'),
('하루 15분! 전신 칼로리 불태우는 다이어트 운동', '팔', '요것도 전신운동입니다', 'https://i.ytimg.com/vi/swRNeYw1JkY/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLBdCntJRy-V96l8tfZNHv6f2BoE-w', '채널2', 1421, 'swRNeYw1JkY'),
('상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]', '가슴', '상체운동입니다', 'https://i.ytimg.com/vi/54tTYO-vU2E/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLDxWlfWshc8D0IBhLDgV_oy_9u31A', '채널3', 13, '54tTYO-vU2E'),
('상체비만 다이어트 최고의 운동 [상체 핵매운맛]', '등', '요것도 상체운동입니다', 'https://i.ytimg.com/vi/QqqZH3j_vH0/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAHjpKpEBo2dH3F0U5ob8sSagiioQ', '채널4', 2048127, 'QqqZH3j_vH0'),
('하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]', '하체', '하체운동입니다', 'https://i.ytimg.com/vi/tzN6ypk6Sps/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAAxHIjOn8ti0G7vnAhfOIu_s27tQ', '채널5', 175, 'tzN6ypk6Sps'),
('저는 하체 식주의자 입니다', '하체', '요것도 하체운동입니다', 'https://i.ytimg.com/vi/u5OgcZdNbMo/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAaopAKEGym2ylTOaiJBfajdXHjlA', '채널6', 85875641, 'u5OgcZdNbMo'),
('11자복근 복부 최고의 운동 [복근 핵매운맛]', '복근', '복부운동', 'https://i.ytimg.com/vi/u5OgcZdNbMo/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAaopAKEGym2ylTOaiJBfajdXHjlA', '채널7', 45612, 'PjGcOP-TQPE'),
('(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)', '복근', '복부운동2', 'https://i.ytimg.com/vi/7TLk7pscICk/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLCSzdQy_ZUn3NE2zk6_gtu61aShgg', '채널8', 45675123, '7TLk7pscICk');

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
(1, 'user2', 'Indeed it was!', '2024-05-11 10:00:00', 1),
(1, 'user2', 'Indeed it was!', '2024-05-11 10:00:00', 1),
(1, 'ssafy', 'test reply comment', '2024-05-11 10:00:00', 1),
(1, 'ssafy', 'test comment', '2024-05-11 10:00:00', 0),
(2, 'user3', 'I felt the same!', '2024-05-12 11:00:00', 2);

-- community 테이블 더미 데이터 삽입
INSERT INTO community (title, writer, content, reg_date, like_cnt, view_cnt, category, comment_cnt) VALUES
('Fitness Tips', 'user1', 'Share your best fitness tips', '2024-05-01 08:00:00', 2, 100, 'Tips', 2),
('Healthy Eating', 'user2', 'Discuss healthy eating habits', '2024-05-02 09:00:00', 9, 200, 'Nutrition', 2),
('Workout Routines', 'user3', 'Post your workout routines here', '2024-05-03 10:00:00', 11, 150, 'Workouts', 1),
('Yoga Practices', 'user4', 'Yoga for mind and body', '2024-05-04 11:00:00', 0, 250, 'Yoga', 1),
('Running Techniques', 'user5', 'Improve your running', '2024-05-05 12:00:00', 2, 300, 'Running', 1),
('Gym Experiences', 'user6', 'Share your gym experiences', '2024-05-06 13:00:00', 0, 180, 'Gym', 1),
('Home Workouts', 'user7', 'Workouts you can do at home', '2024-05-07 14:00:00', 0, 220, 'Home', 1),
('Motivation', 'user8', 'Stay motivated to exercise', '2024-05-08 15:00:00', 0, 350, 'Motivation', 1),
('Injury Prevention', 'user9', 'Prevent workout injuries', '2024-05-09 16:00:00', 0, 280, 'Health', 1),
('Fitness Gadgets', 'user10', 'Best gadgets for fitness', '2024-05-10 17:00:00', 0, 120, 'Gadgets', 1);

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
