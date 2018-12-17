package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardBean;
import project.cook.boardBean.BoardDAO;

public class UpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO dao = BoardDAO.getInstance();
		BoardBean bean = dao.update(num); //상세 보기 함수 호출
		
		//저장
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("bean", bean);
		
		return "/board/updateForm.jsp";
	}
}
