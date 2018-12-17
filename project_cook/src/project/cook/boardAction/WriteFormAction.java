package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		int num = 0;
		try {
			
			if(request.getParameter("num") !=null){//�亯��
				num = Integer.parseInt(request.getParameter("num"));
				
			}//if end
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//�ش� �信�� ����� �Ӽ�(����)
		request.setAttribute("num", new Integer(num));
		
		return "/board/writeForm.jsp";
	}

}


