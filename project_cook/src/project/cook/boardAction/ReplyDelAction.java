package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardBean.BoardDAO;
import project.cook.boardBean.ReplyBean;

public class ReplyDelAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		String re_num = request.getParameter("re_num");
		String free_num = request.getParameter("free_num");
		String id = request.getParameter("id");
		String mem_id = request.getParameter("mem_id");
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		int check=-1;
		ReplyBean bean = new ReplyBean();
		bean.setFree_num(Integer.parseInt(free_num));
        bean.setRe_num(Integer.parseInt(re_num));
        bean.setMem_id(mem_id);
        
            
       	BoardDAO  dao = BoardDAO.getInstance();
		if(mem_id.equals(id)){
			dao.re_delete(Integer.parseInt(re_num));
			check=1;
			System.out.println("1");
		}else{
			check=-1;
			System.out.println("-1");
		}
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/board/replyDel.jsp";
	}

}
