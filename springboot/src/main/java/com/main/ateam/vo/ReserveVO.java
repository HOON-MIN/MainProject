package com.main.ateam.vo;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@Alias("reserveVO")
public class ReserveVO {

	private int reservNum;
	private int num;
	private int r_num;
	private int dnum;
	private int contectCheck;
	private String symptom;
	private String symptomComm;
	private String rdate;
	private String rtime;
	
	private MemberVO memberVO;
	private DoctorVO doctorVO;
	
	
	
	
	
	
	
}
