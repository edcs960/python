-- 사용할 데이터 베이스 설정
USE max_edu

-- SELECT 문
SELECT *
FROM T_SALE

-- SELECT 문에서 집계함수 사용
-- 집계함수 SUM(컬럼, 수식)
SELECT SUM(M_SALE)
FROM T_SALE

-- 집계함수 MONTH(날자형), YEAR(날자형)
SELECT MONTH('2020-01-01')
SELECT YEAR('2020-02-01')

-- 출력하면 데이터가 해당 테이블 칼럼의 개수에 맞게 출력이 된다. 이때 데이터가 중복되어 출력된다.
SELECT MONTH(D_SALE)
FROM T_SALE

-- GROUP BY를 이용하면 테이블 칼럼의 개수만큼 출력되는 데이터들이 그룹이 만들어져 중복되는 데이터가 없이 출력이 된다.
SELECT MONTH(D_SALE)
FROM T_SALE
GROUP BY MONTH(D_SALE)

-- SELECT 찾을 칼럼 FROM 테이블 GROUP BY 그룹화할 칼럼[1]
-- [1]에서 찾을 칼럼을 집계함수로 사용하거나 찾을 칼럼의 수에 맞게 GROUP BY절에도 그룹화할 칼럼을 적어줘야한다.
-- 만약 GROUP BY를 사용했을 때 "집계 함수나 GROUP BY 절에 없으므로 SELECT 목록에서 사용할 수 없습니다."라고 오류가 발생할 시
-- 찾을 칼럼이 집계함수로 사용되었는지? 와 GROUP BY절에서 그룹화할 칼럼의 개수와 찾을 칼럼의 개수가 맞는지 확인하자!
SELECT N_MAT, N_SUP
FROM T_SALE
GROUP BY N_MAT, N_SUP

-- 다음과 같이 뷰 테이블을 만들때 SELECT문에서 AS로 칼럼이름설정을 안하게되면 오류가 발생한다.
CREATE VIEW V_MONTH_SALE
AS
SELECT MONTH(D_SALE) AS Q_MONTH, SUM(M_SALE) AS M_SALE_SUM
FROM T_SALE
GROUP BY MONTH(D_SALE)

-- SQL문을 간단하고 심플하게 코딩하며 동일한 결과를 빠르게 출력하고 유지보수도 용이하게 하면 SQL문 설계를 잘한다는 평가를 받는다.

-- VIEW 테이블은 VIEW테이블에 있는 속성들만 사용가능하고 원본 테이블에는 접근을 못한다.
SELECT * 
FROM V_MONTH_SALE

SELECT SUM(M_SALE_SUM)
FROM V_MONTH_SALE
WHERE Q_MONTH = 1

-- UNION ALL(여러개의 테이블 이용)
-- UNION ALL을 이용하여 합칠 테이블
SELECT *
FROM T_SALE
SELECT *
FROM T_INC

-- 일자 / 판매구분 (S, I) / 금액
CREATE VIEW V_SALE_INC
AS
SELECT D_SALE AS D_DATE, 'S' AS C_TYPE, M_SALE AS M_INM
FROM T_SALE

UNION ALL

SELECT D_INC , 'I', M_INC
FROM T_INC

-- ORDER BY(정렬)
SELECT *
FROM V_SALE_INC
ORDER BY D_DATE -- 뒤에 붙는 속성을 기준으로 정렬

SELECT *
FROM V_SALE_INC
WHERE C_TYPE = 'S'
ORDER BY D_DATE

-- 일자 / 판매구분 (S, I) / 금액 / 품목 
ALTER VIEW V_SALE_INC
AS
SELECT D_SALE AS D_DATE, 'S' AS C_TYPE, M_SALE AS M_INM, N_MAT
FROM T_SALE

UNION ALL

-- 위의 테이블에 존재하는 속성이 아래 테이블에 존재하지 않을때 그냥 빈칸을 줘서 개수만 같게 만들면 해결된다.
SELECT D_INC , 'I', M_INC , ''
FROM T_INC

-- V_SALE_INC 조회
SELECT *
FROM V_SALE_INC
WHERE N_MAT = '의자'

