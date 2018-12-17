package project.cook.recipeDB;

public class RecipeDBBean {

	private int recipedb_num, recipedb_readcount, recipedb_good;
	private String recipedb_meterial, recipedb_title, recipedb_recipe, recipedb_pic, recipedb_country;
	
	public RecipeDBBean() {
		super();
	}
	public RecipeDBBean(int recipedb_num, int recipedb_readcount,
			int recipedb_good, String recipedb_meterial, String recipedb_title,
			String recipedb_recipe, String recipedb_pic, String recipedb_country) {
		super();
		this.recipedb_num = recipedb_num;
		this.recipedb_readcount = recipedb_readcount;
		this.recipedb_good = recipedb_good;
		this.recipedb_meterial = recipedb_meterial;
		this.recipedb_title = recipedb_title;
		this.recipedb_recipe = recipedb_recipe;
		this.recipedb_pic = recipedb_pic;
		this.recipedb_country = recipedb_country;
	}
	public String getRecipedb_country() {
		return recipedb_country;
	}
	public void setRecipedb_country(String recipedb_country) {
		this.recipedb_country = recipedb_country;
	}
	public int getRecipedb_good() {
		return recipedb_good;
	}
	public void setRecipedb_good(int recipedb_good) {
		this.recipedb_good = recipedb_good;
	}
	public int getRecipedb_readcount() {
		return recipedb_readcount;
	}
	public void setRecipedb_readcount(int recipedb_readcount) {
		this.recipedb_readcount = recipedb_readcount;
	}
	
	public int getRecipedb_num() {
		return recipedb_num;
	}
	public void setRecipedb_num(int recipedb_num) {
		this.recipedb_num = recipedb_num;
	}
	public String getRecipedb_meterial() {
		return recipedb_meterial;
	}
	public void setRecipedb_meterial(String recipedb_meterial) {
		this.recipedb_meterial = recipedb_meterial;
	}
	public String getRecipedb_title() {
		return recipedb_title;
	}
	public void setRecipedb_title(String recipedb_title) {
		this.recipedb_title = recipedb_title;
	}
	public String getRecipedb_recipe() {
		return recipedb_recipe;
	}
	public void setRecipedb_recipe(String recipedb_recipe) {
		this.recipedb_recipe = recipedb_recipe;
	}
	public String getRecipedb_pic() {
		return recipedb_pic;
	}
	public void setRecipedb_pic(String recipedb_pic) {
		this.recipedb_pic = recipedb_pic;
	}
	
	
}
