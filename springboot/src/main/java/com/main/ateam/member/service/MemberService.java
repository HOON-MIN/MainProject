package com.main.ateam.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.member.dao.MemberDao;
import com.main.ateam.vo.MemberVO;

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
}
