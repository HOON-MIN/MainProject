package com.main.ateam.doctor.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.DoctorVO;

public interface DoctorDao {

	public DoctorVO doctorLogin(Map<String, String>map);
	public int idchk(Map<String, String> vo);
	public List<DoctorVO> hospitalDoctorList();
	public DoctorVO hospitalDoctorDetail(int dnum);
	public List<DoctorVO> hospitalDoctorCategory(String dmajor);
}
