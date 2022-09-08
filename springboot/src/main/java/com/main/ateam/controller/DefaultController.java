package com.main.ateam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@GetMapping(value = {"/","/main"})
	public String searchPage() {
		return "main/index";
	}
	@GetMapping(value = "/member")
	public String member_mainPage() {
		return "main/member_main";
	}
	@GetMapping(value = "/hospital")
	public String hospital_mainPage() {
		return "main/hospital_main";
	}
}
