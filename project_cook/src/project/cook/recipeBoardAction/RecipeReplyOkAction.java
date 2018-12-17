package project.cook.recipeBoardAction;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeReplyBean;

public class RecipeReplyOkAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// 1. ����ڰ� �Է��� ������ �ޱ� �� ������.
		request.setCharacterEncoding("euc-kr");
		
		//int num = Integer.parseInt(request.getParameter("num"));
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		int count;
		
		List list = null;
		RecipeReplyBean bean = new RecipeReplyBean();
		bean.setRecipe_num(Integer.parseInt( request.getParameter("num") ));
        bean.setRe_content(request.getParameter("content"));
        bean.setRe_writedate(new Timestamp(System.currentTimeMillis()));
        bean.setMem_id(request.getParameter("id"));
        RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
        dao.re_insert(bean);
        count = dao.getReplyAllCount(Integer.parseInt(num));
        if(count > 0){
			list = dao.getReplyAll(Integer.parseInt(num));// ���ڵ� ��� ����
		} else {
			list = Collections.EMPTY_LIST; 
		}
        
        request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		return "/recipeBoard/recipeReplyOk.jsp";
	}

}
