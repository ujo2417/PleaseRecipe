select * from member
select * from FREEBOARD
select * from FREEBOARDREPLY
select * from recipedb
// �����Խ��� ������
drop sequence autonum;
create sequence autonum;

// �����Խ��� ��� ������
drop sequence re_autonum;
create sequence re_autonum;

// ����ڷ����ǰԽ��� ������
drop sequence recipe_autonum;
create sequence recipe_autonum;



ALTER TABLE "FREEBOARD" MODIFY ("FREE_READCOUNT" DEFAULT 0);

select re_num, re_writer, re_writedate, re_content, free_num from freeboardreply where free_num=41 order by re_num

select * from recipedb where recipedb_meterial like '%����%' and recipedb_country='�ѽ�' order by recipedb_title desc