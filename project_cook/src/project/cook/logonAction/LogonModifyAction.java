package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class LogonModifyAction implements CommandAction {//회원정보 수정 페이지 처리

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		LogonDAO dao = LogonDAO.getInstance();
		LogonBean member= new LogonBean(); 
		member = dao.getMember(id);
		
		String pwle = "";
		char firstPw = member.getMem_passwd().charAt(0);
		int pwLength = member.getMem_passwd().length() - 1;
		for (int i = 0; i < pwLength; i++) {
			pwle += "*";
		}	
		request.setAttribute("firstPw", firstPw);
		request.setAttribute("pwle", pwle);
		
		request.setAttribute("member", member);
		
		
		return "/logon/modify.jsp";
	}
}
