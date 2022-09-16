package com.main.ateam.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("drugVO")
public class DrugVO {
	private int drug_idx;
	private String drug_name;
	private String drug_code;
	private String drug_img;
	private String drug_identification;
	private String drug_formulation;
	private String drug_component;
	private String drug_company;
	private String drug_description;
	public String getDrug_date() {
		return drug_date;
	}
	public void setDrug_date(String drug_date) {
		this.drug_date = drug_date;
	}
	private Float drug_size_l;
	private Float drug_size_s;
	private Float drug_size_w;
	private String drug_effect;
	private String drug_Professional_General;
	private String drug_color_F;
	private String drug_color_B;
	private String drug_split_line_F;
	private String drug_split_line_B;
	private String drug_disposal;
	private String drug_shape;
	private String drug_date;
	// spring web 제공해주는 multipart.MultipartFile
	private MultipartFile mfile;
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public int getDrug_idx() {
		return drug_idx;
	}
	public void setDrug_idx(int drug_idx) {
		this.drug_idx = drug_idx;
	}
	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}
	public void setDrug_code(String drug_code) {
		this.drug_code = drug_code;
	}
	public void setDrug_img(String drug_img) {
		this.drug_img = drug_img;
	}
	public void setDrug_identification(String drug_identification) {
		this.drug_identification = drug_identification;
	}
	public void setDrug_formulation(String drug_formulation) {
		this.drug_formulation = drug_formulation;
	}
	public void setDrug_component(String drug_component) {
		this.drug_component = drug_component;
	}
	public void setDrug_company(String drug_company) {
		this.drug_company = drug_company;
	}
	public void setDrug_description(String drug_description) {
		this.drug_description = drug_description;
	}
	public void setDrug_size_l(Float drug_size_l) {
		this.drug_size_l = drug_size_l;
	}
	public void setDrug_size_s(Float drug_size_s) {
		this.drug_size_s = drug_size_s;
	}
	public void setDrug_size_w(Float drug_size_w) {
		this.drug_size_w = drug_size_w;
	}
	public void setDrug_effect(String drug_effect) {
		this.drug_effect = drug_effect;
	}
	public void setDrug_Professional_General(String drug_Professional_General) {
		this.drug_Professional_General = drug_Professional_General;
	}
	public void setDrug_color_F(String drug_color_F) {
		this.drug_color_F = drug_color_F;
	}
	public void setDrug_color_B(String drug_color_B) {
		this.drug_color_B = drug_color_B;
	}
	public void setDrug_split_line_F(String drug_split_line_F) {
		this.drug_split_line_F = drug_split_line_F;
	}
	public void setDrug_split_line_B(String drug_split_line_B) {
		this.drug_split_line_B = drug_split_line_B;
	}
	public void setDrug_disposal(String drug_disposal) {
		this.drug_disposal = drug_disposal;
	}
	public void setDrug_shape(String drug_shape) {
		this.drug_shape = drug_shape;
	}
	public String getDrug_name() {
		return drug_name;
	}
	public String getDrug_code() {
		return drug_code;
	}
	public String getDrug_img() {
		return drug_img;
	}
	public String getDrug_identification() {
		return drug_identification;
	}
	public String getDrug_formulation() {
		return drug_formulation;
	}
	public String getDrug_component() {
		return drug_component;
	}
	public String getDrug_company() {
		return drug_company;
	}
	public String getDrug_description() {
		return drug_description;
	}
	public Float getDrug_size_l() {
		return drug_size_l;
	}
	public Float getDrug_size_s() {
		return drug_size_s;
	}
	public Float getDrug_size_w() {
		return drug_size_w;
	}
	public String getDrug_effect() {
		return drug_effect;
	}
	public String getDrug_Professional_General() {
		return drug_Professional_General;
	}
	public String getDrug_color_F() {
		return drug_color_F;
	}
	public String getDrug_color_B() {
		return drug_color_B;
	}
	public String getDrug_split_line_F() {
		return drug_split_line_F;
	}
	public String getDrug_split_line_B() {
		return drug_split_line_B;
	}
	public String getDrug_disposal() {
		return drug_disposal;
	}
	public String getDrug_shape() {
		return drug_shape;
	}
	

}
//create table drug(  
//drug_idx VARCHAR2(1000) PRIMARY KEY,--약품 고유번호 cod 또는 idx
//drug_name varchar2(400), -- 제품명
//drug_code varchar2(2000) , --약품 코드
//drug_img varchar2(1000) , --약품 이미지(약품코드[:-2])
//drug_identification varchar2(200) , --식별표시
//drug_formulation varchar2(100) , --제형
//drug_component varchar2(1000), --성분명
//drug_company varchar2(300), --회사명
//drug_description varchar2(1500), --성상
//drug_size_l FLOAT, --크기_장축
//drug_size_s FLOAT, --크기_단축
//drug_size_w FLOAT, --크기_두께
//drug_effect varchar2(4000), --효능.효과
//drug_Professional_General varchar2(50), --전문/일반 약품 여부
//drug_color_F varchar2(50), --약 전면 색깔
//drug_color_B varchar2(50), --약 후면 색깔
//drug_split_line_F varchar2(50), --약 전면 분할선
//drug_split_line_B varchar2(50), --약 후면 분할선
//drug_disposal varchar2(100), -- 약 식약처 분류 
//drug_shape varchar2(100) --약 모양 
//);
