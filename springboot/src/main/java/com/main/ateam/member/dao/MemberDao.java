package com.main.ateam.member.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.PrescriptionVO;
import com.main.ateam.vo.SearchVO;


	public interface MemberDao {
		public void addMember(MemberVO mvo);
		public List<MemberVO> memberList();
		public MemberVO memberMyPage(int num);
		public void memberUpdate(MemberVO vo);
		public MemberVO memberLogin(Map<String, String>map);
		public int idchk(Map<String, String> vo);
		public int idCheck(Map<String, String> map);
		public List<HospitalVO> memberReserveList(SearchVO svo);
		public int getReserveCnt(int num);
		
		public MemberVO memberReserveDetail(Map<String, Integer> map);
		/* 0918 add: dhlee 추가 */
		public void kakaoSignup(MemberVO vo);
		public int kakaoFlag(String id);
		public MemberVO userdetail(String id);
		
		/* 0920 add: dhlee 추가 */
		public int AndroidIdCheck(Map<String, String>map);
		
		public MemberVO memberidlist(String id);
		/* 0927 처방전 추가*/
		public List<PrescriptionVO> selectPlist(int num);
		public PrescriptionVO selectPone(int pnum);
		

	}


