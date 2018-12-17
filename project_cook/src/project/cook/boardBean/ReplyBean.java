package project.cook.boardBean;


import java.sql.Timestamp;

public class ReplyBean {
	private int re_num;
	private String re_content;
	private Timestamp re_writedate;
	private int free_num; //부모 테이블의 idx참조..
	private String mem_id;
	public ReplyBean(){
		
	}
	public ReplyBean(int re_num, String re_content, Timestamp re_writedate,
			int free_num, String mem_id) {
		super();
		this.re_num = re_num;
		this.re_content = re_content;
		this.re_writedate = re_writedate;
		this.free_num = free_num;
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
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	
} //////////////////////////////////////////////////
