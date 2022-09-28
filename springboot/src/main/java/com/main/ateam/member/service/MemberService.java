package com.main.ateam.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.member.dao.MemberDao;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.PrescriptionVO;
import com.main.ateam.vo.SearchVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public void addMemberService(MemberVO mvo) {
		memberDao.addMember(mvo);
	}
	public int idCheckService(Map<String, String> map) {
		return memberDao.idCheck(map);
	}
	public MemberVO memberLogin(Map<String, String> map) {
		return memberDao.memberLogin(map);
	}
	
	public MemberVO memberMyPage(int num) {
		return memberDao.memberMyPage(num);
	}
	public void memberUpdate(MemberVO vo) {
		memberDao.memberUpdate(vo);
	}
	
	public List<MemberVO> memberList() {
		return memberDao.memberList();
	}
	public int idchk(Map<String, String> vo) {
		return memberDao.idchk(vo);
	}
	public  List<HospitalVO> memberReserveList(SearchVO svo) {
		return memberDao.memberReserveList(svo);
	}
	public MemberVO memberReserveDetail(Map<String, Integer> map) {
		return memberDao.memberReserveDetail(map);
	}
	public int getReserveCnt(int num) {
		return memberDao.getReserveCnt(num);
	}
	/* 이동환 Service추가 */
	public void kakaoSignup(MemberVO vo) {
		memberDao.kakaoSignup(vo);
	}
	public int kakaoFlag(String id) {
		return memberDao.kakaoFlag(id);
	}
	public MemberVO userdetail(String id) {
		return memberDao.userdetail(id);
	}
	
	/* 이동환 Service추가 */
	public int AndroidIdCheck(Map<String, String>map) {
		return memberDao.AndroidIdCheck(map);
	}
	
	public MemberVO memberidlist(String id) {
		return memberDao.memberidlist(id);
	}
	public List<PrescriptionVO> selectPlist(int num){
		return memberDao.selectPlist(num);
	}
	public PrescriptionVO selectPone(int pnum) {
		return memberDao.selectPone(pnum);
	}
	
}
