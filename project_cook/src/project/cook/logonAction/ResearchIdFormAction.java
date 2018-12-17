package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class ResearchIdFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/logon/researchIdForm.jsp";
	}

}
