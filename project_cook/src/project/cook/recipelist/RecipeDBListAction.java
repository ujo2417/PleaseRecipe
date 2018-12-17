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
		
		String pageNum = request.getParameter("pageNum");  //��������ȣ
		if(pageNum ==null) pageNum ="1";
		int pageSize = 6; //ȭ�鿡 ��� ���ڵ� ��
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) -5;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		List list = new ArrayList();
		
		RecipeDBDAO dao = new RecipeDBDAO();
		dao.getConnection();
		
		
		count = dao.getListAllCount();//��ü ������ ����..
		//���� �������� �ش��ϴ� �۸��...
		if(count > 0){
			list=dao.recipeDBList(startRow, endRow);// ���ڵ� ��� ����
		} else {
				list = Collections.EMPTY_LIST; 
		}
		
		
		//	�۸�Ͽ� ǥ�� �� �۹�ȣ
		number = count - (currentPage -1) * pageSize;

		//�ش� �信�� ����� �Ӽ�(����)
		
		
		
		
		
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
