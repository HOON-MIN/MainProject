package com.main.ateam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping(value= {"/","/main"})
	public String defaultIndex() {
		
		return "main/index";
	}
}
