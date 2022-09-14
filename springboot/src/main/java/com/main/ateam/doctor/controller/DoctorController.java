package com.main.ateam.doctor.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;
@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired
	private DoctorService doctorservice;
	
	@PostMapping("/doctorLogin")
	public ModelAndView doctorLogin(HttpSession session, DoctorVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/member");
		System.out.println("doctor id = " + vo.getDid());
		System.out.println("doctor pwd = " + vo.getDpwd());
		Map<String, String> map = new HashMap<>();
		map.put("did", vo.getDid());
		map.put("dpwd", vo.getDpwd());
		DoctorVO dto = doctorservice.doctorLogin(map);
		if(dto == null) {
			System.out.println("로그인 실패");
		}else { 
		System.out.println("로그인 성공");
		session.setAttribute("sessionID", dto.getDid());
		session.setAttribute("sessionNUM", dto.getDpwd());
		
		}
		return mav;	}
	@ResponseBody
	@PostMapping(value = "/idchk")
	public String idchk(String did,String dpwd){
		Map<String, String> map = new HashMap<>();
		map.put("did", did);
		map.put("dpwd",dpwd);
		
		System.out.println("controller id => " + did);
		System.out.println("controller pwd => " + dpwd);
		System.out.println("map =>"+map);
		int cnt = doctorservice.idchk(map);
		System.out.println("doc cnt => " + cnt);
		String res = Integer.toString(cnt);
		System.out.println("doc res => " + res);
		return res; 
	}
}
