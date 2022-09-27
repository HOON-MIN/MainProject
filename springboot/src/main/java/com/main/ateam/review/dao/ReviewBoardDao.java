package com.main.ateam.review.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.ReviewBoardCommVO;
import com.main.ateam.vo.ReviewBoardVO;

public interface ReviewBoardDao {

	public List<ReviewBoardVO> getList(Map<String, Object> map);
	public int getCnt();
	public void addReviewBoard(ReviewBoardVO vo);
	public ReviewBoardVO getDetail(int num);
	public void upReviewBoard(ReviewBoardVO vo);
	public void upDelete(int num);
	public void upReviewHits(int num);

	// 댓글 관련 추가!-------------------
	public int addReply(ReviewBoardCommVO vo);
	public List<ReviewBoardCommVO> showReply(int num);
	public void upReply(ReviewBoardCommVO vo);
	public int delReply(int cnum);
	public void upRcount(int rnum);
	
	
	public List<ReviewBoardVO> getHospitalReview(Map<String, String> map);
	public List<ReviewBoardVO> getReviewSearch();
	
}
