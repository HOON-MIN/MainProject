package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

@Alias("caVO")
public class Company_agreeVO {
	private int canum;
	private String ca_status;
	private String ca_date;
	public int getCanum() {
		return canum;
	}
	public void setCanum(int canum) {
		this.canum = canum;
	}
	public String getCa_status() {
		return ca_status;
	}
	public void setCa_status(String ca_status) {
		this.ca_status = ca_status;
	}
	public String getCa_date() {
		return ca_date;
	}
	public void setCa_date(String ca_date) {
		this.ca_date = ca_date;
	}
	
	
}
