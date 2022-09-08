package com.main.ateam.drug.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.drug.dao.DrugDao;
import com.main.ateam.drug.vo.DrugVO;

@Service
public class DrugService {
	
	@Autowired
	private DrugDao dao;
	
	public List<DrugVO> getDrugList(Map<String, Integer> map ){
		return dao.getDrugList(map);
	}
	
	public DrugVO getDrugDetail(int num ) {
		return dao.getDrugDetail(num);
	}
	
	public int drugTotalCount() {
		return dao.getTotalCount();
	}
	
	public void setDrugInsert(DrugVO vo) {
		dao.setDrugInsert(vo);
	}
	
	

}
