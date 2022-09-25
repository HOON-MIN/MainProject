package com.main.ateam.drug.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.drug.dao.DrugDao;
import com.main.ateam.vo.DrugVO;

@Service
public class DrugService {

	@Autowired
	private DrugDao dao;

	public List<DrugVO> getDrugList(Map<String, Integer> map) {
		return dao.getDrugList(map);
	}

	public List<DrugVO> getDrugContentSearch(Map<String, String> map) {
		return dao.getDrugContentSearch(map);
	}

	public List<DrugVO> getDrugSearchShape(Map<String, String> map) {
		return dao.getDrugSearchShape(map);
	}
	
	public List<DrugVO> getDrugSearchImage(Map<String, String> map) {
		return dao.getImgDrugSearch(map);
	}
	

	public int getDrugSearchShapeCount(Map<String, String> map) {
		return dao.getDrugSearchShapeCount(map);
	}

	public DrugVO getDrugDetail(int num) {
		return dao.getDrugDetail(num);
	}

	public int drugTotalCount() {
		return dao.getTotalCount();
	}

	public int myDrugCaseTotalCount(int num) {
		return dao.getmyDrugCaseTotalCount(num);
	}

	public int getDrugSearchHistoryTotalCount(int num) {
		return dao.getDrugSearchHistoryTotalCount(num);
	}
	
	public int getTotalImgDrugSearch(Map<String, String> map) {
		return dao.getTotalImgDrugSearch(map);
	}

	public void setDrugInsert(DrugVO vo) {
		dao.setDrugInsert(vo);
	}

	public int getDrugSearchTotalCount(Map<String, String> map) {
		return dao.getDrugSearchTotalCount(map);
	}

	public void setDrugMyCaseInsert(Map<String, Integer> map) {
		dao.setDrugMyCaseInsert(map);
	}

	public void myDrugCaseDelete(Map<String, Integer> map) {
		dao.myDrugCaseDelete(map);
	}

	public void setDrugSearchInsert(Map<String, Integer> map) {
		dao.setDrugSearchHistoryInsert(map);
	}
	
	

}
