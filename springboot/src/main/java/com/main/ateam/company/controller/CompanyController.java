package com.main.ateam.company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.company.service.CompanyService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.CompanyVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private HospitalService service;

	@RequestMapping(value = "/joinChoice")
	public String joinChoice() {
		return "company/joinChoice";
	}
	@RequestMapping(value = "/companyMypage")
	public String companyMypage() {
		return "mypage/comp_mypage";
	}

	@GetMapping(value = "/crncheck")
	public ModelAndView crnChk(@RequestParam("crnv") String crnv) {
		ModelAndView mav = new ModelAndView("company/company/crncheck");
		Map<String, String> map = new HashMap<String, String>();
		map.put("crnv", crnv);
		int cnt = companyService.crnCheckService(map);
		System.out.println("h컨트롤러 crnv" + crnv);
		System.out.println("h컨트롤러 cnt=>" + cnt);
		mav.addObject("cnt", cnt);
		return mav;
	}

	@PostMapping(value = "/crncheck")
	public ModelAndView crnCh(String crnv) {
		ModelAndView mav = new ModelAndView("company/company/crncheck");
		Map<String, String> map = new HashMap<String, String>();
		map.put("crnv", crnv);
		int cnt = companyService.crnCheckService(map);
		System.out.println("h컨트롤러 crnv" + crnv);
		System.out.println("h컨트롤러 cnt=>" + cnt);
		mav.addObject("cnt", cnt);
		return mav;
	}


	// 회원 로그인
	@PostMapping("/companyLogin")
	public ModelAndView CompanyLogin(HttpSession session, CompanyVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/");
		Map<String, String> map = new HashMap<>();
		map.put("crn", vo.getCrn());
		map.put("cpwd", vo.getCpwd());
		System.out.println("id = " + vo.getCrn());
		System.out.println("pwd = " + vo.getCpwd());
		CompanyVO dto = companyService.companyLogin(map);
		if (dto == null) {
			System.out.println("업체 로그인 실패");
		} else {
			System.out.println("업체 로그인 성공");
			System.out.println("getCcate =>"+dto.getCcate());
			session.setAttribute("sessionCRN", dto.getCrn());
			session.setAttribute("sessionCNUM", dto.getCnum());
			session.setAttribute("sessionCNAME", dto.getHvo().getHname());
			session.setAttribute("sessionCCATE", dto.getCcate());
			session.setAttribute("sessionHGRADE", dto.getHgrade());
		}
		return mav;
	}

	@ResponseBody
	@PostMapping(value = "/idchk")
	public String idchk(String crn, String cpwd) {
		Map<String, String> map = new HashMap<>();
		map.put("crn", crn);
		map.put("cpwd", cpwd);

		System.out.println("controller id => " + crn);
		System.out.println("controller pwd => " + cpwd);
		System.out.println("map =>" + map);
		int cnt = companyService.idchk(map);
		System.out.println("mem cnt => " + cnt);
		String res = Integer.toString(cnt);
		System.out.println("mem res => " + res);
		return res;
	}
	
	// 로그 아웃
		@GetMapping(value = "/companyLogout")
		public String memberLogout(HttpSession session) {
			session.removeAttribute("sessionCRN");
			session.removeAttribute("sessionCNUM");
			session.removeAttribute("sessionCCATE");
			session.removeAttribute("sessionCNAME");
			System.out.println("로그아웃성공");
			return "redirect:/";
		}
		// tj 병원에 소속된 의사 목록
		@GetMapping(value = "/hospitalDoctorList")
		public String hospitalDoctorList(HttpSession session, Model m) {
			int cnum = (int)session.getAttribute("sessionCNUM");
			System.out.println("cnum =>"+cnum);
			HospitalVO hoslist = new HospitalVO();
			List<DoctorVO>list = service.hospital_DoctorList(cnum);
			m.addAttribute("list", list);
			return "mypage/comp_doctorList";
		}
	
}
