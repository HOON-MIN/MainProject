package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("qvo")
public class QuesboardVO {

	private int qnum, qhit, r_num;
	private String id, qtitle, qcont, qdate, qcate;

	
}
