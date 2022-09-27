package com.main.ateam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.ansboard.service.AnsboardService;
import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.QuesboardVO;

@Controller
public class DefaultController {
	
	@Autowired
	private QuesboardService service;
	@Autowired
	private AnsboardService ansService;

	@GetMapping(value = {"/","/main"})
	public String searchPage(Model m) {
		//  메인페이지 - 조회수 가장 높은 Dr.건강 /////
		System.out.println("----- MainPage - Dr.건강 -----");
		int qnum = 7;
		QuesboardVO vo = service.getQBDetail(qnum);
//		System.out.println("qnum => "+qnum);
		service.upQBHit(vo);
//		System.out.println(vo.getQtitle());
		int num = 37;
		AnsboardVO avo = ansService.getABDetail(num);
//		System.out.println("ansService success");
		m.addAttribute("vo", vo);
		m.addAttribute("avo", avo);
		/////////////////////
		return "main/index";
	}
	@GetMapping(value = "/member")
	public String member_mainPage() {
		return "main/member_main";
	}
	@GetMapping(value = "/hospital")
	public String hospital_mainPage() {
		return "main/hospital_main";
	}
}
