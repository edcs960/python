-- ����� ������ ���̽� ����
USE max_edu

-- SELECT ��
SELECT *
FROM T_SALE

-- SELECT ������ �����Լ� ���
-- �����Լ� SUM(�÷�, ����)
SELECT SUM(M_SALE)
FROM T_SALE

-- �����Լ� MONTH(������), YEAR(������)
SELECT MONTH('2020-01-01')
SELECT YEAR('2020-02-01')

-- ����ϸ� �����Ͱ� �ش� ���̺� Į���� ������ �°� ����� �ȴ�. �̶� �����Ͱ� �ߺ��Ǿ� ��µȴ�.
SELECT MONTH(D_SALE)
FROM T_SALE

-- GROUP BY�� �̿��ϸ� ���̺� Į���� ������ŭ ��µǴ� �����͵��� �׷��� ������� �ߺ��Ǵ� �����Ͱ� ���� ����� �ȴ�.
SELECT MONTH(D_SALE)
FROM T_SALE
GROUP BY MONTH(D_SALE)

-- SELECT ã�� Į�� FROM ���̺� GROUP BY �׷�ȭ�� Į��[1]
-- [1]���� ã�� Į���� �����Լ��� ����ϰų� ã�� Į���� ���� �°� GROUP BY������ �׷�ȭ�� Į���� ��������Ѵ�.
-- ���� GROUP BY�� ������� �� "���� �Լ��� GROUP BY ���� �����Ƿ� SELECT ��Ͽ��� ����� �� �����ϴ�."��� ������ �߻��� ��
-- ã�� Į���� �����Լ��� ���Ǿ�����? �� GROUP BY������ �׷�ȭ�� Į���� ������ ã�� Į���� ������ �´��� Ȯ������!
SELECT N_MAT, N_SUP
FROM T_SALE
GROUP BY N_MAT, N_SUP

-- ������ ���� �� ���̺��� ���鶧 SELECT������ AS�� Į���̸������� ���ϰԵǸ� ������ �߻��Ѵ�.
CREATE VIEW V_MONTH_SALE
AS
SELECT MONTH(D_SALE) AS Q_MONTH, SUM(M_SALE) AS M_SALE_SUM
FROM T_SALE
GROUP BY MONTH(D_SALE)

-- SQL���� �����ϰ� �����ϰ� �ڵ��ϸ� ������ ����� ������ ����ϰ� ���������� �����ϰ� �ϸ� SQL�� ���踦 ���Ѵٴ� �򰡸� �޴´�.

-- VIEW ���̺��� VIEW���̺� �ִ� �Ӽ��鸸 ��밡���ϰ� ���� ���̺��� ������ ���Ѵ�.
SELECT * 
FROM V_MONTH_SALE

SELECT SUM(M_SALE_SUM)
FROM V_MONTH_SALE
WHERE Q_MONTH = 1

-- UNION ALL(�������� ���̺� �̿�)
-- UNION ALL�� �̿��Ͽ� ��ĥ ���̺�
SELECT *
FROM T_SALE
SELECT *
FROM T_INC

-- ���� / �Ǹű��� (S, I) / �ݾ�
CREATE VIEW V_SALE_INC
AS
SELECT D_SALE AS D_DATE, 'S' AS C_TYPE, M_SALE AS M_INM
FROM T_SALE

UNION ALL

SELECT D_INC , 'I', M_INC
FROM T_INC

-- ORDER BY(����)
SELECT *
FROM V_SALE_INC
ORDER BY D_DATE -- �ڿ� �ٴ� �Ӽ��� �������� ����

SELECT *
FROM V_SALE_INC
WHERE C_TYPE = 'S'
ORDER BY D_DATE

-- ���� / �Ǹű��� (S, I) / �ݾ� / ǰ�� 
ALTER VIEW V_SALE_INC
AS
SELECT D_SALE AS D_DATE, 'S' AS C_TYPE, M_SALE AS M_INM, N_MAT
FROM T_SALE

UNION ALL

-- ���� ���̺� �����ϴ� �Ӽ��� �Ʒ� ���̺� �������� ������ �׳� ��ĭ�� �༭ ������ ���� ����� �ذ�ȴ�.
SELECT D_INC , 'I', M_INC , ''
FROM T_INC

-- V_SALE_INC ��ȸ
SELECT *
FROM V_SALE_INC
WHERE N_MAT = '����'

