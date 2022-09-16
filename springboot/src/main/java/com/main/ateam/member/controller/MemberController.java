package com.main.ateam.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.FileVO;
import com.main.ateam.vo.MemberVO;

import ch.qos.logback.classic.Logger;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/memberLoginForm")
	public String MemberLoginForm() {
		return "member/login_form";
	}
	
	// 회원 로그인
	@PostMapping("/memberLogin")
	public ModelAndView MemberLogin(HttpSession session, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/");
		Map<String, String> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("pwd", vo.getPwd());
		System.out.println("id = " + vo.getId());
		System.out.println("pwd = " + vo.getPwd());
		MemberVO dto = memberService.memberLogin(map);
		if(dto == null) {
			System.out.println("로그인 실패");
		}else {
		System.out.println("로그인 성공");
		session.setAttribute("sessionID", dto.getId());
		session.setAttribute("sessionNUM", dto.getNum());
		session.setAttribute("sessionNAME", dto.getName());
		}
		return mav;
	}
	
	// 로그 아웃
	@GetMapping(value = "/memberLogout")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionNUM");
		System.out.println("로그아웃성공");
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping(value = "/idchk")
	public String idchk(String id,String pwd){
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd",pwd);
		
		System.out.println("controller id => " + id);
		System.out.println("controller pwd => " + pwd);
		System.out.println("map =>"+map);
		int cnt = memberService.idchk(map);
		System.out.println("mem cnt => " + cnt);
		String res = Integer.toString(cnt);
		System.out.println("mem res => " + res);
		return res; 
	}

	// 로그인 테스트
	@GetMapping(value = "/tt")
	public String test() {
	
		return "member/test/tt";
	}
	// 로그인 테스트
		@PostMapping(value = "/test")
		public String test2(@RequestParam Map<String, Object> param) {
			String len = (String) param.get("len");
			System.out.println("len = > " + len);
			return "mypage/member_mypage";
		}

	// 회원 마이페이지
	@GetMapping(value = "/memberMypage")
	public String memberMypage(Model m, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(num);
		m.addAttribute("member", vo);
		return "mypage/member_mypage";
	}
	// 회원 마이페이지 - 예약목록(지도)
	@GetMapping(value = "/memberMypage_list")
	public String memberMypage_list(Model m, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(num);
		m.addAttribute("member", vo);
		return "mypage/member_mypage_list";
	}

	// 수정하기 폼으로
	@GetMapping(value = "/updateMypageForm")
	public String updateMypage(Model m,HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(num);
		m.addAttribute("member", vo);
		return "mypage/updateMypage";
	}

	@RequestMapping("/updateMypage")
	public String fileupLoad(FileVO v, HttpServletRequest request, MemberVO vo,HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		String img_path = "resources\\upload";
		System.out.println("img_path :" + img_path);
		String r_path = request.getRealPath("/");
		System.out.println("r_path :" + r_path);
		String oriFn = v.getFileOriName().getOriginalFilename();
		System.out.println("oriFn : " + oriFn);
		
		String path = "D:\\iKosmo113\\spring\\bootworkspace\\springboot\\src\\main\\resources\\static\\upload\\"+oriFn;
//		vo.setNum(num);
		vo.setNum(num);
		vo.setProfimg(oriFn);
		File f = new File(path);
		System.out.println(f.getPath());
		try {
			v.getFileOriName().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		memberService.memberUpdate(vo);
		return "mypage/memberMypage";
	}
	
	@ResponseBody
	@GetMapping("/memberlist")
	public List<MemberVO> memberList(){
		List<MemberVO> mlist = memberService.memberList();
		return mlist;
	}
	
}