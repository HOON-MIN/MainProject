package com.main.ateam.reserve.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.reserve.service.ReserveService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;

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
	

	/*
	 * @GetMapping(value = "/choice_doctor") public String choice_doctor(int
	 * cnum,Model m) { System.out.println("의사고르기 = > " + cnum); List<DoctorVO>list =
	 * service.hospitalDoctorList(cnum); m.addAttribute("list", list); return
	 * "reserve/choice_doctor"; }
	 */
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated catch block
		vo.setRdate(d);
		System.out.println("reserve - insert Test(시간)" + vo.getRdate());
		System.out.println("reserve - insert Test(시간)" + vo.getRtime());
		System.out.println("reserve - insert Test(시간)" + vo.getRdate().getClass().getName());
		System.out.println("reserve - insert Test(시간)" + vo.getRtime().getClass().getName());
		reserveService.addReserve(vo);
		return "redirect:/";
	}
	//의사 리스트 
	@GetMapping(value = "/choice_doctor")
	public String choiceDoctorList(int cnum, Model m) {
			System.out.println("choice_doctor = cnum => " + cnum);
			List<DoctorVO> vo = service.choiceDoctorList(cnum); //의사 리스트
			m.addAttribute("vo", vo);
			for(DoctorVO e: vo) {
				System.out.println(e);
			}
		return "reserve/choice_doctor"; //
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
	
	
	/*
	 * @RequestMapping(value = "doctorCalendar", method = RequestMethod.GET) public
	 * String calendar(Model model, HttpServletRequest request, DateDataVO
	 * DateDataVO,int dnum){ model.addAttribute("dnum", dnum); Calendar cal =
	 * Calendar.getInstance(); DateDataVO calendarData;
	 * if(DateDataVO.getDate().equals("")&&DateDataVO.getMonth().equals("")){
	 * DateDataVO = new
	 * DateDataVO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(
	 * Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null); }
	 * 
	 * Map<String, Integer> today_info = DateDataVO.today_info(DateDataVO);
	 * List<DateDataVO> dateList = new ArrayList<DateDataVO>();
	 * 
	 * for(int i=1; i<today_info.get("start"); i++){ calendarData= new
	 * DateDataVO(null, null, null, null); dateList.add(calendarData); }
	 * 
	 * for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++)
	 * { if(i==today_info.get("today")){ calendarData= new
	 * DateDataVO(String.valueOf(DateDataVO.getYear()),
	 * String.valueOf(DateDataVO.getMonth()), String.valueOf(i), "today"); }else{
	 * calendarData= new DateDataVO(String.valueOf(DateDataVO.getYear()),
	 * String.valueOf(DateDataVO.getMonth()), String.valueOf(i), "normal_date"); }
	 * dateList.add(calendarData); }
	 * 
	 * int index = 7-dateList.size()%7;
	 * 
	 * if(dateList.size()%7!=0){
	 * 
	 * for (int i = 0; i < index; i++) { calendarData= new DateDataVO(null, null,
	 * null, null); dateList.add(calendarData); } } System.out.println(dateList);
	 * 
	 * model.addAttribute("dateList", dateList); model.addAttribute("today_info",
	 * today_info); return "reserve/doctorCalendar"; }
	 * 
	 * @PostMapping(value = "/getCalendar") public String getResday(Model model,
	 * String resday,HttpSession session,int dnum) { int num =
	 * (int)session.getAttribute("sessionNUM"); System.out.println("int num = > " +
	 * num); MemberVO mvo = memberService.memberMyPage(num); DoctorVO dvo =
	 * reserveService.choiceDoctor(dnum); model.addAttribute("resday",resday);
	 * model.addAttribute("mvo",mvo); model.addAttribute("dvo",dvo);
	 * 
	 * return "reserve/reservation"; }
	 */
	
	
}