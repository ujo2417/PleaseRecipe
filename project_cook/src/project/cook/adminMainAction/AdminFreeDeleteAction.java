package project.cook.adminMainAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.boardBean.BoardDAO;

public class AdminFreeDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("free_num"));
		dao.delete(num);
		
		return "/admin/adminDeleteForm.jsp";
	}

}
