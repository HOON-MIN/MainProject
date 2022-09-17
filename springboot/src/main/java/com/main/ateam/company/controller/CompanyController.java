package com.main.ateam.company.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.company.service.CompanyService;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@RequestMapping(value = "/joinChoice")
	public String joinChoice() {		
		return "company/joinChoice";
	}
	
	@GetMapping(value = "/crncheck")
	public ModelAndView crnChk(@RequestParam("crnv") String crnv) {
		ModelAndView mav = new ModelAndView("company/company/crncheck");
		Map<String, String> map = new HashMap<String, String>();
		map.put("crnv",crnv);
		int cnt = companyService.crnCheckService(map);
		System.out.println("h컨트롤러 crnv"+crnv);
		System.out.println("h컨트롤러 cnt=>"+cnt);
		mav.addObject("cnt", cnt);
		return mav;
	}	
	@RequestMapping(value = "/compInsert")
	public String compInsert() {
		companyService.caInsert();
		return "redirect:/";
	}
}
