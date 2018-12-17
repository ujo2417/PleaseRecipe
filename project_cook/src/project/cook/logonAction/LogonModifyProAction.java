package project.cook.logonAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class LogonModifyProAction implements CommandAction {//회원정보수정 처리

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");

        String id = request.getParameter("id");

		LogonBean member = new LogonBean();
		member.setMem_id(request.getParameter("id"));
        member.setMem_passwd(request.getParameter("passwd"));
        member.setMem_name(request.getParameter("name"));
		member.setMem_email(request.getParameter("email"));
		member.setMem_phone(request.getParameter("phone"));
	    
        LogonDAO dao = LogonDAO.getInstance();
        dao.updateMember(member);
        
        return "/logon/modifyPro.jsp";//해당 뷰
	}
}
