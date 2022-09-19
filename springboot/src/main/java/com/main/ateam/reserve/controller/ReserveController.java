package com.main.ateam.reserve.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.reserve.dao.ReserveDao;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.ReserveVO;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveDao reservDao;
	@Autowired
	private HospitalDao service;
		
	
	//ȸ�� ���� Ȯ�� �� �ش� ȸ���� �Խù� �޾ƿ��� ����¡ ó��
	/*
	 * @RequestMapping(value = "/reservelist") public String
	 * reservelistF(HttpServletRequest request, Model m, @RequestParam(defaultValue
	 * = "1") int cPage) { //session�� ���̵� ȹ�� HttpSession session =
	 * request.getSession(false); String mid = (String)
	 * session.getAttribute("sessionid"); if(mid != null) { ReserveListParaVO lvo =
	 * new ReserveListParaVO(); lvo.setMid(mid); totalRecord =
	 * reserveDaoInter.reservecnt(lvo); //System.out.println(totalRecord); totalPage
	 * = (int) Math.ceil(totalRecord / (double)numPerPage);
	 * 
	 * nowPage = cPage;
	 * 
	 * beginPerPage = (nowPage-1) * numPerPage + 1; endPerPage = (beginPerPage-1) +
	 * numPerPage;
	 * 
	 * lvo.setBegin(beginPerPage); lvo.setEnd(endPerPage);
	 * 
	 * 
	 * List<ReserveVO> list = reserveDaoInter.reservelist(lvo);
	 * 
	 * 
	 * m.addAttribute("rlist", list);
	 * 
	 * int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1; int endPage =
	 * startPage + pagePerBlock -1; if(endPage > totalPage) { endPage = totalPage; }
	 * 
	 * m.addAttribute("startPage", startPage); m.addAttribute("endPage", endPage);
	 * m.addAttribute("nowPage", nowPage); m.addAttribute("pagePerBlock",
	 * pagePerBlock); m.addAttribute("totalPage", totalPage); return
	 * "member/reserve/reserveList"; }else { return "redirect:/member/"; } }
	 */
	
	//예약하기 폼
	@GetMapping(value = "/reserveForm")
	public String reserveForm(int dnum,Model m) {
		DoctorVO vo = reservDao.choiceDoctor(dnum);
		m.addAttribute("vo", vo);
		
		return "reserve/reserveForm";
	}

	/*
	 * @GetMapping(value = "/choice_doctor") public String choice_doctor(int
	 * cnum,Model m) { System.out.println("의사고르기 = > " + cnum); List<DoctorVO>list =
	 * service.hospitalDoctorList(cnum); m.addAttribute("list", list); return
	 * "reserve/choice_doctor"; }
	 */
	//예약 등록
	@PostMapping(value = "/addReserve")
	public String addReserve(ReserveVO vo) {
		System.out.println("reserve - insert Test(증상)" + vo.getSymptom());
		return "redirect:/";
	}
	//의사 고르기전 리스트
	@GetMapping(value = "/choice_doctor")
	public String choiceDoctorList(int cnum, Model m) {
			System.out.println("choice_doctor = cnum => " + cnum);
			List<DoctorVO> vo = service.choiceDoctorList(cnum);
			m.addAttribute("vo", vo);
		return "reserve/choice_doctor";
	}
	
	/*
	 * //���� ���� �󼼺��⿡�� �����ϱ� ��ư�� ������ ������ �޾Ƽ� reserveForm���� ����
	 * 
	 * @RequestMapping(value = "/reservepage") public String reservepageF(Model m,
	 * int rnum, int rprice) { m.addAttribute("rnum", rnum);
	 * m.addAttribute("rprice", rprice); return "member/reserve/reserveForm2"; }
	 * 
	 * @ResponseBody
	 * 
	 * @GetMapping(value = "/cannotreserve") public List<CannotReserveVO>
	 * cannotreservelist(String today, int rnum) { CannotReserveParaVO vo = new
	 * CannotReserveParaVO(); vo.setToday(today); vo.setRnum(rnum);
	 * System.out.println(vo.getToday()); System.out.println(vo.getRnum());
	 * List<CannotReserveVO> list = reserveDaoInter.cannotreserve(vo);
	 * //fullcalender�� event���� ������ ��¥�� ǥ�õǴ� ������ �Ϸ� ������ ǥ�õǾ //���Ƿ�
	 * ������ ��¥�� +1�Ͽ� ������ Calendar cal = Calendar.getInstance();
	 * SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	 * 
	 * for(CannotReserveVO e : list) { Date end2; String end3; try { end2 =
	 * df.parse(e.getEnd()); cal.setTime(end2); cal.add(Calendar.DATE, 1); end3 =
	 * df.format(cal.getTime()); e.setEnd(end3); } catch (ParseException e1) { //
	 * TODO Auto-generated catch block e1.printStackTrace(); } } return list; }
	 * 
	 * @GetMapping(value = "/reservecancel") public String
	 * reservecancel(HttpServletRequest request, Model m, int rvnum) { HttpSession
	 * session = request.getSession(false); String mid = (String)
	 * session.getAttribute("sessionid"); int rvnum2 = rvnum; if(mid != null) {
	 * ReserveDetailParaVO vo = new ReserveDetailParaVO(); vo.setMid(mid);
	 * vo.setRvnum(rvnum2); ReserveVO vo1 = reserveDaoInter.reservedetail(vo);
	 * m.addAttribute("dlist", vo1);
	 * 
	 * return "member/reserve/reserveCancel"; }else { return "redirect:/member/"; }
	 * }
	 * 
	 * @RequestMapping(value = "/reservercancelcom") public String
	 * reservecancelcom(ReserveVO vo) { reserveDaoInter.reservecancel(vo); return
	 * "redirect:/member/"; }
	 */
	
}