package com.main.ateam.medInq.controller;

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
@RequestMapping(value = "/medInq")
public class MedInqController {

	@Autowired
	private QuesboardService service;
	@Autowired
	private AnsboardService ansService;

	@RequestMapping(value = "/medInqForm")
	public String medInqForm() {
		return "medInq/medInqForm";
	}

//	@PostMapping(value = "/qbInsert")
//	public String qbInsert(QuesboardVO vo) {
//		System.out.println("*******************");
//		System.out.println(vo.toString());
////		vo.setId("member");
//		service.addQuesboard(vo);
//		return "redirect:qbList";
//	}
//
//	@RequestMapping(value = "/qbList")
//	public String qbList(Model m) {
////		ModelAndView mav = new ModelAndView();
//		System.out.println("controller - qbList");
//		List<QuesboardVO> list = service.getQBList();
//		System.out.println(list);
////		for(QuesboardVO e : list) {
////			System.out.println(e.getQtitle());
////		}
//		m.addAttribute("list", list);
//		return "quesboard/quesboardList";	
//	}
//	
//	@GetMapping(value = "/qbDetail")
//	public String qbDetail(int num, Model m) {
//		System.out.println("num => "+num);
//		System.out.println("-----qbDetail controll-----");
//		QuesboardVO vo = service.getQBDetail(num);
//		System.out.println(vo.getQtitle());
//		System.out.println(vo.getQcont());
//		System.out.println(vo.getId());
//		System.out.println("success");
//		List<AnsboardVO> ansList = ansService.getABList(num);
//		System.out.println("ansService success");
//		System.out.println("-----qbDetail controll-----");
//		m.addAttribute("vo", vo);
//		m.addAttribute("ansList", ansList);
//		return "quesboard/quesboardDetail";
//	}
//	
//	@RequestMapping(value = "/qbUpdateForm")
//	public String qbUpdateForm(int num, Model m) {
//		QuesboardVO vo = service.getQBDetail(num);
//		m.addAttribute("vo", vo);
//		return "quesboard/quesboardUpdateForm";
//	}
//	
//	@PostMapping(value = "/qbUpdate")
//	public String qbUpdate(QuesboardVO vo) {
//		System.out.println("=====qbUpdate controll=====");
//		System.out.println(vo.toString());
//		service.qbUpdate(vo);
//		System.out.println("=====qbUpdate controll=====");
//		return "redirect:qbList";
//	}
//	
//	@PostMapping(value = "/qbDelete")
//	public String qbDelete(int qnum) {
//		service.qbDelete(qnum);
//		return "redirect:qbList";
//	}
	
	
	

}
