package com.main.ateam.medInq.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MedInqVO;
import com.main.ateam.vo.QuesboardVO;
import com.main.ateam.vo.ReviewBoardVO;
import com.main.ateam.vo.SearchVO;


public interface MedinqDao {

	// 의학지식인 게시판 - 일반회원 질문하기 
	public void addMedinq(MedInqVO vo);

	// 회원 마이페이지에서 문진표 디테일
	public MedInqVO getMIDetail(int num);
	// 수정 
	public void miUpdate(MedInqVO vo);
	// 삭제 
	public void miDelete(int num);
	public int checkMedNum(int num);
	public MedInqVO showMedinq(int num);
//	// 페이징 리스트 
//	public List<QuesboardVO> getQBList(SearchVO svo);
//	//  + 총 게시물 수 가져오기
//	public int getCnt(SearchVO svo);
//	// 의학지식인-질문 게시글 클릭 시 조회수 증가 
//	public void upQBHit(QuesboardVO vo);
//	// 질문의 카테고리 종류 가져오기 
//	public List<QuesboardVO> getCate();
//	
	
}
