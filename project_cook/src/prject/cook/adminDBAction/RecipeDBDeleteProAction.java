package prject.cook.adminDBAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.boardAction.CommandAction;

public class RecipeDBDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		dao.delete(num); 
	
		//¿˙¿Â
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/recipeDB/recipeDBDeletePro.jsp";
	}

}
