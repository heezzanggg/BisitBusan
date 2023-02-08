-- MENUS
--  MENU_ID. MNEU_NAME, MENU_SEQ
-------------------------------------------------------
-- MENUS  테이블 생성
-------------------------------------------------------
CREATE TABLE MENUS
(
     MENU_ID     VARCHAR2(6)   NOT  NULL  PRIMARY KEY    
   , MENU_NAME   VARCHAR2(120) NOT  NULL
   , MENU_SEQ    NUMBER(5, 0)  NOT  NULL
)

INSERT INTO MENUS ( MENU_ID, MENU_NAME, MENU_SEQ)
 VALUES  ('MENU01', 'JAVA', 1);
COMMIT; 

-----------------------------------------------------------
-- 게시물 목록
-----------------------------------------------------------
CREATE  TABLE  BOARD
(
      IDX           NUMBER( 5, 0 )    PRIMARY KEY
    , MENU_ID       VARCHAR2(6)       NOT NULL
        REFERENCES   MENUS (MENU_ID) 
    , TITLE         VARCHAR2(300)     NOT NULL
    , CONT          VARCHAR2(4000) 
    , WRITER        VARCHAR2(50) 
    , REGDATE       DATE              DEFAULT  SYSDATE
    , READCOUNT     NUMBER( 6, 0 )    DEFAULT  0
    
    , BNUM          NUMBER( 5, 0 )    DEFAULT  0
    , LVL           NUMBER( 5, 0 )    DEFAULT  0
    , STEP          NUMBER( 5, 0 )    DEFAULT  0
    , NREF          NUMBER( 5, 0 )    DEFAULT  0
);



