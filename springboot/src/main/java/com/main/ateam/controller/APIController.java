package com.main.ateam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.ateam.service.MemberService;
import com.main.ateam.vo.MemberVO;

@Controller
public class APIController {

	@Autowired
	private MemberService memberSerivce;
	
	@GetMapping("/login")
	public @ResponseBody List<MemberVO> loginProcess() {
		List<MemberVO> log = memberSerivce.login();
		System.out.println(log);
		return log;
	}
	
	
}
