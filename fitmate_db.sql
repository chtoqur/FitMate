-- SSAFIT 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS FITMATE;

USE FITMATE;

-- user 테이블 생성
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255),
    name VARCHAR(10),
    nickname VARCHAR(10),
    email VARCHAR(255),
    age INT,
    fitness_level VARCHAR(10),
    post_code VARCHAR(10),
    address VARCHAR(255),
    liked_videos TEXT,
    saved_routine TEXT,
    liked_community TEXT,
    img VARCHAR(255)
);

-- video 테이블 생성
CREATE TABLE IF NOT EXISTS video (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    part VARCHAR(10),
    description VARCHAR(255),
    thumbnail VARCHAR(255),
    channel_name VARCHAR(255),
    view_cnt INT,
    youtube_videoId VARCHAR(255)
);

-- video_review 테이블 생성
CREATE TABLE IF NOT EXISTS video_comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT,
    writer VARCHAR(10),
    content TEXT,
    reg_date DATETIME,
    parent INT,
    FOREIGN KEY (video_id) REFERENCES video(id),
    FOREIGN KEY (writer) REFERENCES users(id)
);

-- community 테이블 생성
CREATE TABLE IF NOT EXISTS community (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    writer VARCHAR(10),
    content TEXT,
    reg_date DATETIME,
    like_cnt INT,
    view_cnt INT,
    category VARCHAR(64),
    comment_cnt INT,
    FOREIGN KEY (writer) REFERENCES users(id)
);

-- community_comment 테이블 생성
CREATE TABLE IF NOT EXISTS community_comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    community_id INT,
	writer VARCHAR(10),
    content TEXT,
    reg_date DATETIME,
    parent INT,
    FOREIGN KEY (community_id) REFERENCES community(id),
    FOREIGN KEY (writer) REFERENCES users(id)
);

-- routine 테이블 생성
CREATE TABLE IF NOT EXISTS routine (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    level INT,
    courses TEXT,
    part VARCHAR(10)
);

-- exercise 테이블 생성
CREATE TABLE IF NOT EXISTS exercise (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    gifSrc VARCHAR(255),
    description TEXT,
    part VARCHAR(10)
);