package com.main.ateam.reserve.dao;
  
import java.util.List;

import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.ReserveVO;
 
public interface ReserveDao{
	public void addReserve(ReserveVO vo);
	public DoctorVO choiceDoctor(int dnum);
  }
  