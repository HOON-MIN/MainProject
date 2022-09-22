package com.main.ateam.quesboard.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.QuesboardVO;
import com.main.ateam.vo.ReviewBoardVO;
import com.main.ateam.vo.SearchVO;


public interface QuesboardDao {

	// 의학지식인 게시판 - 일반회원 질문하기 
	public void addQuesboard(QuesboardVO vo);

	// 페이징 리스트 
	public List<QuesboardVO> getQBList(SearchVO svo);
	//  + 총 게시물 수 가져오기
	public int getCnt(SearchVO svo);
	// 의학지식인-질문 게시글 클릭 시 조회수 증가 
	public void upQBHit(QuesboardVO vo);
	// 질문의 카테고리 종류 가져오기 
	public List<QuesboardVO> getCate();
	
	// 수정 
	public void qbUpdate(QuesboardVO vo);
	// 디테일
	public QuesboardVO getQBDetail(int num);
	// 삭제 
	public void qbDelete(int num);
	
}
