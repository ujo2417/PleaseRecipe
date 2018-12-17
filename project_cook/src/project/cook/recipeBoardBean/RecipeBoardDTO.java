package project.cook.recipeBoardBean;

import java.sql.Timestamp;

public class RecipeBoardDTO {
	// 변수선언
	// content 부분에 요리 이름/사진(파일)/재료/요리법이 포함되어야한다
	// recipe_title, recipe_pic, recipe_material, recipe_recipe
	private String recipe_name, recipe_subject, mem_id;
	private String recipe_title, recipe_pic, recipe_material, recipe_recipe; // content 부분에 들어갈 내용
	private int recipe_num, recipe_readcount, recipe_good;
	private Timestamp recipe_date;
	
	
	public int getRecipe_good() {
		return recipe_good;
	}
	public void setRecipe_good(int recipe_good) {
		this.recipe_good = recipe_good;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_subject() {
		return recipe_subject;
	}
	public void setRecipe_subject(String recipe_subject) {
		this.recipe_subject = recipe_subject;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_pic() {
		return recipe_pic;
	}
	public void setRecipe_pic(String recipe_pic) {
		this.recipe_pic = recipe_pic;
	}
	public String getRecipe_material() {
		return recipe_material;
	}
	public void setRecipe_material(String recipe_material) {
		this.recipe_material = recipe_material;
	}
	public String getRecipe_recipe() {
		return recipe_recipe;
	}
	public void setRecipe_recipe(String recipe_recipe) {
		this.recipe_recipe = recipe_recipe;
	}
	public int getRecipe_num() {
		return recipe_num;
	}
	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}
	public int getRecipe_readcount() {
		return recipe_readcount;
	}
	public void setRecipe_readcount(int recipe_readcount) {
		this.recipe_readcount = recipe_readcount;
	}
	public Timestamp getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(Timestamp recipe_date) {
		this.recipe_date = recipe_date;
	}
	
	
}
