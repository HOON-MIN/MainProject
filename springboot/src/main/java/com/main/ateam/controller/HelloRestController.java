package com.main.ateam.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.vo.MyProfileDTO;

//import org.springframework.web.bind.annotation.RestController;
//@RestController => jason response와 같다 Json화 해줌
@RestController
public class HelloRestController {

	//@RestController
	// hello로 요청하면 return 값이 json으로 출력 됨
	@GetMapping("/hello")
	public String hell0(String name) {
		MyProfileDTO app = new MyProfileDTO();
		System.out.println(app.getAge());
		return "hello:"+name;
	}
}
