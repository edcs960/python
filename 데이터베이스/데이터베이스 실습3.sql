

SELECT * FROM T_SUP -- T_SUP 테이블 전체를 출력

SELECT N_SUP, N_TEL, N_ADMIN FROM T_SUP -- T_SUP에 있는 N_SUP, N_TEL, N_ADMIN속성들을 출력

SELECT N_SUP, N_GSUP FROM T_SUP -- N_SUP과 N_GSUP만 보여줄려고 할때 이렇게 하면 마치 VIEW 테이블을 만든거 처럼 보이지만 이건 단지 조회만 하는 거고 사용자가 * 를 이용하여 해당 테이블 정체를 조회할 수있음.

-- VIEW 테이블 실습
-- VIEW 테이블은 실제 테이블에서 필요한 정보만 가져와 만든 테이블
-- VIEW 테이블은 데이터 조작(INSERT, UPDATE, DELETE)을 할수 없다.

-- VIEW 테이블 생성
CREATE VIEW V_SUP10
AS 
SELECT N_SUP, N_GSUP FROM T_SUP

CREATE VIEW V_SUP11
AS 
SELECT N_SUP AS 거래처명, N_GSUP AS 거래처구분 FROM T_SUP

-- VIEW 테이블 삭제
DROP VIEW V_SUP10
DROP VIEW V_SUP11

-- 합산 VIEW 테이블
-- UNION ALL(하나의 테이블이용)
CREATE VIEW V_SALE_MONTH
AS
SELECT 1 AS Q_M, SUM(M_SALE) AS M_SALE_M FROM T_SALE WHERE D_SALE >= '2020-01-01' AND D_SALE <= '2020-1-31'
-- 여러개의 SELECT문에서 집계합수를 이용하여 조회를 할때 UNION ALL을 사용하면 SELECT문을 함쳐서 보여준다.
-- 여러개의 SELECT문의 칼럼수가 같아야된다.
UNION ALL 
SELECT 2 AS Q_M, SUM(M_SALE) FROM T_SALE WHERE D_SALE >= '2020-02-01' AND D_SALE <= '2020-2-29'

-- VIEW 테이블 조회
-- AS는 해당 속성의 이름을 정해줄때 사용할수 있다
-- AS로 속성의 이름을 설정해주었을때는 그 설정된 이름을 이용하여 조회하여야 된다
SELECT N_SUP FROM V_SUP10 -- AS 사용안함
SELECT 거래처명 FROM V_SUP11 -- AS 사용
SELECT * FROM V_SALE_MONTH WHERE Q_M = 2

