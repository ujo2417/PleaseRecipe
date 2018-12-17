package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class LogonModifyFormAction implements CommandAction {//ȸ������ ���� �� ó��

  	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		 String id = request.getParameter("id");

	        LogonDAO dao = LogonDAO.getInstance();
	        LogonBean member =  dao.getMember(id);
	        
	     // System.out.println(" member.getName() : " + member.getName());    

			//�ش� �信�� ����� �Ӽ�
	        request.setAttribute("member", member);

	        return "/logon/modifyForm.jsp";//�ش��
	}
}
