package com.main.ateam.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.admin.service.AdminService;
import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.HospitalVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private HospitalDao dao;
	 
	
	
	@RequestMapping(value = "/memberList")
	public String memberList() {
		return "mypage/ad_member_list";
	}
	@RequestMapping(value = "/ad_hospital_totalList")
	public String hospitalList1(Model m) {
		
		return "mypage/ad_hospital_totalList";
	}
	@RequestMapping(value = "/hospitalList")
	public String hospitalList2(Model m) {
		List<HospitalVO> vo = adminService.ad_hospitalList();
		m.addAttribute("list", vo);
		return "mypage/ad_hospital_list";
	}
	@RequestMapping(value = "/adminMypage")
	public String adminMypage(Model m) {
		
		return "mypage/ad_mypage";
	}
	@RequestMapping(value = "/waitingList")
	public String waitingList(Model m) {
		List<CompanyVO> list = adminService.waitingList();
		m.addAttribute("list", list);
		return "mypage/ad_waitingList";
	}
	@ResponseBody
	@PostMapping(value = "/agree")
	public int agree(int num) {
//		ModelAndView mav = new ModelAndView("redirect:waitingList");
		adminService.agree(num);
		int res=num;
		System.out.println("변경완료");
		return res;
	}
	
	@RequestMapping(value = "/admincon")
	public String admincon() {
		return "mypage/ad_hospital_totalListChart";
	}
	
	
	
	
	
	
}
