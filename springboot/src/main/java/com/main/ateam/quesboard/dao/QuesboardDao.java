package com.main.ateam.quesboard.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.QuesboardVO;


public interface QuesboardDao {

	// 의학지식인 게시판 - 일반회원 질문하기 
	public void addQuesboard(QuesboardVO vo);
	// 수정 
	public void qbUpdate(QuesboardVO vo);
	// 페이징 리스트 
	public List<QuesboardVO> getQBList();
	// 디테일
	public QuesboardVO getQBDetail(int num);
	// 삭제 
	public void qbDelete(int num);
	
}
