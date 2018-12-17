package prject.cook.adminDBAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;

public class RecipeDBWriteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		int num = 0;
		try {
			
			if(request.getParameter("num") !=null){//답변글
				num = Integer.parseInt(request.getParameter("num"));
				
			}//if end
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//해당 뷰에서 사용할 속성(저장)
		request.setAttribute("num", new Integer(num));
		
		return "/recipeDB/recipeDBWriteForm.jsp";
	}

}


