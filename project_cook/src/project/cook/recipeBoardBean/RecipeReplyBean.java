package project.cook.recipeBoardBean;


import java.sql.Timestamp;

public class RecipeReplyBean {
	private int re_num;
	private String re_content;
	private Timestamp re_writedate;
	private int recipe_num; //부모 테이블의 idx참조..
	private String mem_id;

	public RecipeReplyBean(){
		
	}
	public RecipeReplyBean(int re_num, String re_content, Timestamp re_writedate,
			int recipe_num, String mem_id) {
		this.re_num = re_num;
		this.re_content = re_content;
		this.re_writedate = re_writedate;
		this.recipe_num = recipe_num;
		this.mem_id = mem_id;
	}

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Timestamp getRe_writedate() {
		return re_writedate;
	}

	public void setRe_writedate(Timestamp re_writedate) {
		this.re_writedate = re_writedate;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}
	
	public int getRecipe_num() {
		return recipe_num;
	}

} //////////////////////////////////////////////////
