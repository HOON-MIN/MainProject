package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

@Alias("hvo")
public class HospitalVO {

	private int hnum, cnum;
	private String hname, hloc, otime, ctime,
		hcate, hurl, hemail, hgrade;
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHloc() {
		return hloc;
	}
	public void setHloc(String hloc) {
		this.hloc = hloc;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getHcate() {
		return hcate;
	}
	public void setHcate(String hcate) {
		this.hcate = hcate;
	}
	public String getHurl() {
		return hurl;
	}
	public void setHurl(String hurl) {
		this.hurl = hurl;
	}
	public String getHemail() {
		return hemail;
	}
	public void setHemail(String hemail) {
		this.hemail = hemail;
	}
	public String getHgrade() {
		return hgrade;
	}
	public void setHgrade(String hgrade) {
		this.hgrade = hgrade;
	}
	
	
}
