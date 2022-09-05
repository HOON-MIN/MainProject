package com.main.ateam.admin.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.NoticeVO;

public interface NoticeDaoInter {

	public List<NoticeVO> getNoticeList(Map<String, Integer> map);
	public int totalCount();
	public NoticeVO getDetail(int nnum);
	public void addNotice(NoticeVO vo);
	public void deleteNotice(int nnum);
	public void updateNotice(NoticeVO vo);
	public void addCount();
}
