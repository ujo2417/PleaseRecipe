package project.cook.recipeBoardAction;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeBoardDTO;

public class RecipeGoodAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String pageNum, id, recipe_num, recipe_good;
		int check;
		request.setCharacterEncoding("euc-kr");
		pageNum=request.getParameter("pageNum");
		id=request.getParameter("id");
		recipe_good=request.getParameter("good");
		recipe_num=request.getParameter("recipe_num");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int count;
		
		List list = null;
		
		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		check=dao.recipeGood(Integer.parseInt(recipe_num), Integer.parseInt(recipe_good), id);
		RecipeBoardDTO bean = dao.getDataDetail(Integer.parseInt(recipe_num)); //상세 보기 함수 호출
		
        count = dao.getReplyAllCount(Integer.parseInt(recipe_num));
        if(count > 0){
			list = dao.getReplyAll(Integer.parseInt(recipe_num));// 레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST; 
		}
        
        request.setAttribute("dto", bean);		
		request.setAttribute("num", new Integer(recipe_num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", check);
        request.setAttribute("num", recipe_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		return "/recipeBoard/recipeContent.jsp";
	}

}
