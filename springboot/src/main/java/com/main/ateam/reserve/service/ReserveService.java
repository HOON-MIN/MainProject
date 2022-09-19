package com.main.ateam.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.main.ateam.reserve.dao.ReserveDao;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.ReserveVO;

public class ReserveService {

	@Autowired
	private ReserveDao dao;
	
	public void addReserve(ReserveVO vo) {
		dao.addReserve(vo);
	}
	public DoctorVO choiceDoctor(int dnum) {
		return dao.choiceDoctor(dnum);
	}

}
