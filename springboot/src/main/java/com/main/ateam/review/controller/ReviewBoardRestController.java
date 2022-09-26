package com.main.ateam.review.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.review.service.ReviewBoardService;
import com.main.ateam.vo.HospitalVO;
import com.main.ateam.vo.ReviewBoardCommVO;
import com.main.ateam.vo.ReviewBoardVO;
import com.main.ateam.vo.SearchPageVO;


@RestController
public class ReviewBoardRestController {


	@Autowired
	private ReviewBoardService service;
	
	
	@GetMapping(value = "getHospitalReview")
	@ResponseBody
	public List<ReviewBoardVO> getHospitalReview(String name){
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		List<ReviewBoardVO> list = service.getHospitalReview(map);
		return list;
	}
}
