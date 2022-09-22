package com.main.ateam.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.HospitalVO;

@RestController
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "androididchk")
	@ResponseBody
	public int AndroidIdCheck(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		int cnt = memberService.AndroidIdCheck(map);
		return cnt;
	}
	

}
