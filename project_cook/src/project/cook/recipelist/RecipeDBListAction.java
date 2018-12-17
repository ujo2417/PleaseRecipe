package project.cook.recipelist;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeDB.RecipeDBDAO;


public class RecipeDBListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		
		String pageNum = request.getParameter("pageNum");  //페이지번호
		if(pageNum ==null) pageNum ="1";
		int pageSize = 6; //화면에 출력 레코드 수
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) -5;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		List list = new ArrayList();
		
		RecipeDBDAO dao = new RecipeDBDAO();
		dao.getConnection();
		
		
		count = dao.getListAllCount();//전체 페이지 리턴..
		//현재 페이지에 해당하는 글목록...
		if(count > 0){
			list=dao.recipeDBList(startRow, endRow);// 레코드 목록 보기
		} else {
				list = Collections.EMPTY_LIST; 
		}
		
		
		//	글목록에 표시 할 글번호
		number = count - (currentPage -1) * pageSize;

		//해당 뷰에서 사용할 속성(저장)
		
		
		
		
		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);	
	
	
		return "/recipelist/recipeDBList.jsp";
	}

}
