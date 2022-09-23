package com.main.ateam.doctor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;
@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired
	private DoctorService doctorservice;
	
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
		
		}
		return mav;	}
	
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
		public ModelAndView joinform() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("hnum", 1); // 나중에 로그인할때 hnum값 가지고 와야함 임시로 넣은값
			mav.setViewName("doctor/doctorForm");
			return mav;
		}
		
		@PostMapping(value = "/addDoctor")
		public String addDoctor(DoctorVO dvo) {
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
