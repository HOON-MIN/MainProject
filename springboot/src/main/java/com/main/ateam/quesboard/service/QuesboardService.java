package com.main.ateam.quesboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.quesboard.dao.QuesboardDao;
import com.main.ateam.vo.HospitalVO;
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
	
	public List<QuesboardVO> getQBList() {
		List<QuesboardVO> list = dao.getQBList();
		System.out.println("QB service => " + list);
		return list;
	}

//	public HospitalVO getDetail(int num) {
//		HospitalVO vo = dao.getDetail(num);
//		System.out.println("service => " + vo);
//		return vo;
//	}
	
	
	
	
}
