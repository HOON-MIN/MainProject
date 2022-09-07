package com.main.ateam.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private String name;
	private String fileName;
	private MultipartFile fileOriName;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(MultipartFile fileOriName) {
		this.fileOriName = fileOriName;
	}
	
	
}
