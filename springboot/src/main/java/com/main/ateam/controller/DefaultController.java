package com.main.ateam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.ansboard.service.AnsboardService;
import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.review.service.ReviewBoardService;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.QuesboardVO;
import com.main.ateam.vo.ReviewBoardVO;

@Controller
public class DefaultController {
	
	@Autowired
	private QuesboardService qbservice;
	@Autowired
	private AnsboardService ansService;
	@Autowired
	private ReviewBoardService service;

	@GetMapping(value = {"/","/main"})
	public String searchPage(Model m) {
		//  메인페이지 - 조회수 가장 높은 Dr.건강 /////
		System.out.println("----- MainPage - Dr.건강 -----");
		List<ReviewBoardVO> list = service.getReviewSearch();
		m.addAttribute("re",list);
		int qnum = 7;
		QuesboardVO vo = qbservice.getQBDetail(qnum);
//		System.out.println("qnum => "+qnum);
		qbservice.upQBHit(vo);
//		System.out.println(vo.getQtitle());
		int num = 37;
		AnsboardVO avo = ansService.getABDetail(num);
//		System.out.println("ansService success");
		m.addAttribute("vo", vo);
		m.addAttribute("avo", avo);
		m.addAttribute("re",list);
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
