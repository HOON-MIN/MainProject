package com.main.ateam.company.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.company.dao.CompanyDao;
import com.main.ateam.vo.CompanyVO;

@Service
public class CompanyService {
	
	@Autowired
	private CompanyDao companyDao;
	
	public int crnCheckService(Map<String, String> map) {
		return companyDao.crnCheck(map);
	}	
	public void caInsert(CompanyVO cvo) {
		companyDao.compInsert(cvo);
	}
	
	public CompanyVO companyLogin(Map<String, String>map) {
		return companyDao.companyLogin(map);
		
	}
	public int idchk(Map<String, String> vo) {
		return companyDao.idchk(vo);
	}
	
}
