

SELECT * FROM T_SUP -- T_SUP ���̺� ��ü�� ���

SELECT N_SUP, N_TEL, N_ADMIN FROM T_SUP -- T_SUP�� �ִ� N_SUP, N_TEL, N_ADMIN�Ӽ����� ���

SELECT N_SUP, N_GSUP FROM T_SUP -- N_SUP�� N_GSUP�� �����ٷ��� �Ҷ� �̷��� �ϸ� ��ġ VIEW ���̺��� ����� ó�� �������� �̰� ���� ��ȸ�� �ϴ� �Ű� ����ڰ� * �� �̿��Ͽ� �ش� ���̺� ��ü�� ��ȸ�� ������.

-- VIEW ���̺� �ǽ�
-- VIEW ���̺��� ���� ���̺��� �ʿ��� ������ ������ ���� ���̺�
-- VIEW ���̺��� ������ ����(INSERT, UPDATE, DELETE)�� �Ҽ� ����.

-- VIEW ���̺� ����
CREATE VIEW V_SUP10
AS 
SELECT N_SUP, N_GSUP FROM T_SUP

CREATE VIEW V_SUP11
AS 
SELECT N_SUP AS �ŷ�ó��, N_GSUP AS �ŷ�ó���� FROM T_SUP

-- VIEW ���̺� ����
DROP VIEW V_SUP10
DROP VIEW V_SUP11

-- �ջ� VIEW ���̺�
-- UNION ALL(�ϳ��� ���̺��̿�)
CREATE VIEW V_SALE_MONTH
AS
SELECT 1 AS Q_M, SUM(M_SALE) AS M_SALE_M FROM T_SALE WHERE D_SALE >= '2020-01-01' AND D_SALE <= '2020-1-31'
-- �������� SELECT������ �����ռ��� �̿��Ͽ� ��ȸ�� �Ҷ� UNION ALL�� ����ϸ� SELECT���� ���ļ� �����ش�.
-- �������� SELECT���� Į������ ���ƾߵȴ�.
UNION ALL 
SELECT 2 AS Q_M, SUM(M_SALE) FROM T_SALE WHERE D_SALE >= '2020-02-01' AND D_SALE <= '2020-2-29'

-- VIEW ���̺� ��ȸ
-- AS�� �ش� �Ӽ��� �̸��� �����ٶ� ����Ҽ� �ִ�
-- AS�� �Ӽ��� �̸��� �������־������� �� ������ �̸��� �̿��Ͽ� ��ȸ�Ͽ��� �ȴ�
SELECT N_SUP FROM V_SUP10 -- AS ������
SELECT �ŷ�ó�� FROM V_SUP11 -- AS ���
SELECT * FROM V_SALE_MONTH WHERE Q_M = 2

