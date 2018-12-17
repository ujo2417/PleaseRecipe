--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-3岿-26-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RECIPEBOARD
--------------------------------------------------------
CREATE UNIQUE INDEX "RECIPEBOARD_PK" ON "RECIPEBOARD" ("RECIPE_NUM")
ALTER TABLE "RECIPEBOARD" ADD CONSTRAINT "RECIPEBOARD_PK" PRIMARY KEY ("RECIPE_NUM") ENABLE
SELECT * FROM RECIPEBOARD;
DROP TABLE RECIPEBOARD;
create sequence recipe_autonum;

select *from recipeboard
delete from RECIPEBOARD

  CREATE TABLE "COOK"."RECIPEBOARD" 
   (	"MEM_ID" VARCHAR2(20 BYTE), 
	"RECIPE_NUM" NUMBER, 
	"RECIPE_NAME" VARCHAR2(20 BYTE), 
	"RECIPE_SUBJECT" VARCHAR2(50 BYTE), 
	"RECIPE_DATE" VARCHAR2(20 BYTE), 
	"RECIPE_READCOUNT" NUMBER, 
	"RECIPE_TITLE" VARCHAR2(20 BYTE), 
	"RECIPE_PIC" VARCHAR2(100 BYTE), 
	"RECIPE_MATERIAL" VARCHAR2(50 BYTE), 
	"RECIPE_RECIPE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into COOK.RECIPEBOARD
SET DEFINE OFF;

Insert into recipeboard (RECIPE_NUM,RECIPE_NAME,RECIPE_SUBJECT,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE,RECIPE_DATE,RECIPE_READCOUNT,MEM_ID) values (3,'aa','aa','aa','aa','aa',null,4,'bb');

Insert into recipeboard (RECIPE_NUM,RECIPE_NAME,RECIPE_SUBJECT,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE,RECIPE_DATE,RECIPE_READCOUNT,MEM_ID) values (2,'bb','bb','bb','bb','bb',null,5,'bb');

update recipeboard set recipe_title = 'b' where recipe_readcount=4
select * from recipeboard 
delete from recipeboard where recipe_title='a'

update recipeboard set recipe_date = null where mem_id='aa'
select recipe_pic from recipeBoard where recipe_num=34



