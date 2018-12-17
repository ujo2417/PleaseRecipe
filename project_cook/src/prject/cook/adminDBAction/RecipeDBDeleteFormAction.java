package prject.cook.adminDBAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class RecipeDBDeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum ="1";
		}
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum",  new Integer(pageNum));
		
		return "/recipeDB/recipeDBDeleteForm.jsp";
	}

}
