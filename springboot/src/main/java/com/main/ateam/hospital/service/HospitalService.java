package com.main.ateam.hospital.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.main.ateam.hospital.dao.HospitalDao;
import com.main.ateam.vo.HospitalVO;


@Service
public class HospitalService {

	@Autowired
	private HospitalDao dao;

	public List<HospitalVO> getList() {
		List<HospitalVO> list = dao.getList();
		System.out.println("service => " + list);
		return list;
	}

	public HospitalVO getDetail(int num) {
		HospitalVO vo = dao.getDetail(num);
		System.out.println("service => " + vo);
		return vo;
	}

}
