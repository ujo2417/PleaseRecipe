package prject.cook.adminDBAction;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.adminDBbean.RecipeDBDTO;
import project.cook.boardAction.CommandAction;


public class RecipeDBContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");	
		
		int count;
		List list = null;
		
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		RecipeDBDTO dto = dao.getDataDetail(num); //�� ���� �Լ� ȣ��

		//�ش� �信�� ����� �Ӽ�����
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("dto", dto);	
		request.setAttribute("list", list);
	
		return "/recipeDB/recipeDBContent.jsp";
	}

}
