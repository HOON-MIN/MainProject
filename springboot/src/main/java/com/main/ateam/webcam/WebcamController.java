package com.main.ateam.webcam;

import java.util.ArrayList;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/webcam")
public class WebcamController {

	@RequestMapping(value = {"/main"})
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("webcam/webcam");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/pInfo")
	public List<Object> getPInfo(String name){
		List<Object> plist = new ArrayList<>();
		
		return plist;
	}
}
