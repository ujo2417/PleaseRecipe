package project.cook.adminMainAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;

public class AdminMemberDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		int check = 0;
		LogonDAO dao = LogonDAO.getInstance();
		
		String id = request.getParameter("mem_id");
	    
		String passwd = request.getParameter("mem_passwd");
	 
		check = dao.deleteMember(id, passwd);
		 
		request.setAttribute("check", new Integer(check));
		
		return "/admin/adminMemberDelete.jsp";
	}

}
