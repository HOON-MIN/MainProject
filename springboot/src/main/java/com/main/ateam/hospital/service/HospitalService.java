package com.main.ateam.hospital.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;


@Service
public class HospitalService {

	@Autowired
	private HospitalDao dao;

	public List<HospitalVO> getList() {
		List<HospitalVO> list = dao.getList();
		System.out.println("service => " + list);
		return list;
	}

	public HospitalVO getDetail(int num) {
		HospitalVO vo = dao.getDetail(num);
		System.out.println("service => " + vo);
		return vo;
	}
	@Transactional
	public void addHospitalService(CompanyVO cvo, HospitalVO hvo) {
		System.out.println("hospital service");
		System.out.println("Crn service"+cvo.getCrn());
		dao.addCompany(cvo);
		dao.addHospital(hvo);
	}
	public List<DoctorVO> hospitalDoctorList(int cnum){
		return dao.hospitalDoctorList(cnum);
	}
	public List<DoctorVO> choiceDoctorList(int cnum){// 예약 - 의사 고르기
		return dao.choiceDoctorList(cnum);
	}
}
