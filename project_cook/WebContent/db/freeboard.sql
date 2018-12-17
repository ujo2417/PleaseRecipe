--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-25-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FREEBOARD
--------------------------------------------------------
drop table freeboard

  CREATE TABLE "FREEBOARD" ("FREE_NUM" NUMBER, "FREE_NAME" VARCHAR2(20), "FREE_SUBJECT" VARCHAR2(20), "FREE_CONTENT" VARCHAR2(20), "FREE_DATE" DATE, "FREE_READCOUNT" NUMBER, "MEM_ID" VARCHAR2(20))
REM INSERTING into FREEBOARD
SET DEFINE OFF;
Insert into FREEBOARD (FREE_NUM,FREE_NAME,FREE_SUBJECT,FREE_CONTENT,FREE_DATE,FREE_READCOUNT,MEM_ID) values (3,'aa','aa','aa',to_date('15/03/25','RR/MM/DD'),null,'aa');
Insert into FREEBOARD (FREE_NUM,FREE_NAME,FREE_SUBJECT,FREE_CONTENT,FREE_DATE,FREE_READCOUNT,MEM_ID) values (4,'bb','bb','bb',to_date('15/03/25','RR/MM/DD'),null,'aa');
Insert into FREEBOARD (FREE_NUM,FREE_NAME,FREE_SUBJECT,FREE_CONTENT,FREE_DATE,FREE_READCOUNT,MEM_ID) values (1,'cc','cc','cc',to_date('15/03/25','RR/MM/DD'),null,'aa');
--------------------------------------------------------
--  DDL for Index FREEBOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FREEBOARD_PK" ON "FREEBOARD" ("FREE_NUM")
--------------------------------------------------------
--  Constraints for Table FREEBOARD
--------------------------------------------------------

  ALTER TABLE "FREEBOARD" ADD CONSTRAINT "FREEBOARD_PK" PRIMARY KEY ("FREE_NUM") ENABLE;
 
  ALTER TABLE "FREEBOARD" MODIFY ("FREE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARD" MODIFY ("FREE_SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARD" MODIFY ("FREE_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARD" MODIFY ("FREE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARD" MODIFY ("MEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table FREEBOARD
--------------------------------------------------------

  ALTER TABLE "FREEBOARD" ADD CONSTRAINT "MEM_ID_FK" FOREIGN KEY ("MEM_ID") REFERENCES "MEMBER" ("MEM_ID") ENABLE
