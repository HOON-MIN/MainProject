package com.main.ateam.reserve.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.main.ateam.doctor.dao.DoctorDao;
import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.member.dao.MemberDao;
import com.main.ateam.reserve.dao.ReserveDao;
import com.main.ateam.vo.DateDataVO;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveDao reservDao;
	@Autowired
	private HospitalDao service;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private DoctorDao doctorDao;
	
	//예약하기 폼
	@GetMapping(value = "/reserveForm")
	public String reserveForm(int dnum,Model m) {
		DoctorVO vo = reservDao.choiceDoctor(dnum);
		m.addAttribute("vo", vo);
		
		return "reserve/reserveForm";
	}
	//테스트 폼
	@GetMapping(value = "/test")
	public String test() {
		
		return "reserve/Doc_list_Test1";
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
		//vo.setRdate(rdate);
		
		System.out.println("reserve - insert Test(회원번호)" + vo.getNum());
		System.out.println("reserve - insert Test(의사번호)" + vo.getDnum());
		System.out.println("reserve - insert Test(증상)" + vo.getSymptom());
		System.out.println("reserve - insert Test(증상)" + vo.getSymptomComm());
		System.out.println("reserve - insert Test(시간)" + vo.getRdate());
		System.out.println("reserve - insert Test(시간)" + vo.getRtime());
		System.out.println("reserve - insert Test(시간)" + vo.getRdate().getClass().getName());
		System.out.println("reserve - insert Test(시간)" + vo.getRtime().getClass().getName());
		reservDao.addReserve(vo);
		return "redirect:/";
	}
	//의사 선택
	@GetMapping(value = "/choice_doctor")
	public String choiceDoctorList(int cnum, Model m) {
			System.out.println("choice_doctor = cnum => " + cnum);
			List<DoctorVO> vo = service.choiceDoctorList(cnum);
			m.addAttribute("vo", vo);
			for(DoctorVO e: vo) {
				System.out.println(e);
			}
		return "reserve/choice_doctor";
	}
	//의사 선택 -  캘린더
		
		@RequestMapping(value = "doctorCalendar", method = RequestMethod.GET)
		public String calendar(Model model, HttpServletRequest request, DateDataVO DateDataVO,int dnum){
			model.addAttribute("dnum", dnum);
			Calendar cal = Calendar.getInstance();
			DateDataVO calendarData;
			if(DateDataVO.getDate().equals("")&&DateDataVO.getMonth().equals("")){
				DateDataVO = new DateDataVO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
			}

			Map<String, Integer> today_info =  DateDataVO.today_info(DateDataVO);
			List<DateDataVO> dateList = new ArrayList<DateDataVO>();
		
			for(int i=1; i<today_info.get("start"); i++){
				calendarData= new DateDataVO(null, null, null, null);
				dateList.add(calendarData);
			}
			
			for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
				if(i==today_info.get("today")){
					calendarData= new DateDataVO(String.valueOf(DateDataVO.getYear()), String.valueOf(DateDataVO.getMonth()), String.valueOf(i), "today");
				}else{
					calendarData= new DateDataVO(String.valueOf(DateDataVO.getYear()), String.valueOf(DateDataVO.getMonth()), String.valueOf(i), "normal_date");
				}
				dateList.add(calendarData);
			}

			int index = 7-dateList.size()%7;
			
			if(dateList.size()%7!=0){
				
				for (int i = 0; i < index; i++) {
					calendarData= new DateDataVO(null, null, null, null);
					dateList.add(calendarData);
				}
			}
			System.out.println(dateList);
			
			model.addAttribute("dateList", dateList);	
			model.addAttribute("today_info", today_info);
			return "reserve/doctorCalendar";
		}
		
		@PostMapping(value = "/getCalendar")
		public String getResday(Model model, String resday,HttpSession session,int dnum) {
			int num = (int)session.getAttribute("sessionNUM");
			System.out.println("int num = > " + num);
			MemberVO mvo = memberDao.memberMyPage(num);
			DoctorVO dvo = reservDao.choiceDoctor(dnum);
			model.addAttribute("resday",resday);
			model.addAttribute("mvo",mvo);
			model.addAttribute("dvo",dvo);
			
			return "reserve/reservation";
		}
	
	
}