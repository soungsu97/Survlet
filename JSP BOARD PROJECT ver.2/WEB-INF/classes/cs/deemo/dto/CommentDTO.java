package cs.deemo.dto;

import java.sql.Date;

public class CommentDTO {
	private String cnum;
	private String cboard;
	private String cid;
	private Date cdate;
	private String ccontent;
	
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getCboard() {
		return cboard;
	}
	public void setCboard(String cboard) {
		this.cboard = cboard;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	
}
