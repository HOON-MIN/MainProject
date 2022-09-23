package com.main.ateam.hospital.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hospitalP")
public class HospitalDashboardController {
	
	@RequestMapping("/dashboard")
	public String dashboard(String name){
		return "mypage/dashboard";
	}
}
