package project.cook.recipeBoardAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;


public class RecipeBoardSearchAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String subject = request.getParameter("subject");
		
		List list = new ArrayList();
		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		list = dao.recipeBoardSearch(subject);
		
		request.setAttribute("list", list);
		
		return "/recipeBoard/recipeBoardSearchForm.jsp";
	}

}
