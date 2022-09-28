package com.main.ateam.ansboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.ansboard.dao.AnsboardDao;
import com.main.ateam.quesboard.dao.QuesboardDao;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.QuesboardVO;


@Service
public class AnsboardService {

	@Autowired
	private AnsboardDao dao;
	
	public void addAnsboard(AnsboardVO vo) {
		// 의사 번호 session 받기 
		vo.setDnum(1);
		dao.addAnsboard(vo);
	}
	
	// 특정 질문에 달린 답변 리스트 - 모든 사람이 볼 수 있음  
	public List<AnsboardVO> getABList(int num) {
		System.out.println("getABList num => "+num);
		List<AnsboardVO> list = dao.getABList(num);
		System.out.println("getABList service => " + list.toString());
		return list;
	}
	
	// 의사 마이페이지에서 자신이 단 답변 목록 보기 getABmyList
	public List<AnsboardVO> getABmyList(int num) {
		List<AnsboardVO> list = dao.getABmyList(num);
		System.out.println("getABmyList service => " + list);
		return list;
	}
	// 메인페이지 - 조회수 가장 높은 Dr.건강
	public AnsboardVO getABDetail(int num) {
		num = 37;
		AnsboardVO vo = dao.getABDetail(num);
		System.out.println("getABDetail service => " + vo);
		return vo;
	}
	
	
//	public void qbUpdate(QuesboardVO vo) {
////		vo.setId("member");
//		dao.qbUpdate(vo);
//	}
//	
//	public void qbDelete(int num) {
//		dao.qbDelete(num);
//	}
	
	
	
	
}
