
package com.main.ateam.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.member.memberEtc.memberInfoModule;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.modules.APILoginModule;
import com.main.ateam.modules.Base64Module;
import com.main.ateam.modules.GsonModule;
import com.main.ateam.modules.UbuntuShellModule;
import com.main.ateam.vo.CovidRecordVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.FileVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.OAuthToken;
import com.main.ateam.vo.PrescriptionVO;
import com.main.ateam.vo.SearchVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private memberInfoModule memberInfoModule;
	@Autowired
	private MemberService memberService;

	/* 0918 add: 이동환 Autowired 추가 */
	@Autowired
	private APILoginModule apiloginmodule;
	@Autowired
	private Base64Module base64module;
	@Autowired
	private UbuntuShellModule ubuntushellmodule;
	@Autowired
	private GsonModule gsonmodule;
	@Autowired
	private HospitalService service;
	@Autowired
	private DoctorService doctorService;

	/* 0918 add: 이동환 @Values 추가 */
	@Value("${uploadPath}")
	private String uploadPath;
	@Value("${pythonPath}")
	private String pythonPath;
	
	private int nowPage = 1; // 현재 페이지 값 //**
	private int nowBlock = 1; // 현재 블럭
	private int totalRecord = 0; // 총 게시물 수
	private int numPerPage = 8; // 한페이지당 보여질 게시물 수
	private int pagePerBlock = 5; //한 블럭당 보여질 페이지 수 //**
	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
	private int totalBlock =0; // 전체 블럭 수
	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
	private int endPerPage =0; // 각 페이지별 마지막 게시물의 index값
	
	
	@GetMapping("/memberLoginForm")
	public String MemberLoginForm() {
		return "member/login_form";
	}

	// 회원 로그인
	@PostMapping("/memberLogin")
	public ModelAndView MemberLogin(HttpSession session, MemberVO vo,String oid) {
		ModelAndView mav = new ModelAndView("redirect:/");
		Map<String, String> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("pwd", vo.getPwd());
		System.out.println("id = " + vo.getId());
		System.out.println("pwd = " + vo.getPwd());
		MemberVO dto = memberService.memberLogin(map);
		if (dto == null) {
			System.out.println("로그인 실패");
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("sessionID", dto.getId());
			session.setAttribute("sessionNUM", dto.getNum());
			session.setAttribute("sessionNAME", dto.getName());
			session.setAttribute("sessionProfimg", dto.getProfimg());
			System.out.println("프로필이름 :" +dto.getProfimg());
			session.setAttribute("oid", oid);
		}
		return mav;
	}

	@ResponseBody
	@PostMapping("loginReact")
	public MemberVO loginReact(@RequestBody String id, String pwd) {
		Map<String, String> map = new HashMap<>();
		char quotes = '"';
		String[] res = id.split(":|" + quotes + "|,");
		for (String e : res) {
			System.out.println(e);
		}
		System.out.println("id: " + res[4] + "pwd : " + res[10]);
		// String resId = res[0].substring(res[0].length(), res[0].length()-1);

		map.put("id", res[4]);
		map.put("pwd", res[10]);

		return memberService.memberLogin(map);
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
	public String idchk(String id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);

		System.out.println("controller id => " + id);
		System.out.println("controller pwd => " + pwd);
		System.out.println("map =>" + map);
		int cnt = memberService.idchk(map);
		System.out.println("mem cnt => " + cnt);
		String res = Integer.toString(cnt);
		System.out.println("mem res => " + res);
		return res;
	}

	// 로그인 테스트
	@GetMapping(value = "/test")
	public String test2() {

		return "mypage/ad_chart1";
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

	// 회원 마이페이지 - 예약목록
	@GetMapping(value = "/memberMypage_list")
	public String memberMypage_list( HttpSession session ,SearchVO svo, Model model, 
			HttpServletRequest request ) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		System.out.println("sessionNum=>" + num);
		 
				totalRecord =  memberService.getReserveCnt(num);
				System.out.println("totalRecord "+ totalRecord);
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
				svo.setMem_no(num);
				svo.setBeginPerPage(beginPerPage);
				svo.setEndPerPage(endPerPage);
				svo.setCategory(request.getParameter("category"));
				
				System.out.println("---------- hospControll ----------");
				System.out.println("시작페이지 : "+svo.getBeginPerPage());
				System.out.println("마지막페이지 : "+svo.getEndPerPage());
				System.out.println("검색 : "+svo.getSearch());
				System.out.println("분류 : "+svo.getCategory());
				List<HospitalVO> vo = memberService.memberReserveList(svo);
				 model.addAttribute("num",num);
				 model.addAttribute("vo", vo);

				int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
				int endPage = startPage+pagePerBlock-1;
				if(endPage > totalPage) {
					endPage = totalPage;
				}
				
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
		 
		 
		 
		return "mypage/member_mypage_reserveList";
	}

	// 회원 마이페이지 - 예약목록 - 디테일
	@ResponseBody
	@GetMapping(value = "/memberMypage_list_Detail")
	public MemberVO memberMypage_listDetail(HttpSession session, int num) {
		int mnum = 0;
		mnum = (int) session.getAttribute("sessionNUM");
		Map<String, Integer> map = new HashMap<>();
		map.put("num", mnum);
		map.put("reservNum", num);
		System.out.println("num = " + mnum);
		System.out.println("reservNum = " + num);
		MemberVO vo = memberService.memberReserveDetail(map);

		return vo;
	}

	// 수정하기 폼으로
	@GetMapping(value = "/updateMypageForm")
	public String updateMypage(Model m, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		MemberVO vo = memberService.memberMyPage(num);
		m.addAttribute("member", vo);
		return "mypage/updateMypage";
	}

	@RequestMapping(value = "/updateMypage", method = RequestMethod.POST)
	public String fileupLoad(FileVO v, HttpServletRequest request, MemberVO vo, HttpSession session) {
		int num = 0;
		num = (int) session.getAttribute("sessionNUM");
		String img_path = "imgfile";
		System.out.println("img_path :" + img_path);
		String r_path = request.getRealPath("/");
		System.out.println("r_path :" + r_path);
		String oriFn = v.getFileOriName().getOriginalFilename();
		System.out.println("oriFn : " + oriFn);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		vo.setNum(num);
		vo.setProfimg(oriFn);
		File f = new File(path.toString());
		System.out.println("파일 위치" + f.getPath());
		try {
			v.getFileOriName().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		memberService.memberUpdate(vo);

		return "redirect:memberMypage";
	}

	@ResponseBody
	@GetMapping("/memberlist")
	public List<MemberVO> memberList() {
		List<MemberVO> mlist = memberService.memberList();
		return mlist;
	}

	@GetMapping(value = "/joinForm")
	public ModelAndView joinform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberForm");
		return mav;
	}

	@PostMapping(value = "/addMember")
	public String addMember(MemberVO mvo, HttpServletRequest request) {
		System.out.println("주민번호 : " + mvo.getSsn());
		System.out.println("pwd : " + mvo.getPwd());
		System.out.println("id : " + mvo.getId());
		System.out.println("email : " + mvo.getEmail());
		System.out.println("전화번호 : " + mvo.getTel());
		System.out.println("이름 : " + mvo.getName());

		int age = memberInfoModule.getAge(mvo.getSsn());
		String gender = memberInfoModule.getGender(mvo.getSsn());
		System.out.println("gender !!! " + gender);
		mvo.setAge(age);
		mvo.setGender(gender);
		System.out.println("gender 2 " + mvo.getGender());
		// request를 가지고 이미지의 경로를 받아서 출력
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");
		System.out.println("r_path : " + r_path);
		String oriFn = mvo.getMfile().getOriginalFilename();
		// 이미지의 사이즈 및 contentType확인
		long size = mvo.getMfile().getSize();
		String contentType = mvo.getMfile().getContentType();
		System.out.println("파일 크기 : " + size);
		System.out.println("파일 타입 : " + contentType);
		System.out.println("oriFn : " + oriFn);
		StringBuffer path = new StringBuffer();
		path.append(oriFn);
		System.out.println("Fullpath : " + path);
		// 추상경로(이미지를 저장할 경로) File 객체로 생성
		File f = new File(path.toString());
		try {
			mvo.getMfile().transferTo(f);
			mvo.setProfimg(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		memberService.addMemberService(mvo);
		return "redirect:/main";
	}

	@CrossOrigin
	@ResponseBody
	@PostMapping(value = "/addMemberReact")
	public String addMemberReact(@RequestParam MemberVO mvo, HttpServletRequest request) {
		System.out.println("주민번호 : " + mvo.getSsn());
		System.out.println("id : " + mvo.getId());
		System.out.println("email : " + mvo.getEmail());
		System.out.println("전화번호 : " + mvo.getTel());

		int age = memberInfoModule.getAge(mvo.getSsn());
		String gender = memberInfoModule.getGender(mvo.getSsn());
		mvo.setAge(age);
		mvo.setGender(gender);
		// request를 가지고 이미지의 경로를 받아서 출력
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");
		System.out.println("r_path : " + r_path);
		String oriFn = mvo.getMfile().getOriginalFilename();
		// 이미지의 사이즈 및 contentType확인
		long size = mvo.getMfile().getSize();
		String contentType = mvo.getMfile().getContentType();
		System.out.println("파일 크기 : " + size);
		System.out.println("파일 타입 : " + contentType);
		System.out.println("oriFn : " + oriFn);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("Fullpath : " + path);
		// 추상경로(이미지를 저장할 경로) File 객체로 생성
		File f = new File(path.toString());
		try {
			mvo.getMfile().transferTo(f);
			mvo.setProfimg(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		memberService.addMemberService(mvo);
		return "redirect:/main";
	}

	@GetMapping(value = "/idcheck")
	public ModelAndView idCheck(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView("member/member/idcheck");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		int cnt = memberService.idCheckService(map);
		System.out.println("컨트롤러 id" + id);
		System.out.println("컨트롤러 cnt=>" + cnt);
		mav.addObject("cnt", cnt);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	 * 
	 * @ResponseBody // 비동기 응답본문, url이 아닌 String값 자체 반환 public String
	 * mailCheck(String email) { System.out.println("From Ajax Email : " + email);
	 * return mailSendModule.joinEmail(email); }
	 */

	/*-----카카오로그인-----*/
	@GetMapping(value = "/auth/kakao/callback")
	public ModelAndView kakaoCallback(HttpSession session, String code)
			throws JsonMappingException, JsonProcessingException {
		OAuthToken oauthToken = apiloginmodule.getAPIToken("KAKAO", code);
		MemberVO mdto = apiloginmodule.getAPIMember("KAKAO", oauthToken);

		ModelAndView mav = new ModelAndView("redirect:/main");
		System.out.println("KAKAOMEMBER : " + mdto.getId());
		int flag = memberService.kakaoFlag(mdto.getId());
		if (flag == 0) {
			mav.setViewName("member/kakao_addinfo");
			mav.addObject("kakaoData", mdto);
			return mav;
		}
		MemberVO numvo = memberService.memberidlist(mdto.getId());
		
		session.setAttribute("sessionID", mdto.getId());
		session.setAttribute("sessionNUM", numvo.getNum());
		session.setAttribute("sessionNAME", mdto.getName());
		return mav;
	}

	/*-----네이버로그인-----*/
	@RequestMapping(value = "/auth/naver/callback")
	public ModelAndView naverCallback(HttpSession session, @RequestParam String code, @RequestParam String state)
			throws JsonMappingException, JsonProcessingException {
		OAuthToken oauthToken = apiloginmodule.getAPIToken("NAVER", code);
		MemberVO mdto = apiloginmodule.getAPIMember("NAVER", oauthToken);
		ModelAndView mav = new ModelAndView("redirect:/main");
		int flag = memberService.kakaoFlag(mdto.getId());
		if (flag == 0) {
			memberService.kakaoSignup(mdto);
		}
		session.setAttribute("sessionNUM", memberService.memberidlist(mdto.getId()).getNum());
		session.setAttribute("sessionID", mdto.getId());
		session.setAttribute("sessionNAME", mdto.getName());
		return mav;
	}

	/*-----카카오추가정보-----*/
	@PostMapping(value = "kakaoLogin")
	public String kakaoLogin(HttpSession session, MemberVO dtov) {
		dtov.setAge(apiloginmodule.getAge(dtov.getSsn()));
		dtov.setGender(apiloginmodule.getGender(dtov.getSsn()));
		dtov.setAddr("-");
		System.out.println("연산된 아이디:" + dtov.getId());
		System.out.println("연산된 나이: " + dtov.getAge());
		System.out.println("연산된 성별: " + dtov.getGender());
		memberService.kakaoSignup(dtov);
		session.setAttribute("sessionID", dtov.getId());
		session.setAttribute("sessionNUM", memberService.memberidlist(dtov.getId()).getNum());
		session.setAttribute("sessionNAME", dtov.getName());
		return "redirect:/main";
	}

	/* 코로나 음성 자가진단 페이지 */
	@RequestMapping(value = "/COVIDcheck")
	public String covidCheck() {
		return "member/covidRecording";
	}

	/* 우분투서버로 코로나 음성데이터 및 JSON 전송 */
	@PostMapping(value = "/COVIDUpload", produces = "application/json;charset=utf-8")
	public String COVIDUpload(Model model, CovidRecordVO vo, HttpServletRequest request, HttpSession session)
			throws Exception {

		String userID = session.getAttribute("sessionID").toString();

		String filename = userID + ".wav";
		String filepath = Paths.get(System.getProperty("user.dir"), "src/main/resources/static/upload\\audio")
				.toString();

		String jsonname = userID + ".json";
		String jsonpath = Paths.get(System.getProperty("user.dir"), "src/main/resources/static/upload\\json")
				.toString();
		MemberVO uservo = memberService.userdetail(userID);
		//.wav 로컬 파일 초기화
		File wavexist = new File(filepath + "\\" + filename);
		if(wavexist.exists()) {
			if(wavexist.delete()){
    			System.out.println("기존 음성파일 삭제성공.");
    		}else{
    			System.out.println("기존 음성파일 삭제실패.");
    		}
		}else {
			System.out.println("#COVIDWAV : 새로 업도르된 음성데이터");
		}
		System.out.println("#########################################################");
		//.json 로컬 파일 초기화
		File jsonexist = new File(filepath + "\\" + userID+".json");
		if(jsonexist.exists()) {
			if(jsonexist.delete()){
    			System.out.println("기존 JSON파일 삭제성공.");
    		}else{
    			System.out.println("기존 JSON파일 삭제실패.");
    		}
		}else {
			System.out.println("#COVIDJSON : 새로 업도르된 JSON데이터");
		}
			
		System.out.println("JAVAPATH 실행!=>" + filepath);

		// Base64객체를 복호화한 후 파일 저장
		base64module.base64ToMultipart(vo.getBase64str(), filename, filepath);

		// .wav Upload
		ubuntushellmodule.upload(uploadPath, filepath + "\\" + filename);

		// {userID}.json Config
		vo.setAge(uservo.getAge());
		vo.setGender(uservo.getGender());
		vo.setUserid(userID);
		vo.setBase64str(filename);
		gsonmodule.saveGsonFile(vo, jsonpath+"\\"+jsonname);
		
		//JsonFile Upload
		ubuntushellmodule.upload(uploadPath, jsonpath+"\\"+jsonname);
		
		//check_covid19.py Model 실행
		//System.out.println("python "+pythonPath+"check_covid19.py");
		System.out.println("python "+pythonPath+"check_covid19.py "+userID);
		ubuntushellmodule.command("python "+pythonPath+"check_covid19.py "+userID);
		
		return "member/covidResult"; 
	}

	@RequestMapping("/COVIDResult")
	public String covidresult() {
		return "member/covidResult";
		
	}
	/* 처방전 추가 */
	@GetMapping("/selectPlist")
	public String selectPlist(HttpSession session,Model m) {
		int num =0;
		num = (int)session.getAttribute("sessionNUM");
		DoctorVO dvo = doctorService.doctorMypage(38);
		List<PrescriptionVO> prvo = new ArrayList<>();
		List<PrescriptionVO> list =memberService.selectPlist(num);
		for(PrescriptionVO e : list) {
			e.setDnum(38);
			e.setDname("배상원");
			prvo.add(e);
		}
		m.addAttribute("prvo", prvo);
		return "mypage/member_test";
	}
	
	@GetMapping("/selectPone")
	public String selectPone(Model m,int pnum) {
		PrescriptionVO prvo = memberService.selectPone(pnum);
		m.addAttribute("prvo", prvo);
		return "mypage/member_test2";
	}
	// 의사 - 진료
////	@ResponseBody
//	@RequestMapping("/medical")
//	public String medical(int num) {
//		System.out.println("진료 start!!");
//		System.out.println("num = " +num);
//		return "redirect:/";
//	}
	

	@RequestMapping("/miruchart")
	public String miruchart() {
		return "mypage/miruchart1";

	}

}
