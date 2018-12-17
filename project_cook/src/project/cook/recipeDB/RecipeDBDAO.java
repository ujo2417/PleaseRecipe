package project.cook.recipeDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import project.cook.adminDBbean.RecipeDBDTO;
import project.cook.boardBean.BoardBean;


public class RecipeDBDAO {
	   private static RecipeDBDAO instance = new RecipeDBDAO();

	public static RecipeDBDAO getInstance() {
		return instance;
	}

	public RecipeDBDAO() {
	}

	public Connection getConnection() throws Exception {
		// JNDI & Pool 형태로 연결 객체 생성해서 리턴할것....
		InitialContext initCtx = new InitialContext(); 
		Context envContext = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/CookDB");

		return ds.getConnection();
	} // getConnection() end

	// insert(bean) - 새로운 글을 게시판에 테이블에 추가, 글 입력 처리에 사용됨
	
	public List<RecipeDBBean> materialSearch(String material1, String country){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List list = null;
		RecipeDBBean bean = null;
		
		try {
			conn = getConnection();
			/*String sql = "select * from freeboard where free_subject like '%"+material+"%'";*/
			/*String sql = "select * from freeboard where free_subject like '%?%'";*/
			if(country.equals("전체")){
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			else{
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%' and recipedb_country='"+country+"' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
				
				System.out.println(material1+"rs안이다");		
				//Resultset 에 있는 레코드 수만큼 반복수행
					do{
						bean = new RecipeDBBean();
						
						bean.setRecipedb_num(new Integer(rs.getInt("recipedb_num")) );
						bean.setRecipedb_title(rs.getString("recipedb_title"));
						bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
						bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
						bean.setRecipedb_pic(rs.getString("recipedb_pic"));
						bean.setRecipedb_good(rs.getInt("recipedb_good"));
						bean.setRecipedb_country(rs.getString("recipedb_country"));
						//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
						list.add(bean);
						
						
						
					}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}
		return list;
	}
	
	public List<RecipeDBBean> materialSearch(String material1, String material2, String country){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List list = null;
		RecipeDBBean bean = null;
		
		try {
			conn = getConnection();
			/*String sql = "select * from freeboard where free_subject like '%"+material+"%'";*/
			/*String sql = "select * from freeboard where free_subject like '%?%'";*/
			
			if(country.equals("전체")){
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%'"
						+ "and recipedb_meterial like '%"+material2+"%' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			else{
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%' and recipedb_meterial like '%"+material2+"%' and recipedb_country='"+country+"' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
				
						
				//Resultset 에 있는 레코드 수만큼 반복수행
					do{
						bean = new RecipeDBBean();
						
						bean.setRecipedb_num(new Integer(rs.getInt("recipedb_num")) );
						bean.setRecipedb_title(rs.getString("recipedb_title"));
						bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
						bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
						bean.setRecipedb_pic(rs.getString("recipedb_pic"));
						bean.setRecipedb_good(rs.getInt("recipedb_good"));
						bean.setRecipedb_country(rs.getString("recipedb_country"));
						//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
						list.add(bean);
						
						
						
					}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}
		return list;
	}
	
	
	public List<RecipeDBBean> materialSearch(String material1, String material2, String material3, String country){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List list = null;
		RecipeDBBean bean = null;
		
		try {
			conn = getConnection();
			/*String sql = "select * from freeboard where free_subject like '%"+material+"%'";*/
			/*String sql = "select * from freeboard where free_subject like '%?%'";*/
			
			if(country.equals("전체")){
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%'"
						+ "and recipedb_meterial like '%"+material2+"%'"
								+ "and recipedb_meterial like '%"+material3+"%'"
								+ "order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			else{
				String sql = "select * from recipedb where recipedb_meterial like '%"+material1+"%' "
						+ "and recipedb_meterial like '%"+material2+"%' "
								+ "and recipedb_meterial like '%"+material3+"%' "
										+ "and recipedb_country='"+country+"' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}

			rs = pstmt.executeQuery();
					
			if(rs.next()){
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
				
						
				//Resultset 에 있는 레코드 수만큼 반복수행
					do{
						bean = new RecipeDBBean();
						
						bean.setRecipedb_num(new Integer(rs.getInt("recipedb_num")) );
						bean.setRecipedb_title(rs.getString("recipedb_title"));
						bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
						bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
						bean.setRecipedb_pic(rs.getString("recipedb_pic"));
						bean.setRecipedb_good(rs.getInt("recipedb_good"));
						bean.setRecipedb_country(rs.getString("recipedb_country"));
						//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
						list.add(bean);
						
						
						
					}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}
		return list;
	}
	
	public List<RecipeDBBean> subjectSearch(String subject, String country){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List list = null;
		RecipeDBBean bean = null;
		
		try {
			conn = getConnection();
			/*String sql = "select * from freeboard where free_subject like '%"+material+"%'";*/
			/*String sql = "select * from freeboard where free_subject like '%?%'";*/
			
			
			if(country.equals("전체")){
				String sql = "select * from recipedb where recipedb_title like '%"+subject+"%' order by recipedb_title desc";
				pstmt = conn.prepareStatement(sql);
			}
			else{
				String sql = "select * from recipedb where recipedb_title like '%"+subject+"%' "
						+ "and recipedb_country = '"+country+"' order by recipedb_title desc";

				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
				
				//Resultset 에 있는 레코드 수만큼 반복수행
					do{
						bean = new RecipeDBBean();
						
						bean.setRecipedb_num(new Integer(rs.getInt("recipedb_num")) );
						bean.setRecipedb_title(rs.getString("recipedb_title"));
						bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
						bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
						bean.setRecipedb_pic(rs.getString("recipedb_pic"));
						bean.setRecipedb_good(rs.getInt("recipedb_good"));
						bean.setRecipedb_country(rs.getString("recipedb_country"));
						//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
						list.add(bean);
						
					}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}
		return list;
	}
	
	
	public RecipeDBBean getRecipeDetail(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RecipeDBBean bean = null;
		String sql = "";
		try{
			sql = "update recipedb set recipedb_readcount = recipedb_readcount +1 where recipedb_num=? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); //반환값이 없는 경우 -insert, update, delete
			
			pstmt= conn.prepareStatement("select * from recipedb where recipedb_num =?");		
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //반환값이 있음 => select
			
			if(rs.next()){
				bean = new RecipeDBBean();
				bean.setRecipedb_num(rs.getInt("recipedb_num"));
				bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
				bean.setRecipedb_title(rs.getString("recipedb_title"));
				bean.setRecipedb_readcount(rs.getInt("recipedb_readcount"));
				bean.setRecipedb_pic(rs.getString("recipedb_pic"));
				bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
				bean.setRecipedb_country(rs.getString("recipedb_country"));
				bean.setRecipedb_good(rs.getInt("recipedb_good"));
			}//end if
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		return bean;
	}

	
	
	public int getListAllCount() throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      int count = 0; //레코드 수 저장 변수

	      try{
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select count(*) from recipedb");
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
	
	
	public List recipeDBList(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list =null;
		
		String sql = "";
		
		
		
		 /*String sql = "select"
	               +" RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE, r"
	               +" from(select RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE, rownum r"
	               +" from(select RECIPE_NUM,MEM_ID,RECIPE_SUBJECT,RECIPE_DATE,RECIPE_READCOUNT,RECIPE_TITLE,RECIPE_PIC,RECIPE_MATERIAL,RECIPE_RECIPE"
	               +" from recipeboard order by RECIPE_NUM desc) order by RECIPE_NUM desc)"
	               +" where r>=? and r<=?";*/
		
		
		try{
			/*sql = "select * from recipedb order by recipedb_num desc";*/
			/*sql="select recipedb_num, recipedb_meterial, recipedb_readcount, recipedb_title, recipedb_pic, recipedb_recipe, recipedb_country, recipedb_good, r"
				+"from(select recipedb_num, recipedb_meterial, recipedb_readcount, recipedb_title, recipedb_pic, recipedb_recipe, recipedb_country, recipedb_good, rownum r"
				+"from(select recipedb_num, recipedb_meterial, recipedb_readcount, recipedb_title, recipedb_pic, recipedb_recipe, recipedb_country, recipedb_good"
				+"from recipedb order by recipedb_num desc) order by recipedb_num desc)"
				+"where r>=? and r<=?";*/
			sql= "select recipedb_num, recipedb_title, recipedb_pic, recipedb_meterial,recipedb_good,recipedb_country, r "
            + "from(select recipedb_num, recipedb_title, recipedb_pic,recipedb_meterial,recipedb_good, recipedb_country, rownum r "
            + "from(select recipedb_num, recipedb_title, recipedb_pic,recipedb_meterial,recipedb_good, recipedb_country "
            + "from recipedb order by recipedb_num desc) order by recipedb_num desc)"
            + "where r>=? and r<=?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				list = new ArrayList(endRow);
				do{
					RecipeDBBean bean = new RecipeDBBean();
					bean.setRecipedb_num(rs.getInt("recipedb_num"));
					bean.setRecipedb_title(rs.getString("recipedb_title"));
					bean.setRecipedb_pic(rs.getString("recipedb_pic"));
					bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
					bean.setRecipedb_good(rs.getInt("recipedb_good"));
					bean.setRecipedb_country(rs.getString("recipedb_country"));
					list.add(bean);
				} while(rs.next());
			}//end if
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
			}
		return list;
	}

	public int recipeDBGood(int num, int good, String id) {
		 Connection conn = null;
	      PreparedStatement pstmt = null;
	      PreparedStatement pstmt2 = null;
	      PreparedStatement pstmt3 = null;
	      ResultSet rs = null;
	      int check=0;
	      try{
	         conn = getConnection();
	         String sql = "select * from recipedbgood where recipedb_num=? and mem_id=?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setString(2, id);
	        
	         rs = pstmt.executeQuery(); //resultset 반환
	         
	         if(rs.next()){ //ResultSet이 레코드를 가짐
	         }//if end
	         else{
	        	 sql="insert into recipedbgood(recipedb_num, mem_id) values(?,?)";
	        	 pstmt2=conn.prepareStatement(sql);
	        	 pstmt2.setInt(1, num);
	        	 pstmt2.setString(2, id);
	        	 pstmt2.executeUpdate();
	        	 
	        	 sql="update recipedb set recipedb_good=? where recipedb_num=?";
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
	
	
	
	
	
	public List<RecipeDBBean> recipeBoardSearch(String subject) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list =null;
		
		String sql = "";	
		try{
			sql = "select recipeDB_num,recipeDB_pic,recipeDB_title, recipeDB_recipe, recipeDB_country, recipeDB_meterial, recipeDB_good from recipeDB where recipeDB_title like '%"
	               + subject + "%' order by recipeDB_num desc";
			
			System.out.println("easfasg");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				list = new ArrayList();
				do{
					RecipeDBBean bean = new RecipeDBBean();
					bean = new RecipeDBBean();

		               bean.setRecipedb_num(new Integer(rs.getInt("recipeDB_num")));
		               bean.setRecipedb_pic(rs.getString("recipeDB_pic"));
		               bean.setRecipedb_title(rs.getString("recipeDB_title"));
		               bean.setRecipedb_recipe(rs.getString("recipeDB_recipe"));
		               bean.setRecipedb_country(rs.getString("recipeDB_country"));
		               bean.setRecipedb_meterial(rs.getString("recipeDB_meterial"));
		               bean.setRecipedb_good(rs.getInt("recipeDB_good"));
		   			
		               list.add(bean);

				} while(rs.next());
			}//end if
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
			}
		return list;
	}
	
}
