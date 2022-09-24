package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("pvo")
public class PharmacyVO {
	
	private int pnum, cnum;
	private String pname, ploc, ptel;
	private double plat, plong;
	
}
