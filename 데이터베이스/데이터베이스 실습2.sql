USE max_edu;

-- 테이블 구조 확인
-- SP_HELP T_SUP (ALT + F1)

-- 엑셀에서 들어온 임시 테이블
SELECT * FROM 거래내역;
SELECT * FROM 거래처;
SELECT * FROM 거래처구분;
SELECT * FROM 수금내역;
SELECT * FROM 품목구분;
SELECT * FROM 품목정보;

-- 실제 테이블
SELECT * FROM T_SUP
SELECT * FROM T_MAT
SELECT * FROM T_SUPG
SELECT * FROM T_MATG
SELECT * FROM T_SALE
SELECT * FROM T_INC

-- 임시 테이블에서 실제 테이블로 데이터 전달방법
INSERT INTO T_SUP (I_SUP,N_SUP, N_GSUP, N_ADD) VALUES ('A002', '연습업체', '', NULL) -- 행 하나씩 넣을때 사용

INSERT INTO T_SUP (I_SUP,N_SUP, N_GSUP, N_ADD, N_TEL, N_ADMIN) SELECT 거래처ID, 거래처명, [거래처 구분], 주소, 전화번호, 담당자명 FROM 거래처 -- 여러개의 행을 넣을때 SELECT문을 사용하여 한번에 넣을수 있다.
INSERT INTO T_MAT (I_MAT, N_MATG, N_MAT, N_PRT, M_UNIT,Q_STK) SELECT 품목ID, 품목구분, 품명, 품번, 단가, 이월재고량 FROM 품목정보
INSERT INTO T_SUPG (I_SUPG, N_SUPG) SELECT 품목구분ID, 품복구분 FROM 품목구분
INSERT INTO T_MATG (I_MATG, N_MATG) SELECT [거래처 구분ID], 거래처구분 FROM 거래처구분
INSERT INTO T_SALE (S_SALE, D_SALE, N_MAT, N_PRT, N_SUP,N_SALE_U, Q_SALE, M_SALE) SELECT 순번, 거래일자, 품명, 거래처, 품번, 단가, 수량, 금액 FROM 거래내역
INSERT INTO T_INC (S_INC, D_INC, N_SUP, M_INC) SELECT 순번, 거래일자, 거래처, 금액 FROM 거래내역

-- 테이블 내용 삭제
DELETE FROM T_SUP