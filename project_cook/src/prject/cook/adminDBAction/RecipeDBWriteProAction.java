package prject.cook.adminDBAction;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.adminDBbean.RecipeDBDTO;
import project.cook.boardAction.CommandAction;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeDBWriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		String realPath;
		int sizeLimit = 10 * 1024*1024; // �����뷮 �̴� �ϴ� 10�ް��� ���ؼ� �����Ӱ�
		String savePath = request.getRealPath("/recipepic"); // ������ ���ε�� ���� tomcat ������ webcontent ������ġ
		//���� jsp �������� �� ���ø����̼ǻ��� ���� ��θ� ����
		
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			
			RecipeDBDTO dto = new RecipeDBDTO();
			
			dto.setRecipeDB_num(Integer.parseInt( multi.getParameter("recipeDB_num") ));             
	        dto.setRecipeDB_title(multi.getParameter("recipeDB_title"));
	        dto.setRecipeDB_meterial(multi.getParameter("recipeDB_meterial"));
	        dto.setRecipeDB_pic(filename);	        
	        dto.setRecipeDB_recipe(multi.getParameter("recipeDB_recipe"));
	        dto.setRecipeDB_country(multi.getParameter("recipeDB_country"));
        
	        RecipeDBDAO dao = RecipeDBDAO.getInstance();
	        dao.insert(dto);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "/recipeDB/recipeDBWritePro.jsp";
	}

}




