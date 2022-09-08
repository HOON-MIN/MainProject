package com.main.ateam.admin.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.admin.dao.NoticeDaoInter;
import com.main.ateam.vo.NoticeVO;
@Service
public class NoticeService {
	@Autowired
	private NoticeDaoInter noticeDao;

	public List<NoticeVO> getNoticeList(Map<String, Integer> map){
		return noticeDao.getNoticeList(map);
	}
	public NoticeVO getDetail(int nnum) {
		return noticeDao.getDetail(nnum);
	}
	public void addNotice(NoticeVO vo) {
		noticeDao.addNotice(vo);
	}
	public void deleteNotice(int nnum) {
		noticeDao.deleteNotice( nnum);
	}
	public void updateNotice(NoticeVO vo) {
		noticeDao.updateNotice(vo);	
	}
	
}
