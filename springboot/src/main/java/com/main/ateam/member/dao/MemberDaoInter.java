package com.main.ateam.member.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.MemberVO;


	public interface MemberDaoInter {
		
		public MemberVO memberLogin(Map<String, String>map);
		public MemberVO memberMyPage(int num);
		public void memberUpdate(MemberVO vo);
	}


