package com.main.ateam;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.google.gson.Gson;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.MemberVO;

@RunWith(SpringRunner.class)
@SpringBootTest()
class MyBatisTest {

	@Autowired
	private SqlSessionFactory ss;
	@Autowired
	private MemberService memberService;
	
	@Test
	@Ignore
	public void testConnection() {
		try(SqlSession sqlSession = ss.openSession(true)){
			Connection conn = sqlSession.getConnection();
			System.out.println("Connection Test : "+conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testSelect() {
		System.out.println(memberService.getList());
		Gson gson = new Gson();
		String res = gson.toJson(memberService.getList());
		System.out.println(res);
	}
	}
