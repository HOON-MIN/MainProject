package com.main.ateam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MemberVO {
		@JsonProperty
		private int num;
		
		@JsonProperty
		private String id ;
		
		@JsonProperty
		private String pwd;

		@JsonProperty
		private String name;
		
		@JsonProperty
		private String ssn;
		
		@JsonProperty
		private String tel;
		
		@JsonProperty
		private String email;
		
		@JsonProperty
		private String mdate;
		
}
