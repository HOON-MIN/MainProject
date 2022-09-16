package com.main.ateam.hospital.dao;

import java.util.List;

import com.main.ateam.vo.HospitalVO;


public interface HospitalDao {

	public List<HospitalVO> getList();
	
	public HospitalVO getDetail(int num);
	
	
}
