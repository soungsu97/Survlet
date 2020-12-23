package cs.deemo.dto;

import java.sql.Date;

public class BoardDTO {

	private String num;
	private String no;
	private String title;
	private String writer;
	private String context;
	private Date regdate;
	private int views;
	
	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
