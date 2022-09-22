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
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.main.ateam.pharmacy.service.ShopService;
import com.main.ateam.vo.PharmacyVO;


@RestController
public class PharmacyRestController {
	
	@Autowired
	private ShopService shopservice;
	

	@PostMapping("val")
	public List<com.main.ateam.vo.PharmacyVO> ShopDetail() {
		List<PharmacyVO> shopDetail = shopservice.getAndriod();
		return shopDetail;
	}
	

	
	
}
