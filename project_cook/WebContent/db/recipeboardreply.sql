--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-25-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table recipeBOARDREPLY
--------------------------------------------------------
drop table recipeboardreply

  CREATE TABLE "recipeBOARDREPLY" ("RE_NUM" NUMBER, "RE_CONTENT" VARCHAR2(20), "RE_WRITEDATE" VARCHAR2(20), "recipe_NUM" NUMBER)
REM INSERTING into recipeBOARDREPLY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index recipeBOARDREPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "recipeBOARDREPLY_PK" ON "recipeBOARDREPLY" ("RE_NUM")


--------------------------------------------------------
--  Constraints for Table recipeBOARDREPLY
--------------------------------------------------------

  ALTER TABLE "recipeBOARDREPLY" ADD CONSTRAINT "recipeBOARDREPLY_PK" PRIMARY KEY ("RE_NUM") ENABLE;
 
  ALTER TABLE "recipeBOARDREPLY" MODIFY ("RE_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "recipeBOARDREPLY" MODIFY ("RE_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "recipeBOARDREPLY" MODIFY ("RE_WRITEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "recipeBOARDREPLY" MODIFY ("recipe_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table recipeBOARDREPLY
--------------------------------------------------------

  ALTER TABLE "recipeBOARDREPLY" ADD CONSTRAINT "recipeBOARDREPLY_FK1" FOREIGN KEY ("recipe_NUM") REFERENCES "recipeBOARD" ("recipe_NUM") ENABLE
