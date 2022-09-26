package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("hvo")
public class HospitalVO {
	
	private int  cnum,r_num;
	private String hname, hloc, otime, ctime,
		hcate, hurl, htel;
	private List<DoctorVO> doctorVO;
	private DoctorVO dvo;
	private CompanyVO cvo;
	
}
