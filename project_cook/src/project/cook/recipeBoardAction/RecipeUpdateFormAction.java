package project.cook.recipeBoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeBoardDTO;

public class RecipeUpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		RecipeBoardDTO dto = dao.update(num); //상세 보기 함수 호출

		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("dto", dto);
		
		return "/recipeBoard/recipeUpdateForm.jsp";
	}
}
