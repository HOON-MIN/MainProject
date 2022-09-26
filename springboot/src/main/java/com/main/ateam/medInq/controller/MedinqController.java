package com.main.ateam.medInq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.ansboard.service.AnsboardService;
import com.main.ateam.medInq.service.MedinqService;
import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.MedInqVO;
import com.main.ateam.vo.QuesboardVO;


@Controller
@RequestMapping(value = "/medInq")
public class MedinqController {

	@Autowired
	private MedinqService service;
	
	@RequestMapping(value = "/medInqForm")
	public String medInqForm() {
		return "medInq/medInqForm";
	}

	@PostMapping(value = "/medInqIns")
	public String medInqIns(MedInqVO vo, HttpSession session) {
		System.out.println("*******************");
		int usernum = (int) session.getAttribute("sessionNUM");

		vo.setMednum(usernum);
		System.out.println("insert into medInq values ("+usernum+",'"+vo.getDisease1()+"', '"+vo.getDisease2()+
				"','"+vo.getDiseasehist()+"','"+vo.getDiseaseetc()+"','"+vo.getSmoke() + "','"+vo.getAlcohol()+"','"+vo.getAllergy()+"','"+vo.getAllergyetc()+
				"','"+vo.getPregnancy()+"','"+vo.getSymptom()+"', sysdate)");
		service.addMedinq(vo);
		
		return "redirect:qbList";
	}
	
	@GetMapping(value = "/medInqDetail")
	public String medInqDetail(int num, Model m) {
		System.out.println("num => "+num);
		System.out.println("----- medInqDetail controll-----");
		MedInqVO vo = service.getMIDetail(num);
		List<String> disease1 = new ArrayList<>();
		for(String e : vo.getDisease1().split("/")) {
			disease1.add(e);
		}
		m.addAttribute("vo", vo);
		m.addAttribute("disease1",disease1);
		return "medInq/medInqDetail";
	}
	
	@RequestMapping(value = "/medInqUpForm")
	public String medInqUpForm(int num, Model m) {
		MedInqVO vo = service.getMIDetail(num);
		m.addAttribute("vo", vo);
		return "medInq/medInqUpForm";
	}
	
	@PostMapping(value = "/medInqUpdate")
	public String medInqUpdate(MedInqVO vo) {
		System.out.println("=====medInqUpdate controll=====");
		System.out.println(vo.toString());
		service.miUpdate(vo);
		System.out.println("=============================");
		return "redirect:medInqDetail";
	}
	
	@RequestMapping(value = "/medInqDelete")
	public String medInqDelete(int num) {
		service.miDelete(num);
		return "redirect:/";
	}

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
	
	
	

}
