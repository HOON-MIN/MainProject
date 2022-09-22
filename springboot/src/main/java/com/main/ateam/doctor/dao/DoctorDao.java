package com.main.ateam.doctor.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.ReserveVO;

public interface DoctorDao {

	public DoctorVO doctorLogin(Map<String, String>map);
	public int idchk(Map<String, String> vo);
	public void addDoctor(DoctorVO dvo);
	public DoctorVO doctorMypage(int dnum);
	public List<ReserveVO> doctorReserveList(int dnum);
	
	
	public List<DoctorVO> hospitalDoctorList();
	public int drIdCheck(Map<String, String> map);
	public List<DoctorVO> hospitalDoctorCategory(String dmajor);
	public DoctorVO hospitalDoctorDetail(int dnum);
}
