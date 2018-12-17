package prject.cook.adminDBAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.adminDBbean.RecipeDBDTO;
import project.cook.boardAction.CommandAction;

public class RecipeDBUpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		RecipeDBDTO dto = dao.update(num); //상세 보기 함수 호출

		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("dto", dto);
		
		return "/recipeDB/recipeDBUpdateForm.jsp";
	}
}
