-- 테이블 생성
-- 개체 탐색기에서 테이블 드롭다운 메뉴 중 테이블 스크립팅 기능을 이용하여 해당 테이블과 비슷하게 코딩할수있다.
CREATE TABLE T_MAT2 (
	I_MAT CHAR(5),
	N_MATG VARCHAR(20),
	T_MAT VARCHAR(20),
);

-- 테이블 수정
-- ALTER TABLE 테이블명 ADD 추가칼럼명 자료형
ALTER TABLE T_MAT ADD T_PRT VARCHAR(50) ;

ALTER TABLE T_SUP ADD I_MATG CHAR(5);
ALTER TABLE T_SUP ADD N_REM VARCHAR(100);

-- 칼럼 수정시
ALTER TABLE T_SUP ALTER COLUMN N_REM VARCHAR(200);

-- 칼럼 삭제시
ALTER TABLE T_SUP DROP COLUMN N_REM;

-- 테이블 삭제시
DROP TABLE DROP_TEST;

-- 테이블명을 드로그한 상태에서 ALT + F1을 하면 해당 테이블의 형태를 알수있다.
-- SP_HELP 테이블명을 이용해서도 테이블 형태를 알수있다.

-- SELECT * FROM T_SUPG;