package com.main.ateam.member.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.MemberVO;


	public interface MemberDao {
		public void addMember(MemberVO mvo);
		public List<MemberVO> memberList();
		public MemberVO memberMyPage(int num);
		public void memberUpdate(MemberVO vo);
		public MemberVO memberLogin(Map<String, String>map);
		public int idchk(Map<String, String> vo);
		public int idCheck(Map<String, String> map);
	}


