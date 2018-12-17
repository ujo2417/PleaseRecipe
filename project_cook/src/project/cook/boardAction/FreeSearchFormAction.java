package project.cook.boardAction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardDAO;


public class FreeSearchFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String subject = request.getParameter("subject");
		//System.out.println(subject);
		
		List list = new ArrayList();
		BoardDAO dao = BoardDAO.getInstance();
		list = dao.freeSearch(subject);
		
		request.setAttribute("list", list);
		
		
		return "/board/freeSearchForm.jsp";
	}

}
