package com.main.ateam.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.hospital.service.HospitalService;
import com.main.ateam.vo.HospitalVO;

@RestController
public class HospitalRestController {
		
	
	@Autowired
	private HospitalService service;

	@GetMapping(value = "androidhospital")
	@ResponseBody
	public List<HospitalVO> getHospital(String address) {
		Map<String, String> map = new HashMap<>();
		map.put("address", address);
		List<HospitalVO> list = service.getHospital(map);
		return list;
	}

	@GetMapping(value = "selectHospitalCate")
	@ResponseBody
	public List<HospitalVO> selectHospitalCate() {
		List<HospitalVO> list = service.selectHospitalCate();
		return list;
	}
	
	@GetMapping(value = "selectHospital")
	@ResponseBody
	public List<HospitalVO> selectHospital(String choice){
		Map<String, String> map = new HashMap<>();
		map.put("choice", choice);
		List<HospitalVO> list = service.selectHospital(map);
		return list;
	}
	
	@GetMapping(value = "getSelectHospital")
	@ResponseBody
	public List<HospitalVO> getSelectHospital(String name){
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		List<HospitalVO> list = service.getSelectHospital(map);
		return list;
	}
	
	
}
