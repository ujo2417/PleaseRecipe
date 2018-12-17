--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-25-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FREEBOARDREPLY
--------------------------------------------------------
drop table freeboardreply

  CREATE TABLE "FREEBOARDREPLY" ("RE_NUM" NUMBER, "RE_CONTENT" VARCHAR2(20), "RE_WRITEDATE" VARCHAR2(20), "FREE_NUM" NUMBER)
REM INSERTING into FREEBOARDREPLY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index FREEBOARDREPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FREEBOARDREPLY_PK" ON "FREEBOARDREPLY" ("RE_NUM")


--------------------------------------------------------
--  Constraints for Table FREEBOARDREPLY
--------------------------------------------------------

  ALTER TABLE "FREEBOARDREPLY" ADD CONSTRAINT "FREEBOARDREPLY_PK" PRIMARY KEY ("RE_NUM") ENABLE;
 
  ALTER TABLE "FREEBOARDREPLY" MODIFY ("RE_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARDREPLY" MODIFY ("RE_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARDREPLY" MODIFY ("RE_WRITEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "FREEBOARDREPLY" MODIFY ("FREE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table FREEBOARDREPLY
--------------------------------------------------------

  ALTER TABLE "FREEBOARDREPLY" ADD CONSTRAINT "FREEBOARDREPLY_FK1" FOREIGN KEY ("FREE_NUM") REFERENCES "FREEBOARD" ("FREE_NUM") ENABLE
