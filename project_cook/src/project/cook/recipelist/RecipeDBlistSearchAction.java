package project.cook.recipelist;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeDB.RecipeDBDAO;


public class RecipeDBlistSearchAction implements CommandAction {

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
		
		System.out.println("aehraerh");
		request.setAttribute("list", list);
		System.out.println("aerharhaeh");
		return "/recipelist/recipeDBlistSearchForm.jsp";
	}

}
