package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonBean;
import project.cook.logonBean.LogonDAO;

public class LogonModifyFormAction implements CommandAction {//회원정보 수정 폼 처리

  	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		 String id = request.getParameter("id");

	        LogonDAO dao = LogonDAO.getInstance();
	        LogonBean member =  dao.getMember(id);
	        
	     // System.out.println(" member.getName() : " + member.getName());    

			//해당 뷰에서 사용할 속성
	        request.setAttribute("member", member);

	        return "/logon/modifyForm.jsp";//해당뷰
	}
}
