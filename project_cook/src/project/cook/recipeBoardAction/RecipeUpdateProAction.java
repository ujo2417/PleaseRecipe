package project.cook.recipeBoardAction;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.cook.boardAction.CommandAction;
import project.cook.recipeBoardBean.RecipeBoardDAO;
import project.cook.recipeBoardBean.RecipeBoardDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeUpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		String realPath;
		int sizeLimit = 10 * 1024 * 1024; // 사진용량 이다 일단 10메가로 정해서 여유롭게
		String savePath = request.getRealPath("/recipeUpload");

		multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",
				new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);

		RecipeBoardDTO dto = new RecipeBoardDTO(); //
		dto.setRecipe_num(Integer.parseInt(multi.getParameter("recipe_num")));
		dto.setRecipe_subject(multi.getParameter("recipe_subject"));
		dto.setRecipe_title(multi.getParameter("recipe_title"));
		if(filename == null) {
			dto.setRecipe_pic(multi.getParameter("recipe_pic"));
		} else{
			dto.setRecipe_pic(filename);
		}		
		dto.setRecipe_material(multi.getParameter("recipe_material"));
		dto.setRecipe_recipe(multi.getParameter("recipe_recipe"));

		String pageNum = request.getParameter("pageNum");
		RecipeBoardDAO dao = RecipeBoardDAO.getInstance();
		dao.update(dto); // 실제 변경내용 반영 함수 호출

		// 저장
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		return "/recipeBoard/recipeUpdatePro.jsp";
	}

}
