USE jsp1;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARBINARY(200)  NOT NULL,
    content  VARBINARY(5000) NOT NULL,
    writer   VARBINARY(200)  NOT NULL,
    inserted DATETIME        NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

SELECT COUNT(*)
FROM board;

# 페이징 연습용 게시물 복붙
INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;






