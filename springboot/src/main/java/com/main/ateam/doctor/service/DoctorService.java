package com.main.ateam.doctor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.doctor.dao.DoctorDao;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.ReserveVO;
import com.main.ateam.vo.SearchVO;
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
	
	public List<DoctorVO> hospitalDoctorList(){
		return doctordao.hospitalDoctorList();
	}
	
	public DoctorVO hospitalDoctorDetail(int dnum) {
		return doctordao.hospitalDoctorDetail(dnum);
	}
	public void addDoctorService(DoctorVO dvo) {
		doctordao.addDoctor(dvo);
	}
	
	public int drIdCheckService(Map<String, String> map) {
		return doctordao.drIdCheck(map);
	}
	
	public List<DoctorVO> hospitalDoctorCategory(String dmajor) {
		return doctordao.hospitalDoctorCategory(dmajor);
	}
	public DoctorVO doctorMypage(int dnum) {
		return doctordao.doctorMypage(dnum);
	}
	public List<ReserveVO> doctorReserveList(int dnum){
		return doctordao.doctorReserveList(dnum);
	}
	
	public List<DoctorVO> selecHospitaldoc(Map<String, String> map){
		return doctordao.selecHospitaldoc(map);
	}
	
	public List<DoctorVO> doctorCategorySpring(){
		return doctordao.doctorCategorySpring();
	}
	
	public int doctorCnt(SearchVO svo) {
		return doctordao.doctorCnt(svo);
	}
	
	public List<HospitalVO> doctorListSpring(SearchVO svo){
		return doctordao.doctorListSpring(svo);
	}
	
	public List<HospitalVO> doctorListReact(SearchVO svo){
		return doctordao.doctorListReact(svo);
	}
	
	public DoctorVO doctorDetailSpring(int dnum) {
		return doctordao.doctorDetailSpring(dnum);
	}
}
