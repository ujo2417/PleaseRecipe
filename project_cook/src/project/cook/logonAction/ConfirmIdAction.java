package project.cook.logonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.logonBean.LogonDAO;
//

public class ConfirmIdAction implements CommandAction {// �Էµ� �� ó��
	@Override
    public String process(HttpServletRequest request,
        HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("euc-kr");//�ѱ� ���ڵ�
        
        String id = request.getParameter("id");//������Է� ���̵�
		
        LogonDAO dao = LogonDAO.getInstance();//DBó��
        int check=  dao.confirmID(id);

        //�ش� �信�� ����� �Ӽ�
		request.setAttribute("id", id);
		request.setAttribute("check", new Integer(check));

  /*      return "/logon/confirmId.jsp";//�ش� ��
*/   
		return "/logon/inputForm.jsp";
	}
	
}
