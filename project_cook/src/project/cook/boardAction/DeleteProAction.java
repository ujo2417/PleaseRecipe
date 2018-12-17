package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardDAO;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		BoardDAO  dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		dao.delete(num); 
	
		//¿˙¿Â
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/board/deletePro.jsp";
	}

}
