package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("memberVO")
public class MemberVO {
	private int num;
	private String id;
	private String pwd;
	private String name;
	private String ssn;
	private int age;
	private String addr;
	private String gender;
	private String tel;
	private String email;
	private String profimg;
	private String mdate;
	private MultipartFile mfile;
	private List<ReserveVO> reserveVO;
	
	
	
	
}
