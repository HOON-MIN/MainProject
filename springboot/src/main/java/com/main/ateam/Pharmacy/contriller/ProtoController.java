package com.test.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.dao.ShopDao;
import com.test.vo.PharmacyVO;

@Controller
public class ProtoController {
	
	public static final String apiKey = "e25c4b4172043e3c3a79ab5dcbceec5cd16ea19e";
	public static final String senderId = "754842644854";
	
	@Autowired
	private ShopDao shopDao;
	
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	
	@GetMapping(value = "/ShopListPage")
	public String ShopListPage(Model model, String cPage, String type, String searchf) {
		Map<String, String> map = new HashMap<>();
		int shopList = 0;
		if (type == "" || searchf == "") {
			shopList = shopDao.getAllShop();
		}
		else {
			map.put(type, type);
			map.put("searchf", searchf);
			shopList = shopDao.searchCount(map);
			}
		model.addAttribute("totalRecord", shopList);
		return "ShopListPage";
	}
	
	@GetMapping(value = "/ShopDetail")
	public String ShopDetail(Model model, int pnum) {
		PharmacyVO shopDetail = shopDao.getDetail(pnum);
		model.addAttribute("shopDetail", shopDetail);
		return "ShopDetail";
	}
	

	
	
}
