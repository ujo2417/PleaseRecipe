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
		
		String pageNum = request.getParameter("pageNum");  //��������ȣ
		if(pageNum ==null) pageNum ="1";
		
		int pageSize = 7; //ȭ�鿡 ��� ���ڵ� ��
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) -6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		
		List list = null;
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		count = dao.getListAllCount();//��ü ������ ����..
							//���� �������� �ش��ϴ� �۸��...
		if(count > 0){
			list = dao.getSelectAll(startRow, endRow);// ���ڵ� ��� ����
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
	
		return "/recipeDB/recipeDBList.jsp";
	}

}
