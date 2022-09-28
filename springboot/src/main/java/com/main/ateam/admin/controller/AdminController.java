package com.main.ateam.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	int nowPage = 1; // 현재 페이지 값
	int nowBlock = 1; // 현재 블럭
	int totalRecord = 0; // 총 게시물 수
	int numPerPage = 10; // 한페이지당 보여질 게시물 수
	int pagePerBlock = 5; // 한 블럭 당 보여질 게시물 수
	int totalPage = 0; // 전체 페이지 수 => totalRecord/numPerPage
	int beginPerPage = 0; // 각 페이지 별 시작 게시물의 index 값
	int endPerPage = 0; // 각 페이지 별 마지막 게시물의 index값
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
	public String adminHospRegistList(Model m, @RequestParam(defaultValue = "1") int aPage) {
		totalRecord = adminService.ad_hospitalList_totalCount();
		// System.out.println(totalRecord);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));
		if (aPage != 0) {
			nowPage = aPage;
		}

		m.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		// System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		// System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		m.addAttribute("startPage", startPage);
		// System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		// System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		m.addAttribute("endPage", endPage);
		m.addAttribute("totalPage", totalPage);

		Map<String, Integer> map = new HashMap<>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);

		List<HospitalVO> vo = adminService.ad_hospitalList(map);

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
		int res = num;
		System.out.println("변경완료");
		return res;
	}

	// -- 등록된 병원 과별 이용 횟수!
	@ResponseBody
	@GetMapping(value = "/adminBarchart")
	public List<HospitalVO> adminBarchart() {
		List<HospitalVO> vo = adminService.adminBarchart();

		return vo;
	}

	@ResponseBody
	@GetMapping(value = "/adminBarchart2")
	public List<DoctorVO> adminBarchart2(String hcate) {
		List<DoctorVO> vo = adminService.adminBarchart2(hcate);
		System.out.println("실행됨");
		return vo;
	}

}
