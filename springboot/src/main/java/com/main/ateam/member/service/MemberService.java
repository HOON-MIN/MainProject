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
	private MemberDao memberDaoInter;
	
	public MemberVO memberLogin(Map<String, String> map) {
		return memberDaoInter.memberLogin(map);
	}
	
	public MemberVO memberMyPage(int num) {
		return memberDaoInter.memberMyPage(num);
	}
	public void memberUpdate(MemberVO vo) {
		memberDaoInter.memberUpdate(vo);
	}
	
	public List<MemberVO> memberList() {
		return memberDaoInter.memberList();
	}
	public int idchk(Map<String, String> vo) {
		return memberDaoInter.idchk(vo);
	}
}
