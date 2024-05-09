

-- 트랜잭션
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT
    * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '도우너', 12);

ROLLBACK;

-- 계좌 이체
UPDATE tb_account
SET balance = balance + 500
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 500
WHERE name = '박영희';

COMMIT;

DELETE FROM student;

ROLLBACK;

-- 오라클은 DDL 수행시 자동커밋
-- SQL SERVER는 자동커밋이 안됨
--
--      ROLLUP (학과, 지역)
--      GROUPING SETS (학과, (학과, 지역), ())
--
--     -> 학과별 통계, 학과+지역 통계, 전체 통계
--
--      CUBE (학과, 지역)
--      GROUPING SETS (학과, 지역, (학과, 지역), ())
--
--      -> 학과별 통계, 지역별 통계, 학과+지역 통계, 전체 통계

-- ROLLUP(A)
-- A만으로 통계, 전체 통계