package project.cook.logonAction;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.boardBean.BoardDAO;

public class MainAction implements CommandAction {

   @Override
   public String process(HttpServletRequest request,
         HttpServletResponse response) throws Throwable {
   
      List list = new ArrayList();
      BoardDAO dao = BoardDAO.getInstance();
      
         list = dao.getJoayo();// 레코드 목록 보기
      
      
      
      //해당 뷰에서 사용할 속성(저장)
      request.setAttribute("list", list);   
      
      System.out.println("124124d");
      
      return "/logon/main.jsp";
   }

}