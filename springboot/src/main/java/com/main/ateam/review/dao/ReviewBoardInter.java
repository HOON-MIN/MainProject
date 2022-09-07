package com.main.ateam.review.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.ReviewBoardVO;

public interface ReviewBoardInter {

	public List<ReviewBoardVO> getList(Map<String, Object> map);
	public int getCnt();
	public void addReviewBoard(ReviewBoardVO vo);
	public ReviewBoardVO getDetail(int num);
	public void upReviewBoard(ReviewBoardVO vo);
	public void upDelete(int num);
	public void upReviewHits(int num);

}
