package com.main.ateam.pharmacy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.main.ateam.pharmacy.service.ShopService;
import com.main.ateam.vo.PharmacyVO;


@RestController
public class PharmacyRestController {
	
	@Autowired
	private ShopService shopservice;
	

	@PostMapping("citypharmacy")
	public List<com.main.ateam.vo.PharmacyVO> ShopDetail() {
		List<PharmacyVO> shopDetail = shopservice.getAndroid();
		return shopDetail;
	}
	@GetMapping(value = "vald")
	public String getAnd() {
		List<PharmacyVO> list = shopservice.getAndroid();
		return "Hallo";
	}
	
	@GetMapping(value = "citypharmacy")
	@ResponseBody
	public List<PharmacyVO> getPharmacy(String address) {
		Map<String, String> map = new HashMap<>();
		map.put("address", address);
		List<PharmacyVO> list = shopservice.getPharmacy(map);
		return list;
	}
	
	@GetMapping(value = "getshoppharmacy")
	@ResponseBody
	public List<PharmacyVO> getShopPharmacy(String name) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		List<PharmacyVO> list = shopservice.getShopPharmacy(map);
		return list;
	}
	

}
