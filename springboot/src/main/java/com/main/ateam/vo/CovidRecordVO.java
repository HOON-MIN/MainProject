package com.main.ateam.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CovidRecordVO {
	private String userid, gender;
	private int age, respiratory_condition, fever_or_muscle_pain;
	
	@JsonIgnore
	private String base64str;
	
	
}
