package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("cvo")
@Getter
@Setter
public class CompanyVO {
	
	private int cnum,cstatus,r_num;
	private String crn, cpwd,ccate,cdate,hgrade;
	private HospitalVO hvo;
	
	
}
