package com.main.ateam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.SearchVO;

@Controller
@RequestMapping(value = "/test")
public class chatController {

	@RequestMapping(value = "/chatTest")
	public String chatTest() {
		return "main/main_chat";
	}
	
}
