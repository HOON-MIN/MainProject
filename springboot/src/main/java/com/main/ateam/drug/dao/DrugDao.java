package com.main.ateam.drug.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.DrugVO;

public interface DrugDao {

	public List<DrugVO> getDrugList(Map<String, Integer> map);

	public List<DrugVO> getDrugContentSearch(Map<String, String> map);

	public List<DrugVO> getDrugSearchShape(Map<String, String> map);
	
	public List<DrugVO> getImgDrugSearch(Map<String,String> map);

	public int getDrugSearchShapeCount(Map<String, String> map);

	public DrugVO getDrugDetail(int num);

	public int getTotalCount();
	
	public int getTotalImgDrugSearch(Map<String,String> map);

	public int getmyDrugCaseTotalCount(int num);

	public int getDrugSearchHistoryTotalCount(int num);

	public int getDrugSearchTotalCount(Map<String, String> map);

	public void setDrugInsert(DrugVO vo);

	public void setDrugMyCaseInsert(Map<String, Integer> map);

	public void myDrugCaseDelete(Map<String, Integer> map);

	public void setDrugSearchHistoryInsert(Map<String, Integer> map);

}
