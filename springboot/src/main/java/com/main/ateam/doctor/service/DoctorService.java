package com.main.ateam.doctor.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.doctor.dao.DoctorDao;
import com.main.ateam.vo.DoctorVO;
@Service
public class DoctorService {
	@Autowired
	DoctorDao doctordao;
	
	public DoctorVO doctorLogin(Map<String, String> map) {
		return doctordao.doctorLogin(map);
	}
	public int idchk(Map<String, String> vo) {
		return doctordao.idchk(vo);
	}
}
