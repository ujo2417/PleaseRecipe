package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardBean;
import project.cook.boardBean.BoardDAO;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		BoardBean  bean = new BoardBean(); //
		bean.setFree_num(Integer.parseInt(request.getParameter("num")));
		bean.setFree_subject(request.getParameter("subject"));
		bean.setFree_content(request.getParameter("content"));
		String pageNum = request.getParameter("pageNum");
		BoardDAO  dao = BoardDAO.getInstance();
		dao.update(bean);  // ���� ���泻�� �ݿ� �Լ� ȣ��
		
		//����
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		
		return "/board/updatePro.jsp";
	}

}
