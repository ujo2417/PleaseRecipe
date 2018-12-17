package project.cook.logonAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.boardBean.BoardBean;
import project.cook.boardBean.BoardDAO;

public class MyBoardAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		List list=null;
		String id =request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		list = dao.myBoard(id);
		
		request.setAttribute("list", list);
		return "/logon/myBoardList.jsp";
	}

}
