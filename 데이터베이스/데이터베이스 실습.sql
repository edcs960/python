-- ���̺� ����
-- ��ü Ž���⿡�� ���̺� ��Ӵٿ� �޴� �� ���̺� ��ũ���� ����� �̿��Ͽ� �ش� ���̺�� ����ϰ� �ڵ��Ҽ��ִ�.
CREATE TABLE T_MAT2 (
	I_MAT CHAR(5),
	N_MATG VARCHAR(20),
	T_MAT VARCHAR(20),
);

-- ���̺� ����
-- ALTER TABLE ���̺�� ADD �߰�Į���� �ڷ���
ALTER TABLE T_MAT ADD T_PRT VARCHAR(50) ;

ALTER TABLE T_SUP ADD I_MATG CHAR(5);
ALTER TABLE T_SUP ADD N_REM VARCHAR(100);

-- Į�� ������
ALTER TABLE T_SUP ALTER COLUMN N_REM VARCHAR(200);

-- Į�� ������
ALTER TABLE T_SUP DROP COLUMN N_REM;

-- ���̺� ������
DROP TABLE DROP_TEST;

-- ���̺���� ��α��� ���¿��� ALT + F1�� �ϸ� �ش� ���̺��� ���¸� �˼��ִ�.
-- SP_HELP ���̺���� �̿��ؼ��� ���̺� ���¸� �˼��ִ�.

-- SELECT * FROM T_SUPG;