package com.main.ateam.reserve.dao;
  
import java.util.List;
import java.util.Map;

import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.ReserveVO;
 
public interface ReserveDao{
	public void addReserve(ReserveVO vo);
	public DoctorVO choiceDoctor(int dnum);
	public List<ReserveVO> checkDate(ReserveVO rvo);
	public List<ReserveVO> getReserveHospital(Map<String, String> map);
	public int getDoctorCnt(int cnum);
  }
  