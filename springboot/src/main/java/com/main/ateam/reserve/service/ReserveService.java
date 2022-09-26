package com.main.ateam.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.reserve.dao.ReserveDao;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.ReserveVO;

@Service
public class ReserveService {

	@Autowired
	private ReserveDao dao;
	
	public void addReserve(ReserveVO vo) {
		dao.addReserve(vo);
	}
	public DoctorVO choiceDoctor(int dnum) {
		return dao.choiceDoctor(dnum);
	}
	public List<ReserveVO> checkDate(ReserveVO rvo){
		return dao.checkDate(rvo);
	}
	public List<ReserveVO> getReserveHospital(Map<String, String> map){
		return dao.getReserveHospital(map);
	}
	public int getDoctorCnt(int cnum) {
		return dao.getDoctorCnt(cnum);
	}
}
