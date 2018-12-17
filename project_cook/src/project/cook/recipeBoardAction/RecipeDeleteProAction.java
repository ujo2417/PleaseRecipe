package project.cook.recipeBoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;

public class RecipeDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		dao.delete(num); 
	
		//¿˙¿Â
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/recipeBoard/recipeDeletePro.jsp";
	}

}
