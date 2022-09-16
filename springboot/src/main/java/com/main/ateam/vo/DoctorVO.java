package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("doctorVO")
public class DoctorVO {
	private int dnum;
	private int hnum;
	private String dname;
	private String did;
	private String dpwd;
	private String dmajor;
	private List<HospitalVO> hospitalVO;
	
	public List<HospitalVO> getHospitalVO() {
		return hospitalVO;
	}
	public void setHospitalVO(List<HospitalVO> hospitalVO) {
		this.hospitalVO = hospitalVO;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDpwd() {
		return dpwd;
	}
	public void setDpwd(String dpwd) {
		this.dpwd = dpwd;
	}
	public String getDmajor() {
		return dmajor;
	}
	public void setDmajor(String dmajor) {
		this.dmajor = dmajor;
	}

	
	
}
