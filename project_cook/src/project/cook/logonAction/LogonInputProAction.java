package project.cook.logonAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class LogonInputProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");//�ѱ� ���ڵ�
        
        LogonBean member = new LogonBean();//������ó�� ��
		member.setMem_id(request.getParameter("id"));
        member.setMem_passwd(request.getParameter("passwd"));
        member.setMem_name(request.getParameter("name"));
		member.setMem_email(request.getParameter("email"));
		member.setMem_phone(request.getParameter("phone"));
        member.setReg_date(new Timestamp(System.currentTimeMillis()));

        LogonDAO dao = LogonDAO.getInstance();//DBó��
        dao.insertMembers(member);

        return "/logon/inputPro.jsp";//�ش� ��
	}

}
