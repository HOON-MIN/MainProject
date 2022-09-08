package com.main.ateam.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

//@Data
//@NoArgsConstructor  어떠한 변수도 사용하지 않는 기본 생성자를 자동완성 시켜주는 어노테이션
//@AllArgsConstructor 모든 변수를 사용하는 생성자를 자동완성 시켜주는 어노테이션
//@RequiredArgsConstructor 특정 변수만을 활용하는 생성자를 만들때 , 생성자 인자로 추가 하고 싶은 변수에
//@NonNull 위에 선언하면 인자로 결정이 된다.
@Getter
@Setter
public class MyProfileDTO {
	//@Setter
	private int num;
	//@NonNull
	private String name;
	private String email;
	private int age;
	private String nickname;

	
}
