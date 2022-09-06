package com.main.ateam.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.member.dao.MemberDao;
import com.main.ateam.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberdao;
	
	public List<MemberVO> getList(){
		return memberdao.getMemberList();
	}
}
