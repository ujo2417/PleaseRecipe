package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;
//

public class ConfirmIdAction implements CommandAction {// 입력된 글 처리
	@Override
    public String process(HttpServletRequest request,
        HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("euc-kr");//한글 인코딩
        
        String id = request.getParameter("id");//사용자입력 아이디
		
        LogonDAO dao = LogonDAO.getInstance();//DB처리
        int check=  dao.confirmID(id);

        //해당 뷰에서 사용할 속성
		request.setAttribute("id", id);
		request.setAttribute("check", new Integer(check));

  /*      return "/logon/confirmId.jsp";//해당 뷰
*/   
		return "/logon/inputForm.jsp";
	}
	
}
