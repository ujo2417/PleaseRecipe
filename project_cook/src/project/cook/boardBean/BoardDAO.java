package project.cook.boardBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import project.cook.recipeDB.RecipeDBBean;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public BoardDAO() {
	}

	public Connection getConnection() throws Exception {
		// JNDI & Pool 형태로 연결 객체 생성해서 리턴할것....
		InitialContext initCtx = new InitialContext(); 
		Context envContext = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/CookDB");

		return ds.getConnection();
	} // getConnection() end

	// insert(bean) - 새로운 글을 게시판에 테이블에 추가, 글 입력 처리에 사용됨
	public void insert(BoardBean bean) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 답변글인지 일반(새글) 글인지 구분해서 입력 시켜주는 로직
		int num = bean.getFree_num(); // 부모 글번호
		int number = 0;// board 테이블에 들어갈 번호
		String sql = "";

		try {
			conn = getConnection();

			// 현재 board 테이블에 레코드의 유무 판단과 글번호를 결정
			// Statement stmt = conn.createStatement(); 왜 넣은거야

			pstmt = conn.prepareStatement("select max(free_num) from freeboard");
			rs = pstmt.executeQuery(); // select 반환값...
			// 레코드가 존재한다면...

			if (rs.next())
				number = rs.getInt(1) + 1;// 다음 글 번호 (지금 추가할 )는 가장 큰번호 +1
			else
				number = 1;// 첫번째 글...

			// insert 명령 실행
			sql = "insert into freeboard(free_num, free_subject, free_content, free_date, mem_id)  "
					+ " values(autonum.nextVal,?,?,?,?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getFree_subject());
			pstmt.setString(2, bean.getFree_content());
			pstmt.setTimestamp(3, bean.getFree_date());
			pstmt.setString(4, bean.getMem_id());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}

	}// insert(bean) end
	 public BoardBean update(int num)   throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        BoardBean bean=null;
	        try {
	            conn = getConnection();

	            pstmt = conn.prepareStatement("select * from freeboard where free_num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	               bean = new BoardBean();
	                bean.setFree_num(rs.getInt("free_num"));
	                bean.setFree_subject(rs.getString("free_subject"));
	                bean.setMem_id(rs.getString("mem_id"));
	                bean.setFree_date(rs.getTimestamp("free_date"));
	                bean.setFree_readcount(rs.getInt("free_readcount"));
	                bean.setFree_content(rs.getString("free_content"));
	              
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
	
	/*public int delete(int num, String passwd) throws Exception {
		     Connection conn = null;    
		     PreparedStatement pstmt = null;    
		     ResultSet rs= null;      
		     String dbpasswd="";    
		     int x = 0;  
		     try {    
		    	 
		    	 conn = getConnection();
		         pstmt = conn.prepareStatement(   "select passwd from board where num = ?"); 
		         pstmt.setInt(1, num);    
		         rs = pstmt.executeQuery();  
		            if(rs.next()){   
		                 dbpasswd= rs.getString("passwd"); 
		                 if(dbpasswd.equals(passwd)){   
		                         pstmt = conn.prepareStatement( "delete from board where num=?");    
		                         pstmt.setInt(1, num);  
		                         x = pstmt.executeUpdate();   
		                         x= 1; //글삭제 성공     <--
		                 }else 
		                  x= 0; //비밀번호 틀림    } <--
		            }
		      } catch(Exception ex) {      
		           ex.printStackTrace();    
		      } finally {    
		           if (rs != null) try { rs.close(); } catch(SQLException ex) {}   
		           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		           if (conn != null) try { conn.close(); } catch(SQLException ex) {}   
		      }  
		     return x;  
		   }  */
	public void delete(int num) throws Exception {
		 Connection conn = null;    
	     PreparedStatement pstmt1 = null;
	     PreparedStatement pstmt2 = null;
	     PreparedStatement pstmt3 = null;
	     ResultSet rs= null;     
	     
	     try {    
	    	 conn = getConnection();
	    	 pstmt1 = conn.prepareStatement("delete from freeboardreply where free_num=?");
	    	 pstmt1.setInt(1, num);
	    	 /*pstmt3 = conn.prepareStatement("delete from freeboardgood where free_num=?");
             pstmt3.setInt(1, num);*/
             pstmt2 = conn.prepareStatement( "delete from freeboard where free_num=?");    
             pstmt2.setInt(1, num);
             pstmt1.executeUpdate();   
            /* pstmt3.executeUpdate();   */
             pstmt2.executeUpdate();
	      } catch(Exception ex) {      
	           ex.printStackTrace();    
	      } finally {    
	           if (rs != null) try { rs.close(); } catch(SQLException ex) {}   
	           if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
	           if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}   
	      }  
	}
    
	//글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
	public void update(BoardBean bean)   throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql="";   
		
        try {
            conn = getConnection();
            sql="update freeboard set free_subject=?, free_content=? where free_num=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, bean.getFree_subject());
                pstmt.setString(2, bean.getFree_content());
			    pstmt.setInt(3, bean.getFree_num());
                pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    } //update(BoardBean bean) end

	//getListAllCount() <==== list.jsp 에서 사용
/*	board 테이블에 저장된 전체 글의 수를 얻어옴(select )
	페이징을 위해서 전체 DB에 입력된 행의 수가 필요함*/
	
	public int getListAllCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0; //레코드 수 저장 변수
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from freeboard");
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		return count;
		
	}//.getListAllCount() end
	
	
	/*getSelectAll(startRow, endRow) <===list.jsp
		글의 목록(복수개의 글, start부터 end 개수만큼)을 가져옴 (select)
		paging, DB로 부터 여러행을 결과로 받는다.*/
	public List<BoardBean> getSelectAll(int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List list = null; //글 목록을 저장하는 객체
		
		try{
			conn = getConnection();
			String sql = "select free_num, free_subject, free_date, free_content, free_readcount, mem_id, r "
					+ "from(select free_num, free_subject, free_date, free_content, free_readcount, mem_id, rownum r "
					+ "from(select free_num, free_subject, free_date, free_content, free_readcount, mem_id "
					+ "from freeboard order by free_num desc) order by free_num desc)"
					+ "where r>=? and r<=?";
			String sql2 = "select free_num, (select count(*) from freeboardreply where freeboard.free_num=freeboardreply.free_num)"
					+ " as a from freeboard";
			pstmt = conn.prepareStatement(sql);
			pstmt2 = conn.prepareStatement(sql2);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end); //추출할 레코드의 수
			rs = pstmt.executeQuery(); //resultset 반환
			
			if(rs.next()){ //ResultSet이 레코드를 가짐
				list = new ArrayList(end); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
			//Resultset 에 있는 레코드 수만큼 반복수행
				do{
					BoardBean bean = new BoardBean();
					rs2 = pstmt2.executeQuery();
					bean.setFree_num(rs.getInt("free_num"));
					while(rs2.next()) {
						// bean.setFree_subject(rs.getString("free_subject") + " (0)");
						if(rs2.getInt("free_num") == rs.getInt("free_num")){
						bean.setFree_subject(rs.getString("free_subject") + " (" + rs2.getInt("a") + ")");
						}
					}
					bean.setFree_date(rs.getTimestamp("Free_date"));
					bean.setFree_readcount(rs.getInt("free_readcount"));
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

	//getDataDetail(num) <<===select 문, content.jsp 상세페이지에서..
	//num에 해당하는 레코드를 board 테이블에서 검색함.
	public BoardBean getDataDetail(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean bean = null;
		String sql = "";
		try{
			sql = "update freeboard set free_readcount = free_readcount +1 where free_num=? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); //반환값이 없는 경우 -insert, update, delete
			
			pstmt= conn.prepareStatement("select * from freeboard where free_num =?");		
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //반환값이 있음 => select
			
			if(rs.next()){
				bean = new BoardBean();
				bean.setFree_num(rs.getInt("free_num"));
				bean.setFree_subject(rs.getString("free_subject"));
				bean.setFree_date(rs.getTimestamp("free_date"));
				bean.setFree_readcount(rs.getInt("free_readcount"));
				bean.setFree_content(rs.getString("free_content"));
				bean.setMem_id(rs.getString("mem_id"));
			}//end if
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		return bean;
	}

	
	///댓글 삽입================================================================
	public void re_insert(ReplyBean bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = bean.getFree_num(); // 부모 글번호
		int number = 0;// reply 테이블에 들어갈 번호
		String sql = "";

		try {
			conn = getConnection();

			// 현재 board 테이블에 레코드의 유무 판단과 글번호를 결정
			// Statement stmt = conn.createStatement(); 왜 넣은거야

			pstmt = conn.prepareStatement("select max(re_num) from freeboardreply");
			rs = pstmt.executeQuery(); // select 반환값...
			// 레코드가 존재한다면...
			
			if (rs.next())
				number = rs.getInt(1) + 1;// 다음 글 번호 (지금 추가할 )는 가장 큰번호 +1
			else
				number = 1;// 첫번째 글...

			// insert 명령 실행
			sql = "insert into freeboardreply(re_num, re_content, re_writedate, free_num, mem_id)  "
					+ " values(re_autonum.nextVal,?,?,?,?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getRe_content());
			pstmt.setTimestamp(2, bean.getRe_writedate());
			pstmt.setInt(3, bean.getFree_num());
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
			pstmt = conn.prepareStatement("select count(*) from freeboardreply where free_num=?");
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
	
	public List<BoardBean> getReplyAll(int num) throws Exception{
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
			String sql = "select re_num, re_writedate, re_content, free_num, mem_id from freeboardreply where free_num=? order by re_num";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			/*pstmt.setInt(1, start);
			pstmt.setInt(2, end); //추출할 레코드의 수
*/			rs = pstmt.executeQuery(); //resultset 반환
			
			if(rs.next()){ //ResultSet이 레코드를 가짐
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
			//Resultset 에 있는 레코드 수만큼 반복수행
				do{
					ReplyBean bean = new ReplyBean();
					bean.setRe_num(rs.getInt("re_num"));
					bean.setRe_content(rs.getString("re_content"));
					bean.setRe_writedate(rs.getTimestamp("re_writedate"));
					bean.setFree_num(rs.getInt("free_num"));
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
	    	 pstmt = conn.prepareStatement( "delete from freeboardreply where re_num=?");    
            pstmt.setInt(1, re_num);  
            pstmt.executeUpdate();   

	      } catch(Exception ex) {      
	           ex.printStackTrace();    
	      } finally {    
	           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}   
	      }  
	}
	
	public List<BoardBean> freeSearch(String subject){
		Connection conn = null;
		PreparedStatement pstmt = null;
		List list = null;
		BoardBean bean = null;
		
		try {
			conn = getConnection();
			/*String sql = "select * from freeboard where free_subject like '%"+subject+"%'";*/
			/*String sql = "select * from freeboard where free_subject like '%?%'";*/
			String sql = "select * from freeboard where free_subject like '%" +subject+ "%' order by free_num desc";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "'%" +subject+ "%'");			
			ResultSet rs = pstmt.executeQuery();
					
			if(rs.next()){
				list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
				
						
				//Resultset 에 있는 레코드 수만큼 반복수행
					do{
						bean = new BoardBean();
						
						bean.setFree_num(new Integer(rs.getInt("free_num")) );
						
						bean.setFree_subject(rs.getString("free_subject"));
						bean.setFree_content(rs.getString("free_content"));
						bean.setFree_date(rs.getTimestamp("free_date"));
						bean.setMem_id(rs.getString("mem_id"));
						bean.setFree_readcount(rs.getInt("free_readcount"));
						//list 객체에 데이터 저장빈인 BoardBean 객체를 저장
						list.add(bean);
						
						
						
					}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			/*if(rs != null) try{rs.close();}catch(Exception e){}*/
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}
			if(conn != null) try{conn.close();}catch(Exception e){}
			
		}
		return list;
	}
	
	public int getSearchCount(String subject) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0; //레코드 수 저장 변수
		
		try{
			conn = getConnection();
			String sql = "select count(*) from freeboard where free_subject like '%" +subject+ "%'";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
			
		}catch(Exception e){e.printStackTrace();
		}finally {
				if(rs != null) try{rs.close();}catch(Exception e){}
				if(pstmt != null) try{pstmt.close();}catch(Exception e){}
				if(conn != null) try{conn.close();}catch(Exception e){}
				
			}
		return count;
		
	}//.getListAllCount() end
	
	public List<RecipeDBBean> getJoayo(){
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List list = new ArrayList(); //글 목록을 저장하는 객체
	      
	      try{
	         conn = getConnection();
	         String sql = "select recipedb_num, recipedb_title, recipedb_meterial, recipedb_recipe, recipedb_pic, recipedb_readcount,recipedb_good, r "
	               + "from(select recipedb_num, recipedb_title, recipedb_meterial, recipedb_recipe, recipedb_pic, recipedb_readcount,recipedb_good, rownum r "
	               + "from(select recipedb_num, recipedb_title, recipedb_meterial, recipedb_recipe, recipedb_pic, recipedb_readcount,recipedb_good "
	               + "from recipedb order by recipedb_good desc) order by recipedb_good desc)"
	               + "where r>=1 and r<=3";
	         
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery(); //resultset 반환
	        
	         if(rs.next()){ //ResultSet이 레코드를 가짐
	            list = new ArrayList(); //몇개의 객체를 저장할지 크기를 지정해서 객체를 생성
	         //Resultset 에 있는 레코드 수만큼 반복수행
	            do{
	            	RecipeDBBean bean = new RecipeDBBean();
	               bean.setRecipedb_num(rs.getInt("recipedb_num"));
	               bean.setRecipedb_title(rs.getString("recipedb_title"));
	               bean.setRecipedb_meterial(rs.getString("recipedb_meterial"));
	               bean.setRecipedb_recipe(rs.getString("recipedb_recipe"));
	               bean.setRecipedb_pic(rs.getString("recipedb_pic"));
	               bean.setRecipedb_readcount(rs.getInt("recipedb_readcount"));
	               bean.setRecipedb_good(rs.getInt("recipedb_good"));
	               //list 객체에 데이터 저장빈인 BoardBean 객체를 저장
	               list.add(bean);
	               System.out.println("dddddd");

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
	
	public List<BoardBean> myBoard(String id){
		 Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      BoardBean bean = null;
	      List list = null; //글 목록을 저장하는 객체
	      String sql="";
	      try {
	    	  conn = getConnection();
	    	  sql="select * from freeboard where mem_id =?";
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setString(1, id);
	    	  rs = pstmt.executeQuery();
	    	  list = new ArrayList();
	    	  
	    	  if(rs.next()){ //ResultSet이 레코드를 가짐
		            do{
		            	bean = new BoardBean();
		               bean.setFree_num(rs.getInt("free_num"));
		               bean.setFree_subject(rs.getString("free_subject"));
		               bean.setFree_date(rs.getTimestamp("free_date"));
		               bean.setFree_readcount(rs.getInt("free_readcount"));
		               bean.setMem_id(rs.getString("mem_id"));
		               //list 객체에 데이터 저장빈인 BoardBean 객체를 저장
		          
		               System.out.println("dddddd");
		               list.add(bean);
		            }while(rs.next());
		         }//if end
	    	  
	    	  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
         }
		
		return list;
	}
	
	
	
}

