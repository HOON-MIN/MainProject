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

	private String disease1, disease2,
		diseasehist, diseaseetc, smoke, alcohol, allergy, 
		allergyetc, pregnancy, symptom, meddate;

}
