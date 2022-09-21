package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("hvo")
public class HospitalVO {

	private int  cnum,r_num;
	private String hname, hloc, otime, ctime,
		hcate, hurl, hemail, htel;
	private List<DoctorVO> doctorVO;
	
	public List<DoctorVO> getDoctorVO() {
		return doctorVO;
	}
	public void setDoctorVO(List<DoctorVO> doctorVO) {
		this.doctorVO = doctorVO;
	}
	
	
	public String getHtel() {
		return htel;
	}
	public void setHtel(String htel) {
		this.htel = htel;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
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
	
}
