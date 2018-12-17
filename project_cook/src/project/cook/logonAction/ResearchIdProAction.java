package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;


public class ResearchIdProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		
		LogonDAO dao = LogonDAO.getInstance();
		LogonBean bean =new LogonBean();
		/*int check = dao.searchID(mem_name, mem_phone);*/
		bean = dao.certifiedID(mem_name,mem_phone);
		/*request.setAttribute("check", new Integer(check));*/
		request.setAttribute("bean", bean);
		
		return "/logon/researchIdPro.jsp";
	}

}