-- INSERT ��
-- ������ ���� �ű��ڷḦ �߰��ϴ� ��
-- INSERT INTO ���̺��(Į��..) VALUES (������..)
SELECT *
FROM T_SALE

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (13, '20-03-10', '�ѱ��繫����', '����', 'CH-002', 200)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (14, '20-03-10', '���ϸ�Ʈ', 'å��', 'DK-001', 100)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (15, '20-03-15', '�ѱ��繫����', 'å��', 'DK-002', 50)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (16, '20-03-21', '�뵿���ǽ�', '����', 'CH-002', 100)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (17, '20-03-15', '�뵿���ǽ�', 'å��', 'DK-002', 100)

SELECT *
FROM T_INC

INSERT INTO T_INC (S_INC, D_INC, N_SUP, M_INC)
VALUES (13,'20-03-25', '�ѱ��繫����', 1500000)

-- DELETE��
-- �����ڷḦ �����Ҷ� ���
-- 'DELETE FROM ���̺�'�� ����ϸ� �ش� ���̺��� ������ ���ΰ� ����
-- 'DELETE FROM ���̺� WHERE ����'�� ����ϸ� �ش� ������ �����ϴ� �����͸� ����
DELETE FROM T_SALE WHERE Q_SALE = 200

-- VIEW ���̺��� ������ ������ �������� ���� ���̺� �����Ͱ� ���ԵǸ� VIEW���̺� ������ �޾� ���Ӱ� �Էµ� �����͵� ������ �ȴ�.
SELECT *
FROM V_SALE_INC

-- �ִ� ���̺�� ��ȸ�ϴ� ���̺��� �Ӽ��� ���� ���
-- INSERT INTO ���̺�(Į��...) SELECT * FROM ���̺�
-- �ִ� ���̺�� ��ȸ�ϴ� ���̺��� �Ӽ��� �ٸ� ��� 
-- INSERT INTO ���̺�(Į��1, Į��2...) SELECT Į��1, Į��2... FROM ���̺�
SELECT *
FROM T_SALE2

INSERT INTO T_SALE2(I_SALE2, D_SALE2, N_MAT, N_PRT, N_SUP, N_SALE2_U, Q_SALE2, M_SALE2)
SELECT *
FROM T_SALE

-- VIEW���̺�� ����
CREATE VIEW V_SUM_SALE
AS
SELECT YEAR(D_SALE) AS Q_YEAR,MONTH(D_SALE) AS Q_MONTH, SUM(Q_SALE) AS Q_QTY, SUM(M_SALE) AS M_AMY
FROM T_SALE
GROUP BY YEAR(D_SALE), MONTH(D_SALE)

SELECT *
FROM V_SUM_SALE

-- ���̺� INSERT INTO ... SELECT .. �� ������ ����
INSERT INTO T_SUM_SALE (Q_YEAR, Q_MONTH, Q_QTY, M_AMT)
SELECT YEAR(D_SALE),MONTH(D_SALE), SUM(Q_SALE), SUM(M_SALE)
FROM T_SALE
GROUP BY YEAR(D_SALE), MONTH(D_SALE)

SELECT *
FROM T_SUM_SALE

-- UPDATE ��
-- �ŷ�ó ��ȸ
SELECT *
FROM T_SUP

-- �뵿���ǽ� ��� INSERT������ ������ �߰���
INSERT INTO T_SUP(I_SUP, N_SUP)
VALUES('A007','�뵿���ǽ�')

-- �뵿���ǽ��� ��ȯ�� ����� ����
UPDATE T_SUP
SET N_ADMIN = '��ȯ��'
-- �� UPDATE���� �����Ű�� N_ADMIN�� ��� Į������ ��ȯ���� ����ȴ�. ���� �ʿ���
WHERE I_SUP = 'A007'

-- �Ǹų����� �ܰ� ���� �ŷ����� �ܰ� UPDATE �� �ݾ� ����
UPDATE T_SALE
SET N_SALE_U = (SELECT M_UNIT FROM T_MAT WHERE T_SALE.N_PRT = T_MAT.N_PRT)
WHERE N_SALE_U IS NULL

SELECT *
FROM T_SALE
WHERE N_SALE_U IS NULL

INSERT INTO T_MAT
VALUES('M0012', '��ǰ', 'å��', 'DK-002',200000,10)

-- �ݾ� = �ܰ� * ����
UPDATE T_SALE
SET M_SALE = N_SALE_U * Q_SALE
WHERE M_SALE IS NULL