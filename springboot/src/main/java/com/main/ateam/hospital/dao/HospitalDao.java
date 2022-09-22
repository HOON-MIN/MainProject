package com.main.ateam.hospital.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.SearchVO;


public interface HospitalDao {
	//	미르
//	public List<HospitalVO> getList(Map<String, Object> map);
	public List<HospitalVO> getList(SearchVO svo);
	public int getCnt(SearchVO svo);
	public HospitalVO getDetail(int num);
	public List<HospitalVO> getCate();
	// 태진
	public void addCompany(CompanyVO cvo);
	public void addHospital(HospitalVO hvo);
	public List<DoctorVO> choiceDoctorList(int cnum);// 예약 - 의사 고르기
	public List<DoctorVO> hospital_DoctorList(int cnum);
	
}
