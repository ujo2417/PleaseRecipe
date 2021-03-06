package project.cook.adminMainAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.boardAction.CommandAction;

public class AdminFreeAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		List list = null;
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		list = dao.adminList();
		
		request.setAttribute("list", list);
		return "/admin/adminFreeList.jsp";
	}

}
