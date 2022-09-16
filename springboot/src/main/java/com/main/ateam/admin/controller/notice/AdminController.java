package com.main.ateam.admin.controller.notice;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.admin.service.NoticeService;
import com.main.ateam.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class AdminController {
	@Autowired
	private NoticeService noticeService;
	
	
	
}
