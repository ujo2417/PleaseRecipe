package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class LogonDeleteFormAction implements CommandAction {//ȸ��Ż�� �� ó��

 		@Override
		public String process(HttpServletRequest request,
				HttpServletResponse response) throws Throwable {
			
			return "/logon/deleteForm.jsp";
		}
}
