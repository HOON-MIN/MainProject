package com.main.ateam.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.MemberVO;

@RestController
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = "/memberlist",produces = "application/json;charset=utf-8")
	public Object memberList(){
		List<MemberVO> mlist = memberService.getList();
		List<Map<String,Object>> list2 = new ArrayList<>();
		System.out.println(mlist);
		for (MemberVO e : mlist) {
			Map<String, Object> map = new HashMap<>();
			map.put("num", e.getNum());
			map.put("name", e.getName());
			map.put("tel", e.getTel());
			map.put("ssn", e.getSsn());
			list2.add(map);
		}
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			result = mapper.writeValueAsString(list2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mlist;
	}
}
