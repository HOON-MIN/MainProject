package com.main.ateam.admin.controller.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.vo.NoticeVO;

@Controller
@RequestMapping("/admin")
public class AdminmainController {

	@RequestMapping(value= {"/adminIndex"})
	public String defaultIndex() {
		return "admin/adminMain";
	}
	
}
