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
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.reserve.dao.ReserveDao;
import com.main.ateam.reserve.service.ReserveService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.PharmacyVO;
import com.main.ateam.vo.ReserveVO;

@RestController
public class ReserveRestController {
	
	@Autowired
	private ReserveService reserveService;
	
	@GetMapping(value = "getReserveHospital")
	@ResponseBody
	public List<ReserveVO> getReserveHospital(String name) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		List<ReserveVO> list = reserveService.getReserveHospital(map);
		return list;
	}	
}