package com.main.ateam.ansboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.ansboard.service.AnsboardService;
import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.QuesboardVO;


@Controller
@RequestMapping(value = "/ansboard")
public class AnsboardController {

	@Autowired
	private AnsboardService service;

	@RequestMapping(value = "/abForm")
	public String abForm() {
		return "ansboard/ansboardForm";
	}

	@PostMapping(value = "/abInsert")
	public String abInsert(AnsboardVO vo) {
		System.out.println("*******************");
		System.out.println(vo.toString());
		// sessionDnum 을 심어야 됨
		vo.setDnum(1);
		service.addAnsboard(vo);
		return "redirect:abList";
	}

	@RequestMapping(value = "/abList")
	public String abList(Model m, int num ) {
//		ModelAndView mav = new ModelAndView();
		System.out.println("controller - qbList");
		List<AnsboardVO> list = service.getABList(num);
		System.out.println(list);
//		for(QuesboardVO e : list) {
//			System.out.println(e.getQtitle());
//		}
		m.addAttribute("list", list);
		return "ansboard/ansboardList";	
	}
//	
//	@GetMapping(value = "/abDetail")
//	public String abDetail(int num, Model m) {
//		System.out.println("controller - qbDetail");
//		QuesboardVO vo = service.getQBDetail(num);
//		System.out.println(vo.getQtitle());
//		System.out.println(vo.getQcont());
//		System.out.println(vo.getId());
//		System.out.println("--------qbDetail contr----------");
//		m.addAttribute("vo", vo);
//		return "ansboard/ansboardDetail";
//	}
//	
//	
//	@PostMapping(value = "/abUpdate")
//	public String abUpdate(QuesboardVO vo) {
//		System.out.println(vo.toString());
//		service.qbUpdate(vo);
//		System.out.println("abUpdate controller");
//		return "redirect:abList";
//	}
//	
//	@PostMapping(value = "/abDelete")
//	public String abDelete(int qnum) {
//		service.qbDelete(qnum);
//		return "redirect:abList";
//	}
	
	
	

}
