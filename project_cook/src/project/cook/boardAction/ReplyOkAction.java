package project.cook.boardAction;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardDAO;
import project.cook.boardBean.ReplyBean;

public class ReplyOkAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// 1. 사용자가 입력한 꼬리말 달기 글 얻어오기.
		request.setCharacterEncoding("euc-kr");
		
		//int num = Integer.parseInt(request.getParameter("num"));
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		int count;
		
		List list = null;
		ReplyBean bean = new ReplyBean();
		bean.setFree_num(Integer.parseInt( request.getParameter("num") ));
        bean.setRe_content(request.getParameter("content"));
        bean.setRe_writedate(new Timestamp(System.currentTimeMillis()));
        bean.setMem_id(request.getParameter("id"));
        BoardDAO  dao = BoardDAO.getInstance();
        dao.re_insert(bean);
        count = dao.getReplyAllCount(Integer.parseInt(num));
        if(count > 0){
			list = dao.getReplyAll(Integer.parseInt(num));// 레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST; 
		}
        
        request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		return "/board/replyOk.jsp";
	}

}
