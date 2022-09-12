package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

@Alias("avo")
public class AnsboardVO {

	private int anum, qnum, dnum;
	private String acont, adate;
	
	
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getAcont() {
		return acont;
	}
	public void setAcont(String acont) {
		this.acont = acont;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	
	
	
}
