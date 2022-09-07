package com.main.ateam.controller.quesboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.member.service.QuesboardService;
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
	
	@PostMapping(value = "/qbUpdate")
	public String qbUpdate(QuesboardVO vo) {
		service.qbUpdate(vo);
		System.out.println("qbUpdate controller");
		return "redirect:/quesboardList";
	}
	
	
	

}
