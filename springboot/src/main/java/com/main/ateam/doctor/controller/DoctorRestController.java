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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.ReserveVO;

@RestController
public class DoctorRestController {

	@Autowired
	private DoctorService doctorservice;
	
	@GetMapping(value = "selecHospitaldoc")
	@ResponseBody
	public List<DoctorVO> selecHospitaldoc(String hos){
		Map<String, String> map = new HashMap<>();
		map.put("hos", hos);
		List<DoctorVO> list = doctorservice.selecHospitaldoc(map);
		return list;
	}
}
