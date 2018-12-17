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
			
			if(request.getParameter("num") !=null){//�亯��
				num = Integer.parseInt(request.getParameter("num"));
				
			}//if end
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//�ش� �信�� ����� �Ӽ�(����)
		request.setAttribute("num", new Integer(num));
		
		return "/recipeDB/recipeDBWriteForm.jsp";
	}

}


