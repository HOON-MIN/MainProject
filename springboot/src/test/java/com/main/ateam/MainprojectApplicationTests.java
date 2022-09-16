package com.main.ateam;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.main.ateam.doctor.service.DoctorService;
import com.main.ateam.member.service.MemberService;
import com.main.ateam.vo.DoctorVO;
import com.main.ateam.vo.MemberVO;

@RunWith(SpringRunner.class)
@SpringBootTest()
class MainprojectApplicationTests {
	@Autowired
	private SqlSessionFactory ss;
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DoctorService doctorService;
	
	@Test
	public void testSelect() {
		System.out.println(doctorService.hospitalDoctorList());
		List<DoctorVO> dlist = doctorService.hospitalDoctorList();
		for (DoctorVO e : dlist) {
			System.out.println(e.getDname()+":"+e.getDmajor());
		}
	}

}
