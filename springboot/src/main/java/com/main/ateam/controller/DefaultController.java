package com.main.ateam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.review.service.ReviewBoardService;
import com.main.ateam.vo.ReviewBoardVO;

@Controller
public class DefaultController {
	
	@Autowired
	private ReviewBoardService service;
	

	@GetMapping(value = {"/","/main"})
	public ModelAndView searchPage(Model m) {
		ModelAndView mav = new ModelAndView("main/index");
		List<ReviewBoardVO> list = service.getReviewSearch();
		m.addAttribute("re",list);
		return mav;
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
