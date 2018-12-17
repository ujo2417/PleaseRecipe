package project.cook.boardAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardBean;
import project.cook.boardBean.BoardDAO;

public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		
		BoardBean bean = new BoardBean();
		bean.setFree_num(Integer.parseInt( request.getParameter("num") ));
        bean.setFree_subject(request.getParameter("subject"));
        bean.setFree_content(request.getParameter("content"));
        bean.setMem_id(request.getParameter("id"));
        bean.setFree_date(new Timestamp(System.currentTimeMillis()));
        
        BoardDAO  dao = BoardDAO.getInstance();
        dao.insert(bean);
        
		return "/board/writePro.jsp";
	}

}




