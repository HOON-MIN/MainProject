package com.main.ateam.hospital.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.SearchVO;

@Service
public class HospitalService {

	@Autowired
	private HospitalDao dao;

	public List<HospitalVO> getList(SearchVO svo) {
		List<HospitalVO> list = dao.getList(svo);
//		System.out.println("hosp service => " + list.isEmpty());
		return list;
	}
	public int getCnt(SearchVO svo) {
		int cnt = dao.getCnt(svo);
		return cnt;
	}

	public HospitalVO getDetail(int num) {
		HospitalVO vo = dao.getDetail(num);
		System.out.println("service => " + vo);
		return vo;
	}

	@Transactional
	public void addHospitalService(CompanyVO cvo, HospitalVO hvo) {
		System.out.println("hospital service");
		System.out.println("Crn service" + cvo.getCrn());
		dao.addCompany(cvo);
		dao.addHospital(hvo);
	}

	public List<DoctorVO> hospital_DoctorList(int cnum) {
		return dao.hospital_DoctorList(cnum);
	}
	public List<DoctorVO> choiceDoctorList(int cnum){// 예약 - 의사 고르기
		return dao.choiceDoctorList(cnum);
	}
	
	public List<HospitalVO> getCate() {
		return dao.getCate();
	}
	
	public List<HospitalVO> getHospital(Map<String, String> map){
		return dao.getHospital(map);
	}

	public HospitalVO addDoctor(int cnum) {
		return dao.addDoctor(cnum);
	}

	public List<HospitalVO> selectHospitalCate(){
		return dao.selectHospitalCate();
	}
	public List<HospitalVO> selectHospital(Map<String, String> map){
		return dao.selectHospital(map);
	}
	public List<HospitalVO> getSelectHospital(Map<String, String> map){
		return dao.getSelectHospital(map);
	}
}
