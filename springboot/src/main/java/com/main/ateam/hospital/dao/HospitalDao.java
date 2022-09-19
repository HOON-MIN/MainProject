package com.main.ateam.hospital.dao;

import java.util.List;

import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;


public interface HospitalDao {

	public List<HospitalVO> getList();
	
	public HospitalVO getDetail(int num);
	public void addCompany(CompanyVO cvo);
	public void addHospital(HospitalVO hvo);
	public List<DoctorVO> hospitalDoctorList(int cnum);
	public List<DoctorVO> choiceDoctorList(int cnum);// 예약 - 의사 고르기
}
