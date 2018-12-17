package project.cook.boardBean;

import java.sql.Timestamp;

public class BoardBean {
	private String free_subject, free_content, mem_id;
	private int free_num, free_readcount;
	private Timestamp free_date;
	
	
	public String getFree_subject() {
		return free_subject;
	}
	public void setFree_subject(String free_subject) {
		this.free_subject = free_subject;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public int getFree_readcount() {
		return free_readcount;
	}
	public void setFree_readcount(int free_readcount) {
		this.free_readcount = free_readcount;
	}
	public Timestamp getFree_date() {
		return free_date;
	}
	public void setFree_date(Timestamp free_date) {
		this.free_date = free_date;
	}
	
	

}
