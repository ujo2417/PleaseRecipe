package project.cook.adminMainAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;

public class AdminMemberAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		LogonDAO dao =LogonDAO.getInstance();
		List list= null;
		
		list = dao.selectAll();
		
		request.setAttribute("list", list);
		return "/admin/adminMemberList.jsp";
	}

}
