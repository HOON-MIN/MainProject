package com.main.ateam.doctor.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;
import com.main.ateam.vo.SearchVO;
@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {
	
//	private int nowPage = 1; // 현재 페이지 값 //**
//	private int nowBlock = 1; // 현재 블럭
//	private int totalRecord = 0; // 총 게시물 수
//	private int numPerPage = 6; // 한페이지당 보여질 게시물 수
//	private int pagePerBlock = 5; //한 블럭당 보여질 페이지 수 //**
//	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
//	private int totalBlock =0; // 전체 블럭 수
//	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
//	private int endPerPage =0; // 각 페이지별 마지막 게시물의 index값

	
	 private  int nowPage = 1;
	 private  int nowBlock = 1;
	 private  int totalRecord = 0; 
	 private  int numPerPage = 6;
	 private  int pagePerBlock = 5;
	 private  int totalPage = 0;
	 private  int totalBlock = 0;
	 private  int beginPerPage = 0;
	 private  int endPerPage = 0;
	@Autowired
	private DoctorService doctorservice;
	
	@Autowired
	private HospitalService hospitalService;
	
	@RequestMapping("doctorList")
	public String doctorListPage(SearchVO svo, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("---------- hospControll ----------");
		System.out.println("시작페이지 : "+svo.getBeginPerPage());
		System.out.println("마지막페이지 : "+svo.getEndPerPage());
		System.out.println("검색 : "+svo.getSearch());
		System.out.println("분류 : "+svo.getCategory());
		List<DoctorVO> dcategory = doctorservice.doctorCategorySpring();
		
		totalRecord = doctorservice.doctorCnt(svo);
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage                          );
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		
		if (svo.getSearchreset().equals("1")) {
			System.out.println("cPage hosp 리셋 =>"+ svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}else {
			System.out.println("cPage hosp 페이지 번호 선택시 =>"+svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}
		
		beginPerPage = (nowPage-1)*numPerPage + 1;
		endPerPage = (beginPerPage-1)+numPerPage;
		
		svo.setBeginPerPage(beginPerPage);
		svo.setEndPerPage(endPerPage);
		svo.setCategory(request.getParameter("category"));
		
		System.out.println(request.getParameter("category"));
		List<HospitalVO> dlist = doctorservice.doctorListSpring(svo);
		System.out.println("hospCont => "+dlist.isEmpty());
		

		int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		int endPage = startPage+pagePerBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		

		model.addAttribute("dcategory",dcategory);
		model.addAttribute("dlist", dlist);
		model.addAttribute("category", svo.getCategory());
		model.addAttribute("search", svo.getSearch());
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("totalPage", totalPage);
		
		System.out.println("totalRecord :"+ totalRecord);
		System.out.println("startPage :"+ startPage);
		System.out.println("endPage :"+ endPage);
		System.out.println("nowPage :"+ nowPage);
		System.out.println("pagePerBlock :"+ pagePerBlock);
		System.out.println("totalPage :"+ totalPage);

		System.out.println("----------------------------");
		
		return "doctor/doctorList";
		
	}
	
	@GetMapping("/doctorDetail")
	public String doctorDetailPage(Model model,int dnum) {
		List<DoctorVO> dcategory = doctorservice.doctorCategorySpring();
		DoctorVO vo = doctorservice.doctorDetailSpring(dnum);
		model.addAttribute("dvo", vo);
		model.addAttribute("dcategory",dcategory);
		return "doctor/doctorDetail";
	}
	
	
	@PostMapping("/doctorLogin")
	public ModelAndView doctorLogin(HttpSession session, DoctorVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		Map<String, String> map = new HashMap<>();
		map.put("did", vo.getDid());
		map.put("dpwd", vo.getDpwd());
		DoctorVO dto = doctorservice.doctorLogin(map);
		if(dto == null) {
			System.out.println("로그인 실패");
		}else { 
		System.out.println("로그인 성공");
		session.setAttribute("sessionDID", dto.getDid());
		session.setAttribute("sessionDNUM", dto.getDnum());
		session.setAttribute("sessionDNAME", dto.getDname());
		System.out.println("sessionDnum = " + dto.getDnum());
		
		}
		return mav;	
	}
	
	@RequestMapping(value = "/caldata")
	public String calenderData(Model m, HttpSession session) {
		int dnum = 0;
		dnum = (int) session.getAttribute("sessionDNUM");
		System.out.println("sessionDNUM => " +dnum);
		
		List<ReserveVO> list = doctorservice.doctorReserveList(dnum);
		m.addAttribute("list", list);
		return "reserve/data/calenderdata";
	}
	
	@ResponseBody
	@PostMapping(value = "/idchk")
	public String idchk(String did,String dpwd){
		Map<String, String> map = new HashMap<>();
		map.put("did", did);
		map.put("dpwd",dpwd);
		
		System.out.println("controller id => " + did);
		System.out.println("controller pwd => " + dpwd);
		System.out.println("map =>"+map);
		int cnt = doctorservice.idchk(map);
		System.out.println("doc cnt => " + cnt);
		String res = Integer.toString(cnt);
		System.out.println("doc res => " + res);
		return res; 
	}
	
	
		// 로그 아웃
		@GetMapping(value = "/doctorLogout")
		public String memberLogout(HttpSession session) {
			session.removeAttribute("sessionDID");
			session.removeAttribute("sessionDNUM");
			session.removeAttribute("sessionDNAME");
			System.out.println("로그아웃성공");
			return "redirect:/";
		}
		// 의사 마이페이지
		@GetMapping(value = "/doctorMypage")
		public String doctorMypage(Model m, HttpSession session) {
			int dnum = 0;
			dnum = (int) session.getAttribute("sessionDNUM");
			System.out.println("sessionDNUM => " +dnum);
			
			DoctorVO vo = doctorservice.doctorMypage(dnum);
			
			m.addAttribute("sessiondnum", dnum);
			m.addAttribute("doc", vo);
			return "mypage/doc_mypage";
		}
		
		@ResponseBody
		@GetMapping(value = "/doctorReserveList")
		public List<ReserveVO> doctorReserveList(Model m, HttpSession session) {
			int dnum = 0;
			dnum = (int) session.getAttribute("sessionDNUM");
			System.out.println("sessionDNUM => " +dnum);
			List<ReserveVO> list = doctorservice.doctorReserveList(dnum);
			m.addAttribute("list", list);
			return list;
		}
		
		//--------------------------------------------------------------------------
		
		@ResponseBody
		@GetMapping(value ="/dlist")
		public List<DoctorVO> doctorHopitalList() {
			List<DoctorVO> dlist = doctorservice.hospitalDoctorList();
			return dlist;
		}
		
		@ResponseBody
		@GetMapping(value ="/ddetail")
		public DoctorVO hospitalDoctorDetail(@RequestParam int dnum) {
			DoctorVO ddetail = doctorservice.hospitalDoctorDetail(dnum);
			return ddetail;
		}
		@GetMapping(value = "/joinDoctorForm")
		public ModelAndView joinform(HttpSession session) {
			int cnum = (int)session.getAttribute("sessionCNUM");
			ModelAndView mav = new ModelAndView();
			HospitalVO vo = hospitalService.addDoctor(cnum);
			mav.addObject("vo", vo); // 나중에 로그인할때 hnum값 가지고 와야함 임시로 넣은값
			mav.setViewName("doctor/doctorForm");
			return mav;
		}
		
		@PostMapping(value = "/addDoctor")
		public String addDoctor(DoctorVO dvo,HttpServletRequest request) {
			System.out.println("hnum : "+dvo.getCnum());
			System.out.println("dname : "+dvo.getDname());
			System.out.println("did : "+dvo.getDid());
			System.out.println("dpwd : "+dvo.getDpwd());
			System.out.println("dmajor : "+dvo.getDmajor());
			doctorservice.addDoctorService(dvo);
			return "redirect:/main";
		}
		
		@GetMapping(value = "/drIdCheck")
		public ModelAndView drIdCheck(@RequestParam("did") String did) {
			ModelAndView mav = new ModelAndView("doctor/doctor/drIdCheck");
			Map<String, String> map = new HashMap<String, String>();
			map.put("did",did);
			int cnt = doctorservice.drIdCheckService(map);
			System.out.println("doctor 컨트롤러 did"+did);
			System.out.println("doctor 컨트롤러 cnt=>"+cnt);
			mav.addObject("cnt", cnt);
			return mav;
		}
		
		@ResponseBody
		@GetMapping(value ="/dcategory")
		public List<DoctorVO> hospitalDoctorCategory(@RequestParam String dmajor) {
			List<DoctorVO> dcategory = doctorservice.hospitalDoctorCategory(dmajor);
			return dcategory;
		}
}
