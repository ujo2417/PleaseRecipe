package prject.cook.adminDBAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;


public class RecipeDBSearchProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String subject = request.getParameter("subject");
		
		int count = 0, number = 0;
		List list = new ArrayList();
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		count = dao.getListAllCount();
		list = dao.recipeBoardSearch(subject);
		
		
		request.setAttribute("list", list);
		
		return "/recipeDB/recipeDBSearchForm.jsp";
	}

}
