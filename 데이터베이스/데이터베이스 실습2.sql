USE max_edu;

-- ���̺� ���� Ȯ��
-- SP_HELP T_SUP (ALT + F1)

-- �������� ���� �ӽ� ���̺�
SELECT * FROM �ŷ�����;
SELECT * FROM �ŷ�ó;
SELECT * FROM �ŷ�ó����;
SELECT * FROM ���ݳ���;
SELECT * FROM ǰ�񱸺�;
SELECT * FROM ǰ������;

-- ���� ���̺�
SELECT * FROM T_SUP
SELECT * FROM T_MAT
SELECT * FROM T_SUPG
SELECT * FROM T_MATG
SELECT * FROM T_SALE
SELECT * FROM T_INC

-- �ӽ� ���̺��� ���� ���̺�� ������ ���޹��
INSERT INTO T_SUP (I_SUP,N_SUP, N_GSUP, N_ADD) VALUES ('A002', '������ü', '', NULL) -- �� �ϳ��� ������ ���

INSERT INTO T_SUP (I_SUP,N_SUP, N_GSUP, N_ADD, N_TEL, N_ADMIN) SELECT �ŷ�óID, �ŷ�ó��, [�ŷ�ó ����], �ּ�, ��ȭ��ȣ, ����ڸ� FROM �ŷ�ó -- �������� ���� ������ SELECT���� ����Ͽ� �ѹ��� ������ �ִ�.
INSERT INTO T_MAT (I_MAT, N_MATG, N_MAT, N_PRT, M_UNIT,Q_STK) SELECT ǰ��ID, ǰ�񱸺�, ǰ��, ǰ��, �ܰ�, �̿���� FROM ǰ������
INSERT INTO T_SUPG (I_SUPG, N_SUPG) SELECT ǰ�񱸺�ID, ǰ������ FROM ǰ�񱸺�
INSERT INTO T_MATG (I_MATG, N_MATG) SELECT [�ŷ�ó ����ID], �ŷ�ó���� FROM �ŷ�ó����
INSERT INTO T_SALE (S_SALE, D_SALE, N_MAT, N_PRT, N_SUP,N_SALE_U, Q_SALE, M_SALE) SELECT ����, �ŷ�����, ǰ��, �ŷ�ó, ǰ��, �ܰ�, ����, �ݾ� FROM �ŷ�����
INSERT INTO T_INC (S_INC, D_INC, N_SUP, M_INC) SELECT ����, �ŷ�����, �ŷ�ó, �ݾ� FROM �ŷ�����

-- ���̺� ���� ����
DELETE FROM T_SUP