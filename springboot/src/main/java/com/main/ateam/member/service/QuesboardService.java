package com.main.ateam.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.hospital.dao.QuesboardDao;
import com.main.ateam.vo.QuesboardVO;


@Service
public class QuesboardService {

	@Autowired
	private QuesboardDao dao;
	
	public void addQuesboard(QuesboardVO vo) {
		vo.setId("member");
		dao.addQuesboard(vo);
	}
	
	public void qbUpdate(QuesboardVO vo) {
		vo.setId("member");
		dao.qbUpdate(vo);
	}
	
	
	
	
}
