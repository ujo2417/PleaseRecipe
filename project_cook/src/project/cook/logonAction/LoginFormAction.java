package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class LoginFormAction implements CommandAction {//회원인증 폼 처리

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/logon/main.jsp";
	}
}
