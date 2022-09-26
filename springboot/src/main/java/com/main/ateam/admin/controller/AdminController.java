package com.main.ateam.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.ateam.admin.service.AdminService;
import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private HospitalService hospitalService;


	@RequestMapping(value = "/adminMypage")
	public String adminMypage(Model m) {
		return "mypage/ad_mypage";
	}
	@RequestMapping(value = "/memberList")
	public String memberList() {
		return "mypage/ad_member_list";
	}
	
//	관리자 페이지 - 전국 병원 목록 (django jsonp)
	@RequestMapping(value = "/adminHospTotalList")
	public String adminHospTotalList(Model m) {
		return "mypage/ad_hospital_totalList";
	}
	@GetMapping(value = "/adminChart1")
	public String adminChart1() {
		
		return "mypage/ad_chart1";
	}
// 	ㄴ> 전국 병원 목록에서 진료과목 별 비율 차트 
	@RequestMapping(value = "/adminTotalChart")
	public String adminTotalChart() {
		return "mypage/ad_hospital_totalListChart";
	}
	
	
//	관리자 페이지 - 우리 사이트에 등록한 병원 업체 목록 
	@RequestMapping(value = "/adminHospRegistList")
	public String adminHospRegistList(Model m) {
		List<HospitalVO> vo = adminService.ad_hospitalList();
		m.addAttribute("list", vo);
		return "mypage/ad_hospital_list";
	}
// 	ㄴ> 전국 병원 목록에서 진료과목 별 비율 차트 
	@RequestMapping(value = "/adminRegistChart")
	public String adminRegistChart() {
		return "mypage/ad_hospital_totalListChart";
	}
	
	
//	업체 등록 대기 중인 업체 리스트 : 가입 승인 기능 
	@RequestMapping(value = "/waitingList")
	public String waitingList(Model m) {
		List<HospitalVO> list = adminService.waitingList();
		m.addAttribute("list", list);
		return "mypage/ad_waitingList";
	}
//	가입 승인 버튼 -> 가입 완료 처리 company cstatus=1 업뎃
	@ResponseBody
	@PostMapping(value = "/agree")
	public int agree(int num) {
//		ModelAndView mav = new ModelAndView("redirect:waitingList");
		adminService.agree(num);
		int res=num;
		System.out.println("변경완료");
		return res;
	}
	//-- 등록된 병원 과별 이용 횟수!
	@ResponseBody
	@GetMapping(value = "/adminBarchart")
	public List<HospitalVO> adminBarchart(){
		List<HospitalVO> vo = adminService.adminBarchart();
		
		return vo;
	}
	@ResponseBody
	@GetMapping(value = "/adminBarchart2")
	public List<DoctorVO> adminBarchart2(String hcate){
		List<DoctorVO> vo = adminService.adminBarchart2(hcate);
		System.out.println("실행됨");
		return vo;
	}
	
	
	
	
	
}