-- INSERT 문
-- 기존에 없던 신규자료를 추가하는 것
-- INSERT INTO 테이블명(칼럼..) VALUES (데이터..)
SELECT *
FROM T_SALE

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (13, '20-03-10', '한국사무가구', '의자', 'CH-002', 200)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (14, '20-03-10', '제일마트', '책상', 'DK-001', 100)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (15, '20-03-15', '한국사무가구', '책상', 'DK-002', 50)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (16, '20-03-21', '대동오피스', '의자', 'CH-002', 100)

INSERT INTO T_SALE (I_SALE, D_SALE, N_SUP, N_MAT, N_PRT, Q_SALE)
VALUES (17, '20-03-15', '대동오피스', '책상', 'DK-002', 100)

SELECT *
FROM T_INC

INSERT INTO T_INC (S_INC, D_INC, N_SUP, M_INC)
VALUES (13,'20-03-25', '한국사무가구', 1500000)

-- DELETE문
-- 기존자료를 삭제할때 사용
-- 'DELETE FROM 테이블'로 사용하면 해당 테이블의 데이터 전부가 삭제
-- 'DELETE FROM 테이블 WHERE 조건'로 사용하면 해당 조건이 만족하는 데이터만 삭제
DELETE FROM T_SALE WHERE Q_SALE = 200

-- VIEW 테이블은 데이터 삽입을 못하지만 원본 테이블에 데이터가 삽입되면 VIEW테이블도 영향을 받아 새롭게 입력된 데이터도 적용이 된다.
SELECT *
FROM V_SALE_INC

-- 넣는 테이블과 조회하는 테이블의 속성이 같을 경우
-- INSERT INTO 테이블(칼럼...) SELECT * FROM 테이블
-- 넣는 테이블과 조회하는 테이블의 속성이 다를 경우 
-- INSERT INTO 테이블(칼럼1, 칼럼2...) SELECT 칼럼1, 칼럼2... FROM 테이블
SELECT *
FROM T_SALE2

INSERT INTO T_SALE2(I_SALE2, D_SALE2, N_MAT, N_PRT, N_SUP, N_SALE2_U, Q_SALE2, M_SALE2)
SELECT *
FROM T_SALE

-- VIEW테이블로 생성
CREATE VIEW V_SUM_SALE
AS
SELECT YEAR(D_SALE) AS Q_YEAR,MONTH(D_SALE) AS Q_MONTH, SUM(Q_SALE) AS Q_QTY, SUM(M_SALE) AS M_AMY
FROM T_SALE
GROUP BY YEAR(D_SALE), MONTH(D_SALE)

SELECT *
FROM V_SUM_SALE

-- 테이블에 INSERT INTO ... SELECT .. 로 데이터 삽입
INSERT INTO T_SUM_SALE (Q_YEAR, Q_MONTH, Q_QTY, M_AMT)
SELECT YEAR(D_SALE),MONTH(D_SALE), SUM(Q_SALE), SUM(M_SALE)
FROM T_SALE
GROUP BY YEAR(D_SALE), MONTH(D_SALE)

SELECT *
FROM T_SUM_SALE

-- UPDATE 문
-- 거래처 조회
SELECT *
FROM T_SUP

-- 대동오피스 없어서 INSERT문으로 데이터 추가함
INSERT INTO T_SUP(I_SUP, N_SUP)
VALUES('A007','대동오피스')

-- 대동오피스에 김환수 담당자 지정
UPDATE T_SUP
SET N_ADMIN = '김환수'
-- 위 UPDATE문을 실행시키면 N_ADMIN의 모든 칼럼들이 김환수로 변경된다. 주의 필요함
WHERE I_SUP = 'A007'

-- 판매내역에 단가 없는 거래내역 단가 UPDATE 및 금액 재계산
UPDATE T_SALE
SET N_SALE_U = (SELECT M_UNIT FROM T_MAT WHERE T_SALE.N_PRT = T_MAT.N_PRT)
WHERE N_SALE_U IS NULL

SELECT *
FROM T_SALE
WHERE N_SALE_U IS NULL

INSERT INTO T_MAT
VALUES('M0012', '제품', '책상', 'DK-002',200000,10)

-- 금액 = 단가 * 수량
UPDATE T_SALE
SET M_SALE = N_SALE_U * Q_SALE
WHERE M_SALE IS NULL