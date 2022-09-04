package com.main.ateam.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.main.ateam.vo.MemberVO;

public class MemberDAOImple implements MemberDAO {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<MemberVO> login() {
		List<MemberVO> list =  ss.selectList("memberDAO.login");
		return list;
	}
	
	
	
}
