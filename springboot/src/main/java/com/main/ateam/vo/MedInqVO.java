package com.main.ateam.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("mivo")
public class MedInqVO {
	
	private int mednum;
	private String id, disease, diseasehist,
		etc, smoke, alcohol, allergy, pregnancy, 
		symptom, meddate;
	
}
