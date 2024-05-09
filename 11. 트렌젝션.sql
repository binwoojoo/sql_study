

-- Ʈ�����
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '��ö��', 15);
INSERT INTO student VALUES (2, 'ȫ�浿', 16);

SELECT
    * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '�����', 12);

ROLLBACK;

-- ���� ��ü
UPDATE tb_account
SET balance = balance + 500
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 500
WHERE name = '�ڿ���';

COMMIT;

DELETE FROM student;

ROLLBACK;

-- ����Ŭ�� DDL ����� �ڵ�Ŀ��
-- SQL SERVER�� �ڵ�Ŀ���� �ȵ�
--
--      ROLLUP (�а�, ����)
--      GROUPING SETS (�а�, (�а�, ����), ())
--
--     -> �а��� ���, �а�+���� ���, ��ü ���
--
--      CUBE (�а�, ����)
--      GROUPING SETS (�а�, ����, (�а�, ����), ())
--
--      -> �а��� ���, ������ ���, �а�+���� ���, ��ü ���

-- ROLLUP(A)
-- A������ ���, ��ü ���