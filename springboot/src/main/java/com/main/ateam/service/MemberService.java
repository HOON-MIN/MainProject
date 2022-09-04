package com.main.ateam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.ateam.dao.MemberDAO;
import com.main.ateam.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	
	public List<MemberVO> login() {
		return memberDao.login();
	}
}
