package com.main.ateam.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.company.controller.CompanyController;
import com.main.ateam.company.service.CompanyService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.SearchVO;

@Controller
@RequestMapping(value = "/hospital")
public class HospitalController {

	private int nowPage = 1; // 현재 페이지 값 //**
	private int nowBlock = 1; // 현재 블럭
	private int totalRecord = 0; // 총 게시물 수
	private int numPerPage = 10; // 한페이지당 보여질 게시물 수
	private int pagePerBlock = 10; //한 블럭당 보여질 페이지 수 //**
	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
	private int totalBlock =0; // 전체 블럭 수
	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
	private int endPerPage =0; // 각 페이지별 마지막 게시물의 index값
	
	@Autowired
	private HospitalService service;
	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/hospitalList")
	public String hospitalList(SearchVO svo, Model model, 
			HttpServletRequest request) {
		System.out.println("---------- hospControll ----------");
		System.out.println("시작페이지 : "+svo.getBeginPerPage());
		System.out.println("마지막페이지 : "+svo.getEndPerPage());
		System.out.println("검색 : "+svo.getSearch());
		System.out.println("분류 : "+svo.getCategory());
		
		List<HospitalVO> hcate = service.getCate();
//		for(HospitalVO e : hcate) {
//			System.out.println(e.getHcate());
//		}
		totalRecord = service.getCnt(svo);
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		
		if (svo.getSearchreset().equals("1")) {
			System.out.println("cPage hosp 리셋 =>"+ svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}else {
			System.out.println("cPage hosp 페이지 번호 선택시 =>"+svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}
		// begin ~ end  구하는 공식
		beginPerPage = (nowPage-1)*numPerPage + 1;
		endPerPage = (beginPerPage-1)+numPerPage;
		
		svo.setBeginPerPage(beginPerPage);
		svo.setEndPerPage(endPerPage);
		svo.setCategory(request.getParameter("category"));
		
		List<HospitalVO> list = service.getList(svo); // 카테고리에 해당하는 부분만 불러오기
		System.out.println("hospCont => "+list.isEmpty());

		int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		int endPage = startPage+pagePerBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		model.addAttribute("hcate", hcate);
		model.addAttribute("list", list);
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
		return "hospital/hospitalList";
	}

	@GetMapping(value = "/hospitalDetail")
	public String hospitalDetail(int num, Model m) {
		System.out.println("controller - hospitalDetail");
		HospitalVO vo = service.getDetail(num);
		String time = vo.getOtime() + "~" + vo.getCtime();
		System.out.println("hname => " + vo.getHname());
		List<HospitalVO> hcate = service.getCate();
		
		m.addAttribute("hcate", hcate);
		m.addAttribute("vo", vo);
		m.addAttribute("time", time);
		return "hospital/hospitalDetailMap";
	}
	
	@RequestMapping(value = "/ttList")
	public String ttList(SearchVO svo, Model m) {
		return "hospital/djHospitalList";
	}
	
	//////////////////////////////////////////////////////
	@PostMapping(value = "/joinHospitalForm")
	public ModelAndView joinjoinHospitalForm(CompanyVO cvo, HospitalVO hvo) {
		System.out.println("사업자등록번호" + cvo.getCrn());
		System.out.println("cate구분 :" + cvo.getCcate());
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
		System.out.println("Crn : " + cvo.getCrn());
		System.out.println("Cpwd : " + cvo.getCpwd());
		System.out.println("Ccate: " + cvo.getCcate());
		System.out.println("hloc : " + hvo.getHloc());
		System.out.println("Hname : " + hvo.getHname());
		System.out.println("Otime : " + hvo.getOtime());
		System.out.println("Ctime : " + hvo.getCtime());
		System.out.println("Hgrade : "+cvo.getHgrade());
		service.addHospitalService(cvo, hvo);
		return "redirect:/";
	}

//	@RequestMapping(value = "/hospitalListBack")
//	public String hospitalListBack(SearchVO svo, Model m) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("controller - hospitalList");
//		List<HospitalVO> list = service.getList();
//		System.out.println(list);
//		for(HospitalVO e : list) {
//			System.out.println(e.getHname());
//		}
//		m.addAttribute("list", list);
//		return "hospital/hospitalList";
//	}

}
