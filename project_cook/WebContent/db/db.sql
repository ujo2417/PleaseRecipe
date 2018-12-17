select * from member
select * from FREEBOARD
select * from FREEBOARDREPLY
select * from recipedb
// 자유게시판 시퀀스
drop sequence autonum;
create sequence autonum;

// 자유게시판 댓글 시퀀스
drop sequence re_autonum;
create sequence re_autonum;

// 사용자레시피게시판 시퀸스
drop sequence recipe_autonum;
create sequence recipe_autonum;



ALTER TABLE "FREEBOARD" MODIFY ("FREE_READCOUNT" DEFAULT 0);

select re_num, re_writer, re_writedate, re_content, free_num from freeboardreply where free_num=41 order by re_num

select * from recipedb where recipedb_meterial like '%갈비%' and recipedb_country='한식' order by recipedb_title desc