package com.main.ateam.admin.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.admin.dao.AdminDao;
import com.main.ateam.admin.dao.NoticeDaoInter;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.NoticeVO;
@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;

	public List<MemberVO> memberList(){
		return adminDao.memberList();
	}
	
	
	
	public List<HospitalVO> ad_hospitalList(Map<String, Integer> map){
		return adminDao.ad_hospitalList(map);
	}
	
	public int ad_hospitalList_totalCount() {
		return adminDao.ad_hospitalList_totalCount();
	}
	
	
	public List<HospitalVO> waitingList(){
		return adminDao.waitingList();
	}
	public void agree(int num) {
		adminDao.agree(num);
	}
	public List<HospitalVO> adminBarchart(){
		return adminDao.adminBarchart();
	}
	public List<DoctorVO> adminBarchart2(String hcate) {
		return adminDao.adminBarchart2(hcate);
	}
	/*
	 * public NoticeVO getDetail(int nnum) { return noticeDao.getDetail(nnum); }
	 * public void addNotice(NoticeVO vo) { noticeDao.addNotice(vo); } public void
	 * deleteNotice(int nnum) { noticeDao.deleteNotice( nnum); } public void
	 * updateNotice(NoticeVO vo) { noticeDao.updateNotice(vo); }
	 */
	
}
