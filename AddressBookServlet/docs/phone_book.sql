SELECT * FROM user_objects; -- 현재 오브젝트

-- 필요시 삭제 후 재생성
DROP TABLE PHONE_BOOK;  
DROP SEQUENCE seq_phone_book;

-- TABLE
CREATE TABLE PHONE_BOOK (
    id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(10),
    hp VARCHAR2(20),
    tel VARCHAR2(20),
    create_at DATE DEFAULT sysdate);

-- SEQUENCE
CREATE SEQUENCE seq_phone_book
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000000
    NOCACHE;
    
-- 넣어보기
INSERT INTO phone_book
VALUES(seq_phone_book.NEXTVAL,
    '박경리', '010-0000-0000', '02-000-0000', sysdate);
    
-- 결과확인하기    
SELECT * FROM phone_book;   

COMMIT;