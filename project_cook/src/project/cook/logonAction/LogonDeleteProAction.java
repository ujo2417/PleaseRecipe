package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;

public class LogonDeleteProAction implements CommandAction {//ȸ��Ż�� ó��

    @Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
    	request.setCharacterEncoding("euc-kr");
	
	     String id = request.getParameter("id");
	     String passwd = request.getParameter("passwd");
		    
	     LogonDAO dao = LogonDAO.getInstance();
	     int check = dao.deleteMember(id, passwd);
	
	     //�ش� �信�� ����� �Ӽ�
	     request.setAttribute("check", new Integer(check));
	
	     return "/logon/deletePro.jsp";//�ش��
	}
}
