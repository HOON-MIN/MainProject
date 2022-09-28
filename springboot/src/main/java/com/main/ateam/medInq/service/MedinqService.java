package com.main.ateam.medInq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.medInq.dao.MedinqDao;
import com.main.ateam.quesboard.dao.QuesboardDao;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MedInqVO;
import com.main.ateam.vo.QuesboardVO;
import com.main.ateam.vo.SearchVO;

@Service
public class MedinqService {

	@Autowired
	private MedinqDao dao;

	// 의학지식인 게시판 - 일반회원 질문하기
	public void addMedinq(MedInqVO vo) {
		dao.addMedinq(vo);
	}

	// 회원 마이페이지에서 문진표 디테일
	public MedInqVO getMIDetail(int num) {
		MedInqVO vo = dao.getMIDetail(num);
		System.out.println("getMIDetail service => " + vo);
		return vo;
	}

	// 수정
	public void miUpdate(MedInqVO vo) {
		dao.miUpdate(vo);
	}

	// 삭제
	public void miDelete(int num) {
		dao.miDelete(num);
	}
	public int checkMedNum(int num) {
		return dao.checkMedNum(num);
	}
	public MedInqVO showMedinq(int num) {
		return dao.showMedinq(num);
	}

//	public void addQuesboard(QuesboardVO vo) {
//		vo.setId("member");
//		dao.addQuesboard(vo);
//	}
//	
//	public List<QuesboardVO> getQBList(SearchVO svo) {
//		List<QuesboardVO> list = dao.getQBList(svo);
////		System.out.println("QBList service => " + list);
//		return list;
//	}
//	public int getCnt(SearchVO svo) {
//		int cnt = dao.getCnt(svo);
//		return cnt;
//	}
//	public List<QuesboardVO> getCate() {
//		return dao.getCate();
//	}
//	public void upQBHit(QuesboardVO vo) {
//		dao.upQBHit(vo);
//	}
//
//	public QuesboardVO getQBDetail(int num) {
//		QuesboardVO vo = dao.getQBDetail(num);
//		System.out.println("QBDetail service => " + vo);
//		return vo;
//	}
//	
//	public void qbUpdate(QuesboardVO vo) {
////		vo.setId("member");
//		dao.qbUpdate(vo);
//	}
//	
//	public void qbDelete(int num) {
//		dao.qbDelete(num);
//	}

}
