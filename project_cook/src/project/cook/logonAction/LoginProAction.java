package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;

public class LoginProAction implements CommandAction {//ȸ������ ó��

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		  request.setCharacterEncoding("euc-kr");//�ѱ� ���ڵ�
	        
	        String id = request.getParameter("id");
		    String passwd  = request.getParameter("passwd");

		    LogonDAO dao = LogonDAO.getInstance();//DBó��
	        int check=dao.userCheck(id,passwd);

	        //�ش� �信�� ����� �Ӽ�
			request.setAttribute("check", new Integer(check));
			request.setAttribute("id", id);
			
		return "/logon/loginPro.jsp";
	}
}
