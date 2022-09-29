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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String medInqForm( Model m, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		m.addAttribute("num", num);
		System.out.println("문진표 num =" + num);
		return "medInq/medInqForm";
	}
	
	@RequestMapping(value = "/memInqForm")
	public String memInqForm(int dnum, Model m, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		m.addAttribute("dnum", dnum);
		m.addAttribute("num", num);
		System.out.println("문진표 dnum =" + dnum);
		System.out.println("문진표 num =" + num);
		return "medInq/medInqForm";
	}

	@ResponseBody
	@RequestMapping(value = "checkMedNum")
	public int checkMedNum(int num) {
		System.out.println("checkNum = " + num);
		int chk = service.checkMedNum(num);
		return chk;
	}

	//입력
	@PostMapping(value = "/medInqIns")
	//public String medInqIns(MedInqVO vo, HttpSession session) {
		public String medInqIns( HttpSession session) {
		System.out.println("*******************");
		int usernum = (int) session.getAttribute("sessionNUM");

		/*
		 * vo.setMednum(usernum); System.out.println("insert into medInq values (" +
		 * usernum + ",'" + vo.getDisease1() + "', '" + vo.getDisease2() + "','" +
		 * vo.getDiseasehist() + "','" + vo.getDiseaseetc() + "','" + vo.getSmoke() +
		 * "','" + vo.getAlcohol() + "','" + vo.getAllergy() + "','" +
		 * vo.getAllergyetc() + "','" + vo.getPregnancy() + "','" + vo.getSymptom() +
		 * "', sysdate)");
		 */
		//service.addMedinq(vo);
		

		return "redirect:/";
	}
	@RequestMapping("/medical")
	public String medical() {
		System.out.println("잘 된다!!!");
		return "redirect:https://192.168.0.28/webcam/main";
	}
//	@GetMapping(value = "/medInqSave")
//	public ModelAndView medInqSave(int mednum, Model m) {
//		System.out.println("num => "+mednum);
//		System.out.println("----- medInqDetail controll-----");
//		MedInqVO vo = service.getMIDetail(mednum);
//		List<String> disease1 = new ArrayList<>();
//		for(String e : vo.getDisease1().split("/")) {
//			disease1.add(e);
//		}
//		ModelAndView mav = new ModelAndView("medInq/medInqDetail");
//		mav.addObject("vo", vo);
//		mav.addObject("disease1",disease1);
//		return mav;
//	}

	@GetMapping(value = "/medInqDetail")
	public String medInqDetail(int mednum, Model m) {
		System.out.println("num => " + mednum);
		System.out.println("----- medInqDetail controll-----");
		MedInqVO vo = service.getMIDetail(mednum);
		List<String> disease1 = new ArrayList<>();
		for (String e : vo.getDisease1().split("/")) {
			disease1.add(e);
		}
		m.addAttribute("vo", vo);
		m.addAttribute("disease1", disease1);
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
	/*
	 * @RequestMapping(value = "/addMedinq") public String addMedinq(MedInqVO vo) {
	 * service.addMedinq(vo); return "redirect:/"; }
	 */

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
