package com.main.ateam.controller.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.SearchVO;


@Controller
@RequestMapping(value = "/hospital")
public class HospitalController {

	@Autowired
	private HospitalService service;

	private int nowPage = 1;// 
	private int nowBlock = 1;// ���� ��
	private int totalRecord = 0;// �� �Խù� ��
	private int numPerPage = 10;// �� �������� ������ �Խù� ��
	private int pagePerBlock = 5;// �� ���� ������ ������ ��
	private int totalPage = 0;// ��ü ������ �� => totalRecord/numPerPage
	private int totalBlock = 0;// ��ü �� ��
	private int beginPerPage = 0;// �� �������� ���� �Խù��� index��
	private int endPerPage = 0;// �� �������� ������ �Խù��� index��
	
	@RequestMapping(value = "/hospitalList")
	public String hospitalList(SearchVO svo, Model m) {
//		ModelAndView mav = new ModelAndView();
		System.out.println("controller - hospitalList");
//		List<HospitalVO> list = service.getList();
//		System.out.println(list);
//		for(HospitalDTO e : list) {
//			System.out.println(e.getHname());
//		}
//		m.addAttribute("list", list);
		return "hospital/hospitalList";	
	}

	@GetMapping(value = "/hospitalDetail")
	public String hospitalDetail(int num, Model m) {
		System.out.println("controller - hospitalDetail");
		HospitalVO vo = service.getDetail(num);
		String time = vo.getOtime()+"~"+vo.getCtime();
		System.out.println("hname => "+vo.getHname());
		m.addAttribute("vo", vo);
		m.addAttribute("time", time);
		return "hospital/hospitalDetail";
	}
	
	
}






















