package prject.cook.adminDBAction;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.adminDBbean.RecipeDBDAO;
import project.cook.adminDBbean.RecipeDBDTO;
import project.cook.boardAction.CommandAction;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeDBUpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		String realPath;
		int sizeLimit = 10 * 1024 * 1024; // 사진용량 이다 일단 10메가로 정해서 여유롭게
		String savePath = request.getRealPath("/recipepic");

		multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",
				new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);

		RecipeDBDTO dto = new RecipeDBDTO(); //
		
		System.out.println("recipeDB_num ========================= " + multi.getParameter("recipeDB_num"));
		dto.setRecipeDB_num(Integer.parseInt(multi.getParameter("recipeDB_num")));

		dto.setRecipeDB_title(multi.getParameter("recipeDB_title"));
		if(filename == null) {
			dto.setRecipeDB_pic(multi.getParameter("recipeDB_pic"));
		} else{
			dto.setRecipeDB_pic(filename);
		}		
		dto.setRecipeDB_meterial(multi.getParameter("recipeDB_meterial"));
		dto.setRecipeDB_recipe(multi.getParameter("recipeDB_recipe"));
		dto.setRecipeDB_country(multi.getParameter("recipeDB_country"));
		String pageNum = request.getParameter("pageNum");
		RecipeDBDAO dao = RecipeDBDAO.getInstance();
		dao.update(dto); // 실제 변경내용 반영 함수 호출

		// 저장
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		return "/recipeDB/recipeDBUpdatePro.jsp";
	}

}
