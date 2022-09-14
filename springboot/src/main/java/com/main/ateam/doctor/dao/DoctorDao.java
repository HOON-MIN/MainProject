package com.main.ateam.doctor.dao;

import java.util.Map;

import com.main.ateam.vo.DoctorVO;

public interface DoctorDao {

	public DoctorVO doctorLogin(Map<String, String>map);
	public int idchk(Map<String, String> vo);
}
