package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Alias("pvo")
@Getter
@Setter
@NoArgsConstructor
@Data
public class PharmacyVO {
	private int pnum ;
	private String shopnumber, fulladdress,shopnam;
	private double longitude, latitude;
	
	
	
}
