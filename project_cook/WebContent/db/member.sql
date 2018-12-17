--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-25-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" ("MEM_NAME" VARCHAR2(20), "MEM_ID" VARCHAR2(20), "MEM_PASSWD" VARCHAR2(20), "MEM_PHONE" VARCHAR2(20), "MEM_EMAIL" VARCHAR2(20), "MEM_DATE" DATE)
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (MEM_NAME,MEM_ID,MEM_PASSWD,MEM_PHONE,MEM_EMAIL,MEM_DATE) values ('admin','admin','admin','admin','admin',to_date('15/03/25','RR/MM/DD'));
Insert into MEMBER (MEM_NAME,MEM_ID,MEM_PASSWD,MEM_PHONE,MEM_EMAIL,MEM_DATE) values ('bb','bb','bb','bb','bb',to_date('15/03/25','RR/MM/DD'));
Insert into MEMBER (MEM_NAME,MEM_ID,MEM_PASSWD,MEM_PHONE,MEM_EMAIL,MEM_DATE) values ('aa','aa','aa','aa','aa',to_date('15/03/25','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index MEMBER_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEMBER_PK1" ON "MEMBER" ("MEM_ID")
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEM_ID") ENABLE
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_NAME" NOT NULL ENABLE)
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_ID" NOT NULL ENABLE)
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_PASSWD" NOT NULL ENABLE)
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_PHONE" NOT NULL ENABLE)
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_EMAIL" NOT NULL ENABLE)
 
  ALTER TABLE "MEMBER" MODIFY ("MEM_DATE" NOT NULL ENABLE)
