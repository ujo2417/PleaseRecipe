package project.cook.recipeBoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class RecipeDeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum",  new Integer(pageNum));
		
		return "/recipeBoard/recipeDeleteForm.jsp";
	}

}
