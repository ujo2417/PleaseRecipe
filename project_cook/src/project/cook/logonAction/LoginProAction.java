package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;

public class LoginProAction implements CommandAction {//회원인증 처리

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		  request.setCharacterEncoding("euc-kr");//한글 인코딩
	        
	        String id = request.getParameter("id");
		    String passwd  = request.getParameter("passwd");

		    LogonDAO dao = LogonDAO.getInstance();//DB처리
	        int check=dao.userCheck(id,passwd);

	        //해당 뷰에서 사용할 속성
			request.setAttribute("check", new Integer(check));
			request.setAttribute("id", id);
			
		return "/logon/loginPro.jsp";
	}
}
