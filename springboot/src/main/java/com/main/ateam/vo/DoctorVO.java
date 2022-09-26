package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("doctorVO")
public class DoctorVO {
	private int dnum;
	private int cnum;
	private String dname;
	private String did;
	private String dpwd;
	private String dmajor;
	private String profimg;
	
	//private MultipartFile mfile;
	private HospitalVO hvo;
	private List<ReserveVO> reserveVO;
	private List<HospitalVO> hospitalVO; // 훈민
	
	
}
