package com.main.ateam.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.service.MemberService;
import kr.co.kosmo.mvc.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/memberLoginForm")
	public String MemberLoginForm() {
		return "member/member_login_form";
	}
	
	//회원 로그인
	@PostMapping("/memberLogin") 
	public ModelAndView MemberLogin(HttpSession session,MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/member");
		
		Map<String, String> map = new HashMap<>();
		map.put("id",vo.getId());
		map.put("pwd",vo.getPwd());
		System.out.println("id = " + vo.getId());
		System.out.println("pwd = " + vo.getPwd());
		MemberVO dto = memberService.memberLogin(map);
		
		if(dto == null) {
			mav.setViewName("error/paramException");
			mav.addObject("emsg", "로그인 실패 입니다.");
		}else {
			session.setAttribute("sessionID", dto.getId());
		}
		return mav;
	}
	
	@GetMapping(value = "/test")
	public String test(HttpSession session,MemberVO vo) {
		String id =""; 
		id = (String) session.getAttribute("sessionid");
		System.out.println(id);
		return "redirect:/member";
	}
}
