package com.main.ateam.quesboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.ateam.ansboard.service.AnsboardService;
import com.main.ateam.quesboard.service.QuesboardService;
import com.main.ateam.vo.AnsboardVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.QuesboardVO;
import com.main.ateam.vo.SearchVO;


@Controller
@RequestMapping(value = "/quesboard")
public class QuesboardController {

	@Autowired
	private QuesboardService service;
	@Autowired
	private AnsboardService ansService;

	private int nowPage = 1; // 현재 페이지 값 //**
	private int nowBlock = 1; // 현재 블럭
	private int totalRecord = 0; // 총 게시물 수
	private int numPerPage = 10; // 한페이지당 보여질 게시물 수
	private int pagePerBlock = 5; //한 블럭당 보여질 페이지 수 //**
	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
	private int totalBlock =0; // 전체 블럭 수
	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
	private int endPerPage =0; // 각 페이지별 마지막 게시물의 index값
	
	
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
		return "redirect:qbList";
	}

	@RequestMapping(value = "/qbList")
	public String qbList(SearchVO svo, Model m, 
			HttpServletRequest request) {
		System.out.println("---------- qbList 컨트롤러 ----------");
		System.out.println("시작페이지 : "+svo.getBeginPerPage());
		System.out.println("마지막페이지 : "+svo.getEndPerPage());
		System.out.println("검색 : "+svo.getSearch());
		System.out.println("분류 : "+svo.getCategory());
		
		List<QuesboardVO> qcate = service.getCate();
		for(QuesboardVO e : qcate) {
			System.out.println(e.getQcate());
		}
		
		totalRecord = service.getCnt(svo);
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		
		if (svo.getSearchreset().equals("1")) {
			System.out.println("cPage qbList 리셋 =>"+ svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}else {
			System.out.println("cPage qbList 페이지 번호 선택시 =>"+svo.getcPage());
			nowPage = Integer.parseInt(svo.getcPage());
		}
		// begin ~ end  구하는 공식
		beginPerPage = (nowPage-1)*numPerPage + 1;
		endPerPage = (beginPerPage-1)+numPerPage;
		
		svo.setBeginPerPage(beginPerPage);
		svo.setEndPerPage(endPerPage);
		svo.setCategory(request.getParameter("category"));
		
		List<QuesboardVO> list = service.getQBList(svo); // 카테고리에 해당하는 부분만 불러오기
		System.out.println("hospCont => "+list.isEmpty());
		
		int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		int endPage = startPage+pagePerBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		m.addAttribute("list", list);
		m.addAttribute("category", svo.getCategory());
		m.addAttribute("search", svo.getSearch());
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("nowPage", nowPage);
		m.addAttribute("pagePerBlock", pagePerBlock);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("qcate", qcate);
		
		System.out.println("totalRecord :"+ totalRecord);
		System.out.println("startPage :"+ startPage);
		System.out.println("endPage :"+ endPage);
		System.out.println("nowPage :"+ nowPage);
		System.out.println("pagePerBlock :"+ pagePerBlock);
		System.out.println("totalPage :"+ totalPage);

		System.out.println("----------------------------");
		return "quesboard/quesboardList";	
	}
	
	@GetMapping(value = "/qbDetail")
	public String qbDetail(int qnum, Model m) {
		System.out.println("----- qbDetail controll -----");
		QuesboardVO vo = service.getQBDetail(qnum);
		System.out.println("qnum => "+qnum);
		service.upQBHit(vo);
//		System.out.println(vo.getQtitle());
		List<AnsboardVO> ansList = ansService.getABList(qnum);
//		System.out.println("ansService success");
		m.addAttribute("vo", vo);
		m.addAttribute("ansList", ansList);
		return "quesboard/quesboardDetail";
	}
	
	@RequestMapping(value = "/qbUpdateForm")
	public String qbUpdateForm(int num, Model m) {
		QuesboardVO vo = service.getQBDetail(num);
		m.addAttribute("vo", vo);
		return "quesboard/quesboardUpdateForm";
	}
	
	@PostMapping(value = "/qbUpdate")
	public String qbUpdate(QuesboardVO vo) {
		System.out.println("=====qbUpdate controll=====");
		System.out.println(vo.toString());
		service.qbUpdate(vo);
		System.out.println("==========================");
		return "redirect:qbList";
	}
	
	@PostMapping(value = "/qbDelete")
	public String qbDelete(int qnum) {
		service.qbDelete(qnum);
		return "redirect:qbList";
	}
	@ResponseBody
	@GetMapping(value = "/test")
	public String test(String chk,String chk1) {
		String res = chk1;
		System.out.println("test res => "+res);
		return res;
	}
	
	
	
	

}
