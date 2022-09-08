package com.main.ateam.quesboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.quesboard.dao.QuesboardDao;
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
