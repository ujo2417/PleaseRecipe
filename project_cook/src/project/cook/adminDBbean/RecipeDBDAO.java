package project.cook.adminDBbean;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.naming.*;

import project.cook.boardBean.BoardBean;
import project.cook.recipeBoardBean.RecipeBoardDTO;

public class RecipeDBDAO {
   private static RecipeDBDAO instance = new RecipeDBDAO();

   public static RecipeDBDAO getInstance() {
      return instance;
   }

   public RecipeDBDAO() {} // constructor
   
   
   public Connection getConnection() throws Exception {
      
      InitialContext initCtx = new InitialContext(); 
      Context envContext = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envContext.lookup("jdbc/CookDB");

      return ds.getConnection();
   } // end Connection

   // insert(bean) - 새로운 글을 게시판에 테이블에 추가, 글 입력 처리에 사용됨
      public void insert(RecipeDBDTO bean) throws Exception {

         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
  
         int number = 0;// board 테이블에 들어갈 번호
         String sql = "";

         try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(recipeDB_num) from recipeDB");
            rs = pstmt.executeQuery(); // select 반환값...

            if (rs.next())
               number = rs.getInt(1) + 1;// 다음 글 번호 (지금 추가할 )는 가장 큰번호 +1
            else
               number = 1;// 첫번째 글...

            // insert 명령 실행
            sql = "insert into recipedb(recipedb_num,recipedb_title,recipedb_pic,recipeDB_meterial,recipedb_recipe,recipeDB_country)"
                  + " values(recipeDB_autonum.nextVal,?,?,?,?,?)";
         
            pstmt = conn.prepareStatement(sql);
                      
            pstmt.setString(1, bean.getRecipeDB_title());                    
            pstmt.setString(2, bean.getRecipeDB_pic());
            pstmt.setString(3, bean.getRecipeDB_meterial());
            pstmt.setString(4, bean.getRecipeDB_recipe());
            pstmt.setString(5, bean.getRecipeDB_country());
            
            pstmt.executeUpdate();
         
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
         }

      }// insert(bean) end
   
   
    public RecipeDBDTO update(int num) throws Exception {
           Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
           RecipeDBDTO bean=null;
 
           try {
               conn = getConnection();

               pstmt = conn.prepareStatement("select * from recipeDB where recipeDB_num = ?");
               pstmt.setInt(1, num);
               rs = pstmt.executeQuery();

               if (rs.next()) {
                   bean = new RecipeDBDTO();
                   bean.setRecipeDB_num(rs.getInt("recipeDB_num"));
                   bean.setRecipeDB_title(rs.getString("recipeDB_title"));
                   bean.setRecipeDB_meterial(rs.getString("recipeDB_meterial"));
                   bean.setRecipeDB_recipe(rs.getString("recipeDB_recipe"));
                   bean.setRecipeDB_pic(rs.getString("recipeDB_pic"));
                   bean.setRecipeDB_country(rs.getString("recipeDB_country"));
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
        ResultSet rs= null;     
        
        try {    
           conn = getConnection();
           
           ////////////////////////////////////////////////////////파일삭제
           pstmt2 = conn.prepareStatement( "select recipeDB_pic from recipeDB where recipeDB_num=?");  
           pstmt2.setInt(1, num);
           
           rs = pstmt2.executeQuery();
           
           if(rs.next()){
        	   if(rs.getString(1) != null) {
        		   new File("E:/th88_min/jsp_servlet/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/project_cook/recipepic/" + rs.getString(1)).delete();
                   //new File("/project_cook/recipeUpload//" + rs.getString(1)).delete();

               }
           }

           ////////////////////////////////////////////////////////파일삭제 끝 
           pstmt = conn.prepareStatement( "delete from recipeDB where recipeDB_num=?");    
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
   public void update(RecipeDBDTO bean)   throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;

       String sql="";   
      
       try {
           conn = getConnection();
           sql="update recipeDB set recipeDB_recipe=?, recipeDB_title=?, recipeDB_pic=?, "
           		+ "recipeDB_meterial=?, recipeDB_country=? where recipeDB_num=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, bean.getRecipeDB_recipe());
               pstmt.setString(2, bean.getRecipeDB_title());
               pstmt.setString(3, bean.getRecipeDB_pic());
               pstmt.setString(4, bean.getRecipeDB_meterial());
               pstmt.setString(5, bean.getRecipeDB_country());
               pstmt.setInt(6, bean.getRecipeDB_num());
               System.out.println("===========================================" + bean.getRecipeDB_num());
               pstmt.executeUpdate();
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
   } //update
   
   
   public int getListAllCount() throws Exception {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      int count = 0; //레코드 수 저장 변수

      try{
         conn = getConnection();
         pstmt = conn.prepareStatement("select count(*) from recipeDB");
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

   
   public List<RecipeDBDTO> getSelectAll(int start, int end) {
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List list = null;
      //System.out.println("=================getSelectAll======================");
      try {
         conn = getConnection();
         
         String sql = "select"
               +" recipeDB_NUM,recipeDB_TITLE,recipeDB_PIC,recipeDB_meterial,recipeDB_RECIPE,recipeDB_COUNTRY, r"
               +" from(select recipeDB_NUM,recipeDB_TITLE,recipeDB_PIC,recipeDB_meterial,recipeDB_RECIPE,recipeDB_COUNTRY, rownum r"
               +" from(select recipeDB_NUM,recipeDB_TITLE,recipeDB_PIC,recipeDB_meterial,recipeDB_RECIPE,recipeDB_COUNTRY"
               +" from recipeDB order by recipeDB_NUM desc) order by recipeDB_NUM desc)"
               +" where r>=? and r<=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            list = new ArrayList(end);
            
            do {
               RecipeDBDTO rDTO = new RecipeDBDTO();
               
               rDTO.setRecipeDB_num(rs.getInt("recipeDB_num"));   
               rDTO.setRecipeDB_title(rs.getString("recipeDB_title"));
               rDTO.setRecipeDB_pic(rs.getString("recipeDB_pic"));
               rDTO.setRecipeDB_meterial(rs.getString("recipeDB_meterial"));
               rDTO.setRecipeDB_recipe(rs.getString("recipeDB_recipe"));  
               rDTO.setRecipeDB_country(rs.getString("recipeDB_country"));
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
   }// end getSelectAll : RecipeDBDTO 형태로 List화 한다(변수 두개는 처음과 끝값)
   
   
   public RecipeDBDTO getDataDetail(int num) throws Exception{
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      RecipeDBDTO bean = null;
      String sql = "";
      try{    
         
         conn = getConnection();
         pstmt = conn.prepareStatement("select * from recipeDB where recipeDB_num=?");      
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery(); //반환값이 있음 => select
         
         if(rs.next()){
            bean = new RecipeDBDTO();

            bean.setRecipeDB_num(rs.getInt("recipeDB_num"));
            bean.setRecipeDB_title(rs.getString("recipeDB_title"));
            bean.setRecipeDB_pic(rs.getString("recipeDB_pic"));
            bean.setRecipeDB_meterial(rs.getString("recipeDB_meterial"));
            bean.setRecipeDB_recipe(rs.getString("recipeDB_recipe"));
            bean.setRecipeDB_country(rs.getString("recipeDB_country"));
         }//end if
         
      }catch(Exception e){e.printStackTrace();
      }finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
         }
      return bean;
   }   
   
   public List<BoardBean> adminList(){
	   Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null; //글 목록을 저장하는 객체
		
		try{
			conn = getConnection();
			String sql = "select free_num, free_subject, free_date, free_content, free_readcount, mem_id "
					+ "from freeboard";
			
			pstmt = conn.prepareStatement(sql);
		System.out.println("asdasfqw");
			rs = pstmt.executeQuery(); //resultset 반환
			
			if(rs.next()){ //ResultSet이 레코드를 가짐
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
			//Resultset 에 있는 레코드 수만큼 반복수행
				do{
					BoardBean bean = new BoardBean();
					bean.setFree_num(rs.getInt("free_num"));
					bean.setFree_subject(rs.getString("free_subject"));
					bean.setFree_date(rs.getTimestamp("Free_date"));
					bean.setFree_readcount(rs.getInt("free_readcount"));
					bean.setMem_id(rs.getString("mem_id"));
					//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
					list.add(bean);
			System.out.println("rwhrwhw");		
				}while(rs.next());
			}//if end
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		
		return list;
   }
   
   public List<RecipeBoardDTO> recipeList(){
	   Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null; //글 목록을 저장하는 객체
		
		try{
			conn = getConnection();
			String sql = "select"
               +" RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE" 
               +" from recipeboard";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //resultset 반환
			
			if(rs.next()){ //ResultSet이 레코드를 가짐
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
			//Resultset 에 있는 레코드 수만큼 반복수행
				do{
					RecipeBoardDTO rDTO = new RecipeBoardDTO();
		               
		               rDTO.setRecipe_num(rs.getInt("recipe_num"));
		               rDTO.setMem_id(rs.getString("mem_id"));
		               rDTO.setRecipe_subject(rs.getString("recipe_subject"));
		               rDTO.setRecipe_date(rs.getTimestamp("recipe_date"));
		               rDTO.setRecipe_readcount(rs.getInt("recipe_readcount"));
		               rDTO.setRecipe_title(rs.getString("recipe_title"));
		               rDTO.setRecipe_pic(rs.getString("recipe_pic"));
		               rDTO.setRecipe_material(rs.getString("recipe_material"));
		               rDTO.setRecipe_recipe(rs.getString("recipe_recipe"));               
		               list.add(rDTO);	
				}while(rs.next());
			}//if end
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		
		return list;
   }
   
/*   ================================== RecipeDB 검색=====================================*/
   
   public List<RecipeDBDTO> recipeBoardSearch(String title) { // 레시피 검색
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      List list = null;
	      RecipeDBDTO bean = null;
	      ResultSet rs = null;

	      try {
	         conn = getConnection();
	         String sql = "select recipeDB_num,recipeDB_pic,recipeDB_title, recipeDB_recipe, recipeDB_country, recipeDB_meterial from recipeDB where recipeDB_title like '%"
	               + title + "%' order by recipeDB_num desc";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            list = new ArrayList(); // 몇개의 객체를 저장할지 크기를 지정해서 객체를 생성

	            // Resultset 에 있는 레코드 수만큼 반복수행
	            do {
	               bean = new RecipeDBDTO();

	               bean.setRecipeDB_num(new Integer(rs.getInt("recipeDB_num")));
	               bean.setRecipeDB_pic(rs.getString("recipeDB_pic"));
	               bean.setRecipeDB_title(rs.getString("recipeDB_title"));
	               bean.setRecipeDB_recipe(rs.getString("recipeDB_recipe"));
	               bean.setRecipeDB_country(rs.getString("recipeDB_country"));
	               bean.setRecipeDB_meterial(rs.getString("recipeDB_meterial"));
	               
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
} // recipeBoardSearch end
   
}