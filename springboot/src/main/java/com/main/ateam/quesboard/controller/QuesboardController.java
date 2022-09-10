package com.main.ateam.quesboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.vo.QuesboardVO;


@Controller
@RequestMapping(value = "/quesboard")
public class QuesboardController {

	@Autowired
	private QuesboardService service;

	@RequestMapping(value = "/qbForm")
	public String qbForm() {
		return "quesboard/quesboardForm";
	}

	@PostMapping(value = "/qbInsert")
	public String qbInsert(QuesboardVO vo) {
		System.out.println("*******************");
		System.out.println(vo.toString());
//		vo.setId("member");
		service.addQuesboard(vo);
		return "redirect:/quesboardList";
	}

	@RequestMapping(value = "/qbList")
	public String qbList(Model m) {
//		ModelAndView mav = new ModelAndView();
		System.out.println("controller - qbList");
		List<QuesboardVO> list = service.getQBList();
		System.out.println(list);
		for(QuesboardVO e : list) {
			System.out.println(e.getQtitle());
		}
		m.addAttribute("list", list);
		return "quesboard/quesboardList";	
	}
	
	@GetMapping(value = "/qbDetail")
	public String qbDetail(int num, Model m) {
		System.out.println("controller - qbDetail");
		QuesboardVO vo = service.getQBDetail(num);
		m.addAttribute("vo", vo);
		return "quesboard/quesboardDetail";
	}
	
	
	@PostMapping(value = "/qbUpdate")
	public String qbUpdate(QuesboardVO vo) {
		service.qbUpdate(vo);
		System.out.println("qbUpdate controller");
		return "redirect:/quesboardList";
	}
	
	@PostMapping(value = "/qbDelete")
	public String qbDelete(int num) {
		service.qbDelete(num);
		return "redirect:/quesboardList";
	}
	
	
	

}
