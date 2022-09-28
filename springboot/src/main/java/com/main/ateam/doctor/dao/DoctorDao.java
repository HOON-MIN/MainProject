package com.main.ateam.doctor.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.ReserveVO;
import com.main.ateam.vo.SearchVO;

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
	
	
	
	public List<DoctorVO> selecHospitaldoc(Map<String, String> map);
	
	//의사 카테고리 출력
	public List<DoctorVO> doctorCategorySpring();
	//의사 리스트 카운트
	public int doctorCnt(SearchVO svo);
	
	//의사 리스트 출력 (검색)
	public List<HospitalVO> doctorListSpring(SearchVO svo);
	public List<HospitalVO> doctorListReact(SearchVO svo);
	
	//의사 디테일 출력
	public DoctorVO doctorDetailSpring(int dnum);
}
