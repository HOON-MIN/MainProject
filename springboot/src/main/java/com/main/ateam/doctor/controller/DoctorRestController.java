package com.main.ateam.doctor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;
import com.main.ateam.vo.SearchVO;

@RestController
public class DoctorRestController {

	 private  int nowPage = 1;
	 private  int nowBlock = 1;
	 private  int totalRecord = 0; 
	 private  int numPerPage = 10;
	 private  int pagePerBlock = 5;
	 private  int totalPage = 0;
	 private  int totalBlock = 0;
	 private  int beginPerPage = 0;
	 private  int endPerPage = 0;
	 
	@Autowired
	private DoctorService doctorservice;
	
	@GetMapping(value = "selecHospitaldoc")
	@ResponseBody
	public List<DoctorVO> selecHospitaldoc(String hos){
		Map<String, String> map = new HashMap<>();
		map.put("hos", hos);
		List<DoctorVO> list = doctorservice.selecHospitaldoc(map);
		return list;
	}
	
	@CrossOrigin
	@ResponseBody
	@GetMapping("doctorListReact")
	public List<HospitalVO> doctorListPage(SearchVO svo, HttpServletRequest request) {
		System.out.println("---------- hospControll ----------");
		System.out.println("시작페이지 : "+svo.getBeginPerPage());
		System.out.println("마지막페이지 : "+svo.getEndPerPage());
		System.out.println("검색 : "+svo.getSearch());
		System.out.println("분류 : "+svo.getCategory());
		
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
		List<HospitalVO> dlist = doctorservice.doctorListReact(svo);
		System.out.println("hospCont => "+dlist.isEmpty());
		

		int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		int endPage = startPage+pagePerBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		

		System.out.println("totalRecord :"+ totalRecord);
		System.out.println("startPage :"+ startPage);
		System.out.println("endPage :"+ endPage);
		System.out.println("nowPage :"+ nowPage);
		System.out.println("pagePerBlock :"+ pagePerBlock);
		System.out.println("totalPage :"+ totalPage);

		System.out.println("----------------------------");
		
		return dlist;
		
	}
	
}
