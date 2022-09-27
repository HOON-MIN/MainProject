package com.main.ateam.member.memberEtc;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component
public class memberInfoModule {
	
    //나이 계산 메서드
    public int getAge(String ssn) {
        System.out.println("나이계산 메서드");
        System.out.println("ssn"+ssn);
    	char ch = ssn.charAt(7);
    	System.out.println("나이 = >" + ch);
        int age = Integer.parseInt(ssn.substring(0,2)); 
        LocalDate now = LocalDate.now();
        int year = now.getYear();

        if(ch=='1' || ch=='2') {age = year-(1900+age)+1;}
        if(ch=='3' || ch=='4') {age = year-(2000+age)+1;}
        return age;
    }
    // 성별 구분 메서드
    public String getGender(String ssn) {
        char ch = ssn.charAt(7);
        String gender = null;
        if(ch=='1' || ch=='3') {gender = "남자";}
        if(ch=='2' || ch=='4') {gender = "여자";}
        return gender;
    }
}
