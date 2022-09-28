package com.main.ateam.reserve.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.reserve.service.ReserveService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;
import com.main.ateam.vo.SearchVO;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private HospitalService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private DoctorService doctorService;
	
	private int nowPage = 1; // 현재 페이지 값 //**
	private int nowBlock = 1; // 현재 블럭
	private int totalRecord = 0; // 총 게시물 수
	private int numPerPage = 6; // 한페이지당 보여질 게시물 수
	private int pagePerBlock = 5; //한 블럭당 보여질 페이지 수 //**
	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
	private int totalBlock =0; // 전체 블럭 수
	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
	private int endPerPage =0; 
	
	//예약하기 폼
	@GetMapping(value = "/reserveForm")
	public String reserveForm(int dnum,Model m,HttpSession session,String rdate) {
		int num = (int)session.getAttribute("sessionNUM");
		DoctorVO vo = reserveService.choiceDoctor(dnum);
		MemberVO mvo = memberService.memberMyPage(num);
		m.addAttribute("dvo", vo);
		m.addAttribute("mvo", mvo);
		m.addAttribute("rd", rdate);
		return "reserve/reservation";
//		return "reserve/reserveForm";
	}
	//예약페이지 날짜 체크
	@ResponseBody
	@GetMapping(value = "checkDate")
	public List<ReserveVO> checkDate(ReserveVO rvo){
		List<ReserveVO> vo = reserveService.checkDate(rvo);
		return vo;
	}
	
	//의사 리스트 
	@GetMapping(value = "/choice_doctor")
	public String choiceDoctorList(int cnum,SearchVO svo, Model model, 
			HttpServletRequest request) {
			System.out.println("choice_doctor = cnum => " + cnum);
			List<DoctorVO> vo = service.choiceDoctorList(cnum); //의사 리스트
			model.addAttribute("vo", vo);
		
			/////////////////////////////////////////////////////
			System.out.println("---------- hospControll ----------");
			System.out.println("시작페이지 : "+svo.getBeginPerPage());
			System.out.println("마지막페이지 : "+svo.getEndPerPage());
			System.out.println("검색 : "+svo.getSearch());
			System.out.println("분류 : "+svo.getCategory());
			
			totalRecord = reserveService.getDoctorCnt(cnum);
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
			
			int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
			int endPage = startPage+pagePerBlock-1;
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			model.addAttribute("vo", vo);
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
			
		return "reserve/choice_doctor"; //
	}
	//예약 등록
		@PostMapping(value = "/addReserve")
		public String addReserve(ReserveVO vo ,HttpSession session) {
			int num = (int) session.getAttribute("sessionNUM");
			vo.setNum(num);
			String d ="";
			//vo.setRdate(rdate);
			
			System.out.println("reserve - 변환전(시간)" + vo.getRdate());
			
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date formatDate = dtFormat.parse(vo.getRdate());
				d = dtFormat.format(formatDate);
				System.out.println(d);
				System.out.println(d.getClass().getName());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			vo.setRdate(d);
			System.out.println(""+vo.getNum());
			System.out.println(""+vo.getDnum());
			System.out.println(""+vo.getSymptom());
			System.out.println(""+vo.getSymptomComm());
			reserveService.addReserve(vo);
			
			return "redirect:/medInq/medInqForm";
		}
	
	//의사 선택 
	@GetMapping(value = "/doctorCalendar")
	public String doctorCalendar(int dnum,Model m) {
		m.addAttribute("dnum", dnum);
		System.out.println("내가 선택한 의사 - " +dnum);
		return "mypage/doc_mypage2"; //선택 후 이동
	}
	//의사 선택 - 캘린더2
	@ResponseBody
	@GetMapping(value = "/doctorReserveList")
	public List<ReserveVO> doctorReserveList(Model m, int dnum) {
		System.out.println("선택한 의사번호 => " +dnum);
		List<ReserveVO> list = doctorService.doctorReserveList(dnum);
		m.addAttribute("list", list);
		return list;
	}	
	
	
	@CrossOrigin
	@ResponseBody
	@PostMapping(value = "/addReserveReact")
	public void addReserveReact(@RequestBody Map<String,String> map , ReserveVO vo ) {
        int num = Integer.parseInt((String)map.get("num"));
        int dnum = Integer.parseInt((String)map.get("dnum"));
        String symptom = (String)map.get("symptom");
        String symptomComm =  (String)map.get("symptomComm");
        String rdate = (String)map.get("rdate");
        String rtime = (String)map.get("rtime");
        
        vo.setNum(num);
        vo.setDnum(dnum);
        vo.setSymptom(symptom);
        vo.setSymptomComm(symptomComm);
        vo.setRdate(rdate);
        vo.setRtime(rtime);
        
		System.out.println("reserve - insert Test(회원번호)" + vo.getNum());
		System.out.println("reserve - insert Test(의사번호)" + vo.getDnum());
		System.out.println("reserve - insert Test(증상)" + vo.getSymptom());
		System.out.println("reserve - insert Test(증상)" + vo.getSymptomComm());
		System.out.println("reserve - insert Test(시간)" + vo.getRdate());
		System.out.println("reserve - insert Test(시간)" + vo.getRtime());    
		reserveService.addReserve(vo);
	}
}