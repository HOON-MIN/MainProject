package com.main.ateam.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.SearchVO;


@Controller
@RequestMapping(value = "/hospital")
public class HospitalController {

	@Autowired
	private HospitalService service;

	@RequestMapping(value = "/hospitalList")
	public String hospitalList(SearchVO svo, Model m) {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller - hospitalList");
		List<HospitalVO> list = service.getList();
		System.out.println(list);
		for(HospitalVO e : list) {
			System.out.println(e.getHname());
		}
		m.addAttribute("list", list);
		return "hospital/hospitalList";	
	}
	@RequestMapping(value = "/ttList")
	public String ttList(SearchVO svo, Model m) {
		return "hospital/djHospitalList";	
	}

	@GetMapping(value = "/hospitalDetail")
	public String hospitalDetail(int num, Model m) {
		System.out.println("controller - hospitalDetail");
		HospitalVO vo = service.getDetail(num);
		String time = vo.getOtime()+"~"+vo.getCtime();
		System.out.println("hname => "+vo.getHname());
		m.addAttribute("vo", vo);
		m.addAttribute("time", time);
		return "hospital/hospitalDetail";
	}
	//////////////////////////////////////////////////////
	@PostMapping(value = "/joinHospitalForm")
	public ModelAndView joinjoinHospitalForm(CompanyVO cvo, HospitalVO hvo) {
		System.out.println("사업자등록번호"+cvo.getCrn());
		System.out.println("cate구분 :"+cvo.getCcate());
		ModelAndView mav = new ModelAndView();
		String crn = cvo.getCrn();
		String ccate = cvo.getCcate();
		mav.addObject("crn", crn);
		mav.addObject("ccate", ccate);
		mav.setViewName("hospital/hospitalForm");
		return mav;
	}
	
	@PostMapping(value = "/addHospital")
	public String addHospital(CompanyVO cvo, HospitalVO hvo) {
		System.out.println("Crn : "+cvo.getCrn());
		System.out.println("Cpwd : "+cvo.getCpwd());
		System.out.println("Ccate: "+cvo.getCcate());
		System.out.println("hloc : "+hvo.getHloc());
		System.out.println("Hname : "+hvo.getHname());
		System.out.println("Otime : "+hvo.getOtime());
		System.out.println("Ctime : "+hvo.getCtime());
		//service.addHospitalService(cvo, hvo);
		
		return "redirect:/main";
	}
}






















