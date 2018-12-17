package project.cook.boardAction;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardBean;
import project.cook.boardBean.BoardDAO;

public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		// ����
		int count;
		List list = null;
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean bean = dao.getDataDetail(num); //�� ���� �Լ� ȣ��
		count = dao.getReplyAllCount(num);
        if(count > 0){
			list = dao.getReplyAll(num);// ���ڵ� ��� ����
		} else {
			list = Collections.EMPTY_LIST; 
		}
		
		//�ش� �信�� ����� �Ӽ�����
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("bean", bean);		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "/board/content.jsp";
	}

}
