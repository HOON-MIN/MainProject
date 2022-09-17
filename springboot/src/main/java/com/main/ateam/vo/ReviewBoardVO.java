package com.main.ateam.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewBoardVO {

	int rnum;
	String id;
	String title;
	String cont;
	String udate;
	int hits;
	int likes;
	String hname;
	String dname;
	// 추가
	int rcount;
}
