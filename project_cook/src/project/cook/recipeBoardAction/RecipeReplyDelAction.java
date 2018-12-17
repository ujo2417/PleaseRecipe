package project.cook.recipeBoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeReplyBean;

public class RecipeReplyDelAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String re_num = request.getParameter("re_num");
		String recipe_num = request.getParameter("recipe_num");
		String id = request.getParameter("id");
		String mem_id = request.getParameter("mem_id");
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		int check=-1;
		RecipeReplyBean bean = new RecipeReplyBean();
		bean.setRecipe_num(Integer.parseInt(recipe_num));
        bean.setRe_num(Integer.parseInt(re_num));
        bean.setMem_id(mem_id);
        
            
       	RecipeBoardDAO  dao = RecipeBoardDAO.getInstance();
		if(mem_id.equals(id)){
			dao.re_delete(Integer.parseInt(re_num));
			check=1;
			
		} else if(id==""){
			check=0;
		} else{
			check=-1;
		}
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/recipeBoard/recipeReplyDel.jsp";
	}

}
