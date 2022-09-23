package com.main.ateam.company.dao;

import java.util.Map;

import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.MemberVO;

public interface CompanyDao {

	public int crnCheck(Map<String, String> map);
	public void compInsert(CompanyVO cvo);
	public CompanyVO companyLogin(Map<String, String>map);
	public int idchk(Map<String, String> vo);
	
	
}
