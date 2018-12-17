package project.cook.adminMainAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;

public class AdminRecipeDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		System.out.println("ASGQG");
		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("recipe_num"));
		
		dao.delete(num);
		System.out.println("DSHFERH");
		
		return "/admin/adminRecipeDelete.jsp";
	}

}
