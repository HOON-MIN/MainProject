package com.main.ateam.hospital.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.SearchVO;


public interface HospitalDao {

//	public List<HospitalVO> getList(Map<String, Object> map);
	public List<HospitalVO> getList(SearchVO svo);
	public int getCnt(SearchVO svo);
	
	public HospitalVO getDetail(int num);
	public void addCompany(CompanyVO cvo);
	public void addHospital(HospitalVO hvo);
	public List<DoctorVO> hospitalDoctorList(int cnum);
	public List<DoctorVO> choiceDoctorList(int cnum);// 예약 - 의사 고르기
	// 진료과목 종류 가져오기 
	public List<HospitalVO> getCate();
	public List<HospitalVO> getHospital(Map<String, String> map);
}
