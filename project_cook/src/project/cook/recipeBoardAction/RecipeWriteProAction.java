package project.cook.recipeBoardAction;

import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeBoardDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeWriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		String realPath;
		int sizeLimit = 10 * 1024*1024; // 사진용량 이다 일단 10메가로 정해서 여유롭게
		String savePath = request.getRealPath("/recipeUpload"); // 파일이 업로드될 실제 tomcat 폴더의 webcontent 기준위치
		//현재 jsp 페이지의 웹 어플리케이션상의 절대 경로를 구함

		
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto.setRecipe_num(Integer.parseInt( multi.getParameter("recipe_num") ));
	        
	        dto.setRecipe_subject(multi.getParameter("recipe_subject"));
	               
	        dto.setRecipe_title(multi.getParameter("recipe_title"));
	        dto.setRecipe_material(multi.getParameter("recipe_material"));
	        dto.setRecipe_pic(filename);
	        
	        dto.setRecipe_recipe(multi.getParameter("recipe_recipe"));
	        
	        dto.setMem_id(multi.getParameter("mem_id"));
	        dto.setRecipe_date(new Timestamp(System.currentTimeMillis()));
	        
	        RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
	        dao.insert(dto);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "/recipeBoard/recipeWritePro.jsp";
	}

}




