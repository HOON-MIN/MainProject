package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("pvo")
public class PharmacyVO {
	private int pnum, cnum;
	private String pname, ploc, ptel;
	private double plot, plat;

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPnum() {
		return pnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPname() {
		return pname;
	}
	public void setPloc(String ploc) {
		this.ploc = ploc;
	}
	public String getPloc() {
		return ploc;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	public String getPtel() {
		return ptel;
	}
	public void setPlot(double plot) {
		this.plot = plot;
	}
	public double getPlot() {
		return plot;
	}
	public void setPlat(double plat) {
		this.plat = plat;
	}
	public double getPlat() {
		return plat;
	}	
}
