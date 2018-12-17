package project.cook.logonBean;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.ws.Response;

public class LogonDAO {
	
	private static LogonDAO instance = new LogonDAO();
	
	public static LogonDAO getInstance() {
		return instance;
	}
	public LogonDAO() {}
	
	public Connection getConnection() throws Exception {
		//JNDI & Pool ���·� ���� ��ü �����ؼ� �����Ұ�....
		 InitialContext initCtx = new InitialContext(); 
		 Context envContext = (Context) initCtx.lookup("java:comp/env");
		 DataSource ds = (DataSource) envContext.lookup("jdbc/CookDB");
				
		return ds.getConnection();
	} // getConnection() end
	
	//insertMembers(member)
	public void insertMembers(LogonBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into Member( mem_id, mem_passwd, mem_name, mem_email ,	mem_phone, mem_date) values(?, ?,  ?, ?, ?, ?)";
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, member.getMem_id());
		pstmt.setString(2, member.getMem_passwd());
		pstmt.setString(3, member.getMem_name());
		pstmt.setString(4, member.getMem_email());
		pstmt.setString(5, member.getMem_phone());
		pstmt.setTimestamp(6, member.getReg_date());
		
		int result = pstmt.executeUpdate();
		System.out.println("result = " + result);
		
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
	} //insertMembers(LogonBean member) end
	
	//userCheck(id, pwd) - �α��ν� ����� �޼ҵ� id/password üũ��
	public int userCheck(String id, String pwd) throws Exception {
		String sql = "select mem_passwd from Member where mem_id =?";
		String dbpwd = "";
		
		int result = -1; 
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if( rs.next() ){ //���̵� üũ
			dbpwd = rs.getString("mem_passwd");
			if(id.equals("admin") && dbpwd.equals(pwd)){
				result =2;
			}else if(dbpwd.equals(pwd)){
				result = 1;  //���� ����...
			}else result = 0; //��й�ȣ Ʋ��...
		
		}
			
			
			
		/*	if ( dbpwd.equals(pwd) )  result = 1;  //���� ����...
			else result = 0; //��й�ȣ Ʋ��...
		}else {
			result = -1; //�ش� ���̵� ����.
		}*/
		
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
		
		return result;
	} //userCheck(id, pwd) end
	
	//getMember(id) - ������Ʈ�� �Էµ� �����͸� ������ �� ����� �Լ� 
	public LogonBean getMember(String id) throws Exception {
		String sql = "select * from Member where  mem_id = ?";
		LogonBean member = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if( rs.next() ){
			member =new LogonBean();
			member.setMem_id(rs.getString("mem_id"));
			member.setMem_passwd(rs.getString("mem_passwd"));
			member.setMem_name(rs.getString("mem_name"));
			member.setMem_email(rs.getString("mem_email"));
			member.setMem_phone(rs.getString("mem_phone"));
		} // if end
		
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
		
		return member;
	} //getMember(id) end
	
	//updateMember(member) - ȸ�� ���� ����
	public void updateMember(LogonBean member) throws Exception {
		String sql = "update Member set mem_passwd=?, mem_name=?, mem_email=?, mem_phone=? where mem_id = ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, member.getMem_passwd());
		pstmt.setString(2, member.getMem_name());
		pstmt.setString(3, member.getMem_email());
		pstmt.setString(4, member.getMem_phone());
		pstmt.setString(5, member.getMem_id());
		pstmt.executeUpdate();
		
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
		
	} //updateMember(member) end
	
	//deleteMember(id, pwd) - ȸ�� Ż�� ��...
	public int deleteMember(String id, String pwd) throws Exception {
		String sql = "select mem_passwd from Member where  mem_id = ?";
		String dbpwd = "";		int result = -1; 
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if ( rs.next() ){
			dbpwd = rs.getString("mem_passwd");  //����.......
			
			if( dbpwd.equals(pwd) ){
				pstmt = conn.prepareStatement("delete from Member where mem_id = ?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				result = 1;  //ȸ�� Ż�� ����
			} else {
				result = 0;  //��� Ʋ��...
			}
		}
		
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
				
		return result;
	} //deleteMember(id, pwd) end
	
	//confirmID(id) - ȸ�����Խ� ID�� üũ �Ҷ� ����� �޼ҵ�
	public int confirmID(String id) throws Exception {
		String sql = "select mem_id from Member where  mem_id = ?";
		String dbpwd = "";		int result = -1; 
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if ( rs.next() )  result = 1; //�ش� ���̵� ����
		else result = -1;  //�ش� ���̵� ����
		
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
				
		return result;
	} //confirmID(id) end
	public LogonBean certifiedID(String mem_name, String mem_phone) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql="";
	    LogonBean bean = null;
	    try {
	    	conn = getConnection();
	    	sql= "select mem_id from member where mem_name =? and mem_phone =?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, mem_name);
	    	pstmt.setString(2, mem_phone);
	    	rs = pstmt.executeQuery();
			
	    	
	    	if( rs.next() ){
				bean =new LogonBean();
				bean.setMem_id(rs.getString("mem_id"));
				
			}else{ return null;}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
		}
	    
	    return bean;
	}
	
	public LogonBean certifiedPwd(String mem_id,String mem_name,String mem_phone){
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql="";
	    LogonBean bean = null;
	    try {
	    	conn = getConnection();
	    	sql= "select mem_passwd from member where mem_id=? and mem_name =? and mem_phone =?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, mem_id);
	    	pstmt.setString(2, mem_name);
	    	pstmt.setString(3, mem_phone);
	    	rs = pstmt.executeQuery();
			
	    	
	    	if( rs.next() ){
				bean =new LogonBean();
				bean.setMem_passwd(rs.getString("mem_passwd"));
				
			}else{ return null;}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( conn != null ) try{ conn.close(); } catch(SQLException e) { e.printStackTrace();  }
		}
	    
	    return bean;
		
	}
	
	// ȸ�� ��� ����
	public ArrayList<LogonBean> selectAll() throws Exception {
		String sql = "select mem_id, mem_name, mem_passwd, mem_email, mem_date, mem_phone from Member order by mem_name desc";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		LogonBean bean = null;
		ArrayList<LogonBean> list = new ArrayList<LogonBean>();
		
		while(rs.next()){
			bean = new LogonBean();
			bean.setMem_id(rs.getString("mem_id"));
			bean.setMem_name(rs.getString("mem_name"));
			bean.setMem_passwd(rs.getString("mem_passwd"));
			bean.setMem_email(rs.getString("mem_email"));
			bean.setMem_phone(rs.getString("mem_phone"));
			bean.setReg_date(rs.getTimestamp("mem_date"));
			list.add(bean);
		}
		
		
		if ( rs != null ) try{ rs.close(); } catch(SQLException e) { e.printStackTrace();  }
		if ( pstmt != null ) try{ pstmt.close(); } catch(SQLException e) { e.printStackTrace();  }
		
		return list;
	}
}













