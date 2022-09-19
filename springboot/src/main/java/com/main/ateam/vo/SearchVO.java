package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

@Alias("svo")
public class SearchVO {
	private int beginPerPage;
	private int endPerPage;
	private int mem_no;
	private String category;
	private String search;
	private String cPage;
	private String gender;
	private String searchreset;
	private String qustr;

	public SearchVO() {
		this.cPage = "1";
		this.search = "";
		this.category = "";
		this.searchreset = "";
	}
	
	public String getQustr() {
		return qustr;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getSearchreset() {
		return searchreset;
	}

	public void setSearchreset(String searchreset) {
		this.searchreset = searchreset;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getcPage() {
		return cPage;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	public int getBeginPerPage() {
		return beginPerPage;
	}

	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}

	public int getEndPerPage() {
		return endPerPage;
	}

	public void setEndPerPage(int endPerPage) {
		this.endPerPage = endPerPage;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
}