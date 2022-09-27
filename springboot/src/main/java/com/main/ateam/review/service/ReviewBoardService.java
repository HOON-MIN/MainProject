package com.main.ateam.review.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.main.ateam.review.dao.ReviewBoardDao;
import com.main.ateam.vo.ReviewBoardCommVO;
import com.main.ateam.vo.ReviewBoardVO;

@Service
public class ReviewBoardService {

	@Autowired
	private ReviewBoardDao dao;
	
	// 페이징 처리용
	public List<ReviewBoardVO> getList(Map<String, Object> map) {
		// List<ReviewBoardVO> list = dao.selectList("review.getList", map);
		List<ReviewBoardVO> list = dao.getList(map);
		System.out.println("DAO"+list.isEmpty());
		return list;
	}
	// 페이징 처리용
	public int getCnt() {
		// int cnt = dao.selectOne("review.getCnt");
		int cnt = dao.getCnt();
		return cnt;
	}
	// 폼에 후기 입력용
	public void addReviewBoard(ReviewBoardVO vo) {
		// dao.insert("review.addReviewBoard", vo);
		dao.addReviewBoard(vo);
	}
	// 상세 페이지용
	public ReviewBoardVO getDetail(int num) {
		// return dao.selectOne("review.getDetail", num);
		return dao.getDetail(num);
	}
    // 업데이트용
	public void upReviewBoard(ReviewBoardVO vo) {
		// dao.update("review.upReviewBoard", vo);		
		dao.upReviewBoard(vo);
	}
	// 후기 삭제용
	public void upDelete(int num) {
		//dao.delete("review.upDelete", num);
		dao.upDelete(num);
	}
	
	// hits(조회수) 업데이트 용
	public void upReviewHits(int num) {
		// dao.update("review.upReviewHits", num);		
		dao.upReviewHits(num);
	}
	// 댓글 관련 추가!-------------------
	// 댓글 입력
	public int addReply(ReviewBoardCommVO vo) {
		return dao.addReply(vo);
	}
	// 댓글 조회
	public List<ReviewBoardCommVO> showReply(int num){
		return dao.showReply(num);
	}
	// 댓글 수정
	public void upReply(ReviewBoardCommVO vo) {
		dao.upReply(vo);
	}
	// 댓글 삭제
	public int delReply(int cnum) {
		
		return dao.delReply(cnum);
	}
	// rcount 댓글 수 업데이트용
	public void upRcount(int rnum) {
		dao.upRcount(rnum);
	}
	
	
	public List<ReviewBoardVO> getHospitalReview(Map<String, String> map){
		return dao.getHospitalReview(map);
	}
	public List<ReviewBoardVO> getReviewSearch(){
		return dao.getReviewSearch();
	}
	
	
}
