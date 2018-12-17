package project.cook.recipelist;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeDB.RecipeDBDAO;



public class materialSearchAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		int count=0;
		List list = new ArrayList();
		List list1 = new ArrayList();
		
		// ����
		String country = request.getParameter("country");
		
		// ��� ��ġ
		String material1 = request.getParameter("material1");
		String material2 = request.getParameter("material2");
		String material3 = request.getParameter("material3");
		
		// ����ġ
		String subject = request.getParameter("subject");
		
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		 
		// ��Ἥġ
		if(material1!="") count++;
		if(material2!="") count++;
		if(material3!="") count++;
		
		if(count==1){
			list=dao.materialSearch(material1, country);
		}else if(count==2 ){
			list=dao.materialSearch(material1, material2, country);
		}else if(count==3){
			list=dao.materialSearch(material1, material2, material3, country);
		}
		
		// ����ġ
		if(subject !=""){
			list1=dao.subjectSearch(subject, country);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		
		return "/recipelist/meterialSearchForm.jsp";
	}

}
