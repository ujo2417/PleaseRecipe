package prject.cook.adminDBAction;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.boardAction.CommandAction;

public class RecipeDBListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		String pageNum = request.getParameter("pageNum");  //페이지번호
		if(pageNum ==null) pageNum ="1";
		
		int pageSize = 7; //화면에 출력 레코드 수
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) -6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		
		List list = null;
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		count = dao.getListAllCount();//전체 페이지 리턴..
							//현재 페이지에 해당하는 글목록...
		if(count > 0){
			list = dao.getSelectAll(startRow, endRow);// 레코드 목록 보기
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
	
		return "/recipeDB/recipeDBList.jsp";
	}

}
