package com.main.ateam.vo;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@Alias("reserveVO")
public class ReserveVO {

	private int reservNum;
	private int num;
	private int dnum;
	private int contextCheck;
	private String symptom;
	private String symptomComm;
	private MemberVO memberVO;
	private DoctorVO doctorVO;
	
	
	
	
	
	
}
