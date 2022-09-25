package com.main.ateam.pharmacy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.ateam.pharmacy.service.ShopService;
import com.main.ateam.vo.PharmacyVO;


@Controller
@RequestMapping("/pharmacy")
public class PharmacyController {
	
	@Autowired
	private ShopService shopservice;
	
	@GetMapping(value = "/ShopListPage")
	public String ShopListPage(Model model, String cPage, String type, String searchf) {
		Map<String, String> map = new HashMap<>();
		int shopList = 0;
		if (type == "" || searchf == "") {
			shopList = shopservice.getAllShop();
		}
		else {
			map.put(type, type);
			map.put("searchf", searchf);
			shopList = shopservice.searchCount(map);
			}
		model.addAttribute("totalRecord", shopList);
		return "pharmacy/ShopListPage";
	}
	
	@GetMapping(value = "/ShopDetail")
	public String ShopDetail(Model model, int pnum) {
		PharmacyVO shopDetail = shopservice.ShopDetail(pnum);
		model.addAttribute("shopDetail", shopDetail);
		return "pharmacy/ShopDetail";
	}
	

	
	
}
