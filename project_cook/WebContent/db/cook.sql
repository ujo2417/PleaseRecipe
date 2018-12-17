select * from FREEBOARDREPLY
select * from freeboard
create sequence re_autonum;
create sequence autonum;
select * from member;
select * from recipedb
drop table
select * from recipeboard
select free_num, free_subject, free_content, free_date from freeboard where free_subject like '%23%';

select * from freeboard where free_subject like '%a%';
select recipedb_num, recipedb_title, recipedb_pic from recipedb
select recipedb_num, recipedb_title, recipedb_pic, r
             from(select recipedb_num, recipedb_title, recipedb_pic, rownum r 
            from(select recipedb_num, recipedb_title, recipedb_pic
            from recipedb order by recipedb_num desc) order by recipedb_num desc)
            where r>=1 and r<=10;