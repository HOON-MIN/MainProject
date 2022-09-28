package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Alias("prvo")
public class PrescriptionVO {
	private int pnum;
	private int num;
	private int dnum;
	private int xray;
	private int mri;
	private int ct;
	private int endoscope;
	private String cont;
	private String pdate;
	private String dname;
	
}
