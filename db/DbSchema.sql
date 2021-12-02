# DB 생성
DROP DATABASE IF EXISTS sbs_s_2021_10_t;
CREATE DATABASE sbs_s_2021_10_t;
USE sbs_s_2021_10_t;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);
# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(60) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED NOT NULL DEFAULT 3 COMMENT '권한레벨(3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    `nickname` CHAR(20) NOT NULL,
    cellphoneNo CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전,1=탈퇴)',
    delDate DATETIME COMMENT '탈퇴날짜'
);

# 회원 테스트 데이터 생성(관리자 회원)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
`nickname` = '관리자',
cellphoneNo = '01012341234',
email = 'abcdef@gmail.com';

# 회원 테스트 데이터 생성(일반 회원)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` = '사용자1',
`nickname` = '사용자1',
cellphoneNo = '01043214321',
email = 'fedcba@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = '사용자2',
`nickname` = '사용자2',
cellphoneNo = '01098769876',
email = 'zxcvbnm@gmail.com';

# 게시물 테이블에 회원정보 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `updateDate`;

# 기존 게시물의 작성자를 2번으로 수정
UPDATE article
SET memberId = 2
WHERE memberId = 0;

SELECT * 
FROM `member`;

# 게시물 테스트 데이터 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
title = '제목4',
`body` = '내용4';

# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(20) NOT NULL UNIQUE COMMENT 'notice(공지사항), free1(자유게시판1), free2(자유게시판2), ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부(0=삭제전,1=삭제)',
    delDate DATETIME COMMENT '삭제날짜'
);

# 기본 게시판 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'notice',
`name` = '공지사항';


INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'free1',
`name` = '자유1';

# 게시판 테이블에 boardId 칼럼 추가
ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

# 1,2번 게시물에 게시판 정보 추가
UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id IN (3,4);

SHOW TABLES;
DESC article;

SELECT * 
FROM article;

SELECT * 
FROM `board`;

# 게시물 갯수 늘리기
INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(), NOW(), FLOOR(RAND() * 3 + 1), FLOOR(RAND() * 2 + 1), CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT FLOOR(RAND() * 2 + 1);

SELECT CONCAT('%','하하','%')

#게시물 테이블에 hitCount 칼럼 추가
ALTER TABLE article
ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0;