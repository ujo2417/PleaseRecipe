package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class ResearchPwdProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		
		LogonDAO dao = LogonDAO.getInstance();
		LogonBean bean =new LogonBean();
		bean = dao.certifiedPwd(mem_id, mem_name,mem_phone);
		
		request.setAttribute("bean", bean);
		
		return "/logon/researchPwdPro.jsp";
	}

}
