package com.main.ateam.company.dao;

import java.util.Map;

public interface CompanyDao {

	public int crnCheck(Map<String, String> map);
	public void compInsert();
}
