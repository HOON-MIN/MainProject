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
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.FileVO;
import com.main.ateam.vo.MemberVO;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	@GetMapping("/memberLoginForm")
	public String MemberLoginForm() {
		
		return "member/member_login_form";
	}

	// 회원 로그인
	@PostMapping("/memberLogin")
	public ModelAndView MemberLogin(HttpSession session, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/member");
		Map<String, String> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("pwd", vo.getPwd());
		System.out.println("id = " + vo.getId());
		System.out.println("pwd = " + vo.getPwd());
		MemberVO dto = memberService.memberLogin(map);

		if (dto == null) {
			mav.setViewName("error/paramException");
			mav.addObject("emsg", "로그인 실패 입니다.");
		} else {
			System.out.println("로그인했다");
			session.setAttribute("sessionID", dto.getId());
			session.setAttribute("sessionNUM", dto.getNum());
			session.setAttribute("sessionNAME", dto.getName());

		}
		return mav;
	}
	@GetMapping(value = "/tt")
	public String test() {
		return "member/test";
	}
	// 로그 아웃
	@GetMapping(value = "/memberLogout")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionNUM");
		System.out.println("로그아웃성공");
		return "redirect:/member";
	}

	// 로그인 테스트
	@GetMapping(value = "/test")
	public String test(HttpSession session, MemberVO vo) {
		String id = "";
		id = (String) session.getAttribute("sessionID");
		System.out.println(id + "님 로그인 중");
		return "redirect:/member";
	}

	// 회원 마이페이지
	@GetMapping(value = "/memberMypage")
	public String memberMypage(Model m, HttpSession session) {
		int num = 0;
		//num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(1);
		m.addAttribute("member", vo);
		return "member/member_mypage";
	}

	// 수정하기 폼으로
	@GetMapping(value = "/updateMypageForm")
	public String updateMypage(Model m,HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(1);
		m.addAttribute("member", vo);
		return "member/updateMypage";
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
		
		String path = "resources/upload/";
		vo.setNum(1);
		vo.setProfimg(oriFn);
		File f = new File(path);
		try {
			v.getFileOriName().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		memberService.memberUpdate(vo);
		return "redirect:/member";
	}
	
	@ResponseBody
	@GetMapping("/memberlist")
	public List<MemberVO> memberList(){
		List<MemberVO> mlist = memberService.memberList();
		return mlist;
	}
	
}