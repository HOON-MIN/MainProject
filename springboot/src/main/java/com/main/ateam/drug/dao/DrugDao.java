package com.main.ateam.drug.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.drug.vo.DrugVO;



public interface DrugDao {
	
	public List<DrugVO> getDrugList(Map<String, Integer> map );
	public DrugVO getDrugDetail(int num);
	
	public int getTotalCount();
	
	public void setDrugInsert(DrugVO vo);

}
