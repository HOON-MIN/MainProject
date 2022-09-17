package com.main.ateam.company.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.company.dao.CompanyDao;

@Service
public class CompanyService {
	
	@Autowired
	private CompanyDao companyDao;
	
	public int crnCheckService(Map<String, String> map) {
		return companyDao.crnCheck(map);
	}	
	public void caInsert() {
		companyDao.compInsert();
	}
}
