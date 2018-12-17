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

public class RecipeDBGoodAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String pageNum, id, recipedb_num, recipedb_good;
		int check;
		List list = null;
		request.setCharacterEncoding("euc-kr");
		pageNum=request.getParameter("pageNum");
		id=request.getParameter("id");
		recipedb_good=request.getParameter("good");
		recipedb_num=request.getParameter("recipedb_num");
		
		list = new ArrayList();
		
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		check=dao.recipeDBGood(Integer.parseInt(recipedb_num), Integer.parseInt(recipedb_good), id);
		RecipeDBBean bean = dao.getRecipeDetail(Integer.parseInt(recipedb_num)); //상세 보기 함수 호출
		
        list.add(bean);
        
        request.setAttribute("list", list);		
		request.setAttribute("num", new Integer(recipedb_num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", check);
		
		return "/recipelist/recipeDetail.jsp";
	}

}
