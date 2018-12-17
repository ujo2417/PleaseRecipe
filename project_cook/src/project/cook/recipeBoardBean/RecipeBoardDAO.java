package project.cook.recipeBoardBean;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.naming.*;

import project.cook.boardBean.BoardBean;
import project.cook.boardBean.ReplyBean;
import project.cook.recipeBoardBean.RecipeBoardDTO;


public class RecipeBoardDAO {
   private static RecipeBoardDAO instance = new RecipeBoardDAO();

   public static RecipeBoardDAO getInstance() {
      return instance;
   }

   public RecipeBoardDAO() {} // constructor
   
   
   public Connection getConnection() throws Exception {
      
      InitialContext initCtx = new InitialContext(); 
      Context envContext = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envContext.lookup("jdbc/CookDB");

      return ds.getConnection();
   } // end Connection

   // insert(bean) - 새로운 글을 게시판에 테이블에 추가, 글 입력 처리에 사용됨
      public void insert(RecipeBoardDTO bean) throws Exception {

         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         // 답변글인지 일반(새글) 글인지 구분해서 입력 시켜주는 로직
         int num = bean.getRecipe_num(); // 부모 글번호
         int number = 0;// board 테이블에 들어갈 번호
         String sql = "";

         try {
            conn = getConnection();

            // 현재 board 테이블에 레코드의 유무 판단과 글번호를 결정
            // Statement stmt = conn.createStatement(); 왜 넣은거야

            pstmt = conn.prepareStatement("select max(recipe_num) from recipeboard");
            rs = pstmt.executeQuery(); // select 반환값...
            // 레코드가 존재한다면...

            if (rs.next())
               number = rs.getInt(1) + 1;// 다음 글 번호 (지금 추가할 )는 가장 큰번호 +1
            else
               number = 1;// 첫번째 글...

            // insert 명령 실행
            sql = "insert into recipeboard(recipe_num, recipe_subject, recipe_title, recipe_date, mem_id,"
                  + " recipe_pic, recipe_material, recipe_recipe, recipe_readcount)"
                  + " values(recipe_autonum.nextVal,?,?,?,?,?, ?, ?, ?)";
         
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, bean.getRecipe_subject());
            pstmt.setString(2, bean.getRecipe_title());
            pstmt.setTimestamp(3, bean.getRecipe_date());
            pstmt.setString(4, bean.getMem_id());//
            pstmt.setString(5, bean.getRecipe_pic());
            pstmt.setString(6, bean.getRecipe_material());
            pstmt.setString(7, bean.getRecipe_recipe());
            pstmt.setInt(8, bean.getRecipe_readcount());
            pstmt.executeUpdate();
         
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
         }

      }// insert(bean) end
   
   
    public RecipeBoardDTO update(int num)   throws Exception {
           Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
           RecipeBoardDTO bean=null;
           try {
               conn = getConnection();

               pstmt = conn.prepareStatement("select * from recipeboard where recipe_num = ?");
               pstmt.setInt(1, num);
               rs = pstmt.executeQuery();

               if (rs.next()) {
                   bean = new RecipeBoardDTO();
                   bean.setRecipe_num(rs.getInt("recipe_num"));
                   bean.setRecipe_subject(rs.getString("recipe_subject"));
                   bean.setMem_id(rs.getString("mem_id"));
                   bean.setRecipe_date(rs.getTimestamp("recipe_date"));
                   bean.setRecipe_readcount(rs.getInt("recipe_readcount"));
                   bean.setRecipe_title(rs.getString("recipe_title"));
                   bean.setRecipe_material(rs.getString("recipe_material"));
                   bean.setRecipe_recipe(rs.getString("recipe_recipe"));
                   bean.setRecipe_pic(rs.getString("recipe_pic"));
            }
           } catch(Exception ex) {
               ex.printStackTrace();
           } finally {
               if (rs != null) try { rs.close(); } catch(SQLException ex) {}
               if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
               if (conn != null) try { conn.close(); } catch(SQLException ex) {}
           }
         return bean;
       } //update(int num) end
   
   
   public void delete(int num) throws Exception {
	   	Connection conn = null;    
        PreparedStatement pstmt = null;  
        PreparedStatement pstmt2 = null; 
        PreparedStatement pstmt3 = null; 
        ResultSet rs= null;     
        
        try {    
           conn = getConnection();
           
           ////////////////////////////////////////////////////////파일삭제
           pstmt2 = conn.prepareStatement( "select recipe_pic from recipeBoard where recipe_num=?");  
           pstmt2.setInt(1, num);
           rs = pstmt2.executeQuery();
           
           if(rs.next()){
        	   if(rs.getString(1) != null) {
                   new File("E:/th88_min/jsp_servlet/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/project_cook/recipeUpload/" + rs.getString(1)).delete();
                   //new File("/project_cook/recipeUpload//" + rs.getString(1)).delete();

               }
           }

           ////////////////////////////////////////////////////////파일삭제 끝 
           
           //////// 보드 안에 리플 삭제
           pstmt3 = conn.prepareStatement( "delete from recipeBoardreply where recipe_num=?");    
           pstmt3.setInt(1, num);  
           pstmt3.executeUpdate(); 
           
           //////// 보드 삭제
           pstmt = conn.prepareStatement( "delete from recipeBoard where recipe_num=?");    
           pstmt.setInt(1, num);  
           pstmt.executeUpdate(); 
           
           
         } catch(Exception ex) {      
              ex.printStackTrace();    
         } finally {    
              if (rs != null) try { rs.close(); } catch(SQLException ex) {}   
              if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
              if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
              if (conn != null) try { conn.close(); } catch(SQLException ex) {}   
         }  
   }
   //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
   public void update(RecipeBoardDTO bean)   throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;

       String sql="";   
      
       try {
           conn = getConnection();
           sql="update recipeboard set recipe_subject=?, recipe_recipe=?, recipe_title=?, recipe_pic=?, "
           		+ "recipe_material=? where recipe_num=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, bean.getRecipe_subject());
               pstmt.setString(2, bean.getRecipe_recipe());
               pstmt.setString(3, bean.getRecipe_title());
               pstmt.setString(4, bean.getRecipe_pic());
               pstmt.setString(5, bean.getRecipe_material());
               pstmt.setInt(6, bean.getRecipe_num());

               pstmt.executeUpdate();
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
   } //update(BoardBean bean) end
   
   
   public int getListAllCount() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int count = 0; //레코드 수 저장 변수

      try{
         conn = getConnection();
         pstmt = conn.prepareStatement("select count(*) from recipeboard");
         rs = pstmt.executeQuery();

         if(rs.next()) count = rs.getInt(1);


      }catch(Exception e){e.printStackTrace();
      }finally {
         if(rs != null) try{rs.close();}catch(Exception e){}
         if(pstmt != null) try{pstmt.close();}catch(Exception e){}
         if(conn != null) try{conn.close();}catch(Exception e){}            
      }
      return count;

   }// end getListAllCount : 페이징을 위한 총 row수? 

   
   public List<RecipeBoardDTO> getSelectAll(int start, int end) {

      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      PreparedStatement pstmt2 = null;
      ResultSet rs2 = null;
      List list = null;
      System.out.println("=================getSelectAll======================");
      try {
         conn = getConnection();
         /*String sql = "select RECIPE_NUM,MEM_ID,,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE from recipeboard";*/
         String sql = "select"
               +" RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE, r"
               +" from(select RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE, rownum r"
               +" from(select RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE"
               +" from recipeboard order by RECIPE_NUM desc) order by RECIPE_NUM desc)"
               +" where r>=? and r<=?";
			String sql2 = "select recipe_num, (select count(*) from recipeboardreply where recipeboard.recipe_num=recipeboardreply.recipe_num)"
					+ " as a from recipeboard";
			pstmt = conn.prepareStatement(sql);
			pstmt2 = conn.prepareStatement(sql2);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end); // 추출할 레코드의 수
			rs = pstmt.executeQuery(); // resultset 반환

         if(rs.next()) {
            list = new ArrayList(end);
            
            do {
               RecipeBoardDTO rDTO = new RecipeBoardDTO();
               rs2 = pstmt2.executeQuery();
    
               rDTO.setRecipe_num(rs.getInt("recipe_num"));
               while(rs2.next()) {
            	if(rs2.getInt("recipe_num") == rs.getInt("recipe_num")){
            	rDTO.setRecipe_subject(rs.getString("recipe_subject") + " (" + rs2.getInt("a") + ")");

            	}
            	}
               rDTO.setMem_id(rs.getString("mem_id"));
              // rDTO.setRecipe_subject(rs.getString("recipe_subject"));
               rDTO.setRecipe_date(rs.getTimestamp("recipe_date"));
               rDTO.setRecipe_readcount(rs.getInt("recipe_readcount"));
               rDTO.setRecipe_title(rs.getString("recipe_title"));
               rDTO.setRecipe_pic(rs.getString("recipe_pic"));
               rDTO.setRecipe_material(rs.getString("recipe_material"));
               rDTO.setRecipe_recipe(rs.getString("recipe_recipe"));               
               list.add(rDTO);
                      
            } while(rs.next());
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         if(rs != null) try{rs.close();}catch(Exception e){}
         if(pstmt != null) try{pstmt.close();}catch(Exception e){}
         if(conn != null) try{conn.close();}catch(Exception e){}
         
      }
      return list;
   }// end getSelectAll : recipeBoardDTO 형태로 List화 한다(변수 두개는 처음과 끝값)
   
   
   public RecipeBoardDTO getDataDetail(int num) throws Exception{
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      RecipeBoardDTO bean = null;
      String sql = "";
      try{
         sql = "update recipeboard set recipe_readcount = recipe_readcount +1 where recipe_num=? ";
         
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, num);
         pstmt.executeUpdate(); //반환값이 없는 경우 -insert, update, delete
         
         pstmt= conn.prepareStatement("select * from recipeboard where recipe_num =?");      
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery(); //반환값이 있음 => select
         
         if(rs.next()){
            bean = new RecipeBoardDTO();
            bean.setMem_id(rs.getString("mem_id"));
            bean.setRecipe_num(rs.getInt("recipe_num"));
            bean.setRecipe_subject(rs.getString("recipe_subject"));
            bean.setRecipe_date(rs.getTimestamp("recipe_date"));
            bean.setRecipe_readcount(rs.getInt("recipe_readcount"));
            bean.setRecipe_title(rs.getString("recipe_title"));
            bean.setRecipe_pic(rs.getString("recipe_pic"));
            bean.setRecipe_material(rs.getString("recipe_material"));
            bean.setRecipe_recipe(rs.getString("recipe_recipe"));
            bean.setRecipe_good(rs.getInt("recipe_good"));
         }//end if
         
      }catch(Exception e){e.printStackTrace();
      }finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
         }
      return bean;
   }
   
   
	 
	//////////////// [ 댓글 삽입 ]================================================================
	public void re_insert(RecipeReplyBean bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = bean.getRecipe_num(); // 부모 글번호
		int number = 0;// reply 테이블에 들어갈 번호
		String sql = "";

		try {
			conn = getConnection();

			// 현재 board 테이블에 레코드의 유무 판단과 글번호를 결정
			// Statement stmt = conn.createStatement(); 왜 넣은거야

			pstmt = conn.prepareStatement("select max(re_num) from recipeboardreply");
			rs = pstmt.executeQuery(); // select 반환값...
			// 레코드가 존재한다면...
			
			if (rs.next())
				number = rs.getInt(1) + 1;// 다음 글 번호 (지금 추가할 )는 가장 큰번호 +1
			else
				number = 1;// 첫번째 글...

			// insert 명령 실행
			sql = "insert into recipeboardreply(re_num, re_content, re_writedate, recipe_num, mem_id)  "
					+ " values(recipe_re_autonum.nextVal,?,?,?,?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getRe_content());
			pstmt.setTimestamp(2, bean.getRe_writedate());
			pstmt.setInt(3, bean.getRecipe_num());
			pstmt.setString(4, bean.getMem_id());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}

	}

	public int getReplyAllCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0; //레코드 수 저장 변수
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from recipeboardreply where recipe_num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		return count;
	}
	
	public List<RecipeBoardDTO> getReplyAll(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null; //글 목록을 저장하는 객체
		
		try{
			conn = getConnection();
			/*String sql = "select re_num, re_writer, re_writedate, re_content, free_num, r "
					+ "from(select re_num, re_writer, re_writedate, re_content, free_num, rownum r "
					+ "from(select re_num, re_writer, re_writedate, re_content, free_num "
					+ "from freeboardreply order by re_num desc) order by re_num desc)"
					+ "where r>=? and r<=?";*/
			String sql = "select re_num, re_writedate, re_content, recipe_num, mem_id from recipeboardreply where recipe_num=? order by re_num";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			/*pstmt.setInt(1, start);
			pstmt.setInt(2, end); //추출할 레코드의 수
*/			rs = pstmt.executeQuery(); //resultset 반환
			
			if(rs.next()){ //ResultSet이 레코드를 가짐
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
			//Resultset 에 있는 레코드 수만큼 반복수행
				do{
					RecipeReplyBean bean = new RecipeReplyBean();
					bean.setRe_num(rs.getInt("re_num"));
					bean.setRe_content(rs.getString("re_content"));
					bean.setRe_writedate(rs.getTimestamp("re_writedate"));
					bean.setRecipe_num(rs.getInt("recipe_num"));
					bean.setMem_id(rs.getString("mem_id"));
					//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
					list.add(bean);
					
				}while(rs.next());
			}//if end
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		
		return list;
		
	}// getSelectAll(startRow, endRow) end

	public void re_delete(int re_num) {
		Connection conn = null;    
	     PreparedStatement pstmt = null;    
	    
	     
	     try {    
	    	 conn = getConnection();
	    	 pstmt = conn.prepareStatement( "delete from recipeboardreply where re_num=?");    
           pstmt.setInt(1, re_num);  
           pstmt.executeUpdate();   

	      } catch(Exception ex) {      
	           ex.printStackTrace();    
	      } finally {    
	           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}   
	      }  
	}
	
	public int recipeGood(int num, int good, String id){
		  Connection conn = null;
	      PreparedStatement pstmt = null;
	      PreparedStatement pstmt2 = null;
	      PreparedStatement pstmt3 = null;
	      ResultSet rs = null;
	      int check=0;
	      try{
	         conn = getConnection();
	         String sql = "select * from recipeboardgood where recipe_num=? and mem_id=?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setString(2, id);
	        
	         rs = pstmt.executeQuery(); //resultset 반환
	         
	         if(rs.next()){ //ResultSet이 레코드를 가짐
	         }//if end
	         else{
	        	 sql="insert into recipeboardgood(recipe_num, mem_id) values(?,?)";
	        	 pstmt2=conn.prepareStatement(sql);
	        	 pstmt2.setInt(1, num);
	        	 pstmt2.setString(2, id);
	        	 pstmt2.executeUpdate();
	        	 
	        	 sql="update recipeboard set recipe_good=? where recipe_num=?";
	        	 pstmt3=conn.prepareStatement(sql);
	        	 pstmt3.setInt(1, good+1);
	        	 pstmt3.setInt(2, num);
	        	 pstmt3.executeUpdate();
	        	 check=1;
	         }
	         
	      }catch(Exception e){e.printStackTrace();
	      }finally {
	            if(rs != null) try{rs.close();}catch(Exception e){}
	            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
	            if(pstmt2 != null) try{pstmt.close();}catch(Exception e){}
	            if(pstmt3 != null) try{pstmt.close();}catch(Exception e){}
	            if(conn != null) try{conn.close();}catch(Exception e){}
	            
	      }
	      
	      return check;
	}
	
	//////////////////////////////////////////////////////
	 public List<RecipeBoardDTO> recipeBoardSearch(String subject) { // 검색
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      List list = null;
	      RecipeBoardDTO bean = null;
	      ResultSet rs = null;

	      try {
	         conn = getConnection();
	         String sql = "select * from recipeboard where recipe_subject like '%"
	               + subject + "%' order by recipe_num desc";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            list = new ArrayList(); // 몇개의 객체를 저장할지 크기를 지정해서 객체를 생성

	            // Resultset 에 있는 레코드 수만큼 반복수행
	            do {
	               bean = new RecipeBoardDTO();

	               bean.setRecipe_num(new Integer(rs.getInt("recipe_num")));

	               bean.setRecipe_subject(rs.getString("recipe_subject"));
	            //   bean.setRecipe_title(rs.getString("recipe_title"));
	               bean.setRecipe_date(rs.getTimestamp("recipe_date"));
	               bean.setMem_id(rs.getString("mem_id"));
	               bean.setRecipe_readcount(rs.getInt("recipe_readcount"));
	            //   bean.setRecipe_pic(rs.getString("recipe_pic"));
	            //   bean.setRecipe_material(rs.getString("recipe_material"));
	            //   bean.setRecipe_recipe(rs.getString("recipe_recipe"));
	            //   bean.setRecipe_good(rs.getInt("recipe_good"));
	               list.add(bean);

	            } while (rs.next());
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (Exception e) {
	            }
	         if (conn != null)
	            try {
	               conn.close();
	            } catch (Exception e) {
	            }
	         if (rs != null)
	            try {
	               rs.close();
	            } catch (Exception e) {
	            }
	      }
	      return list;
}
}