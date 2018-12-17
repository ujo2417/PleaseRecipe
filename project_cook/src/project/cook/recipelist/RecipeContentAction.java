package project.cook.recipelist;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeDB.RecipeDBBean;
import project.cook.recipeDB.RecipeDBDAO;


public class RecipeContentAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");



		List list = new ArrayList();

		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		RecipeDBBean bean = dao.getRecipeDetail(num); //�� ���� �Լ� ȣ��

		list.add(bean);
		//�ش� �信�� ����� �Ӽ�����
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));		
		request.setAttribute("list", list);
		return "/recipelist/recipeDetail.jsp";
	}
}
