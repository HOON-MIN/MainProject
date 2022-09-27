package com.main.ateam.ansboard.dao;

import java.util.List;

import com.main.ateam.vo.AnsboardVO;

public interface AnsboardDao {

	// 의학지식인 게시판 - 일반회원 질문하기
	public void addAnsboard(AnsboardVO vo);
	// 특정 질문에 달린 답변 리스트 - 모든 사람이 볼 수 있음  
	public List<AnsboardVO> getABList(int num );
	// 의사 마이페이지에서 자신이 단 답변 목록 보기 getABmyList
	public List<AnsboardVO> getABmyList(int num );
//	
//	// 디테일
	public AnsboardVO getABDetail(int num);
//
//	// 수정
//	public void abUpdate(AnsboardVO vo);
//
//	// 삭제 
//	public void abDelete(int num);
	
}
