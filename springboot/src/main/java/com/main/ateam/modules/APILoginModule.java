package com.main.ateam.modules;

import org.springframework.stereotype.Component;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.main.ateam.vo.KakaoProfile;
import com.main.ateam.vo.MemberVO;
import com.main.ateam.vo.NaverProfile;
import com.main.ateam.vo.OAuthToken;

@Component
public class APILoginModule {
	@Value("${kakaoKey}")
	private List<String> kakaoKey;
	@Value("${naverKey}")
	private List<String> naverKey;

	public OAuthToken getAPIToken(String api, String code) throws JsonMappingException, JsonProcessingException {
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		String tokenURL = null;
		System.out.println("KAKAOKEY=>" + kakaoKey.get(0));
		if (api.equals("KAKAO")) {
			params.add("grant_type", kakaoKey.get(0));
			params.add("client_id", kakaoKey.get(1));
			params.add("redirect_uri", kakaoKey.get(2));
			params.add("code", code);
			tokenURL = kakaoKey.get(3);
		} else if (api.equals("NAVER")) {
			params.add("grant_type", naverKey.get(0));
			params.add("client_id", naverKey.get(1));
			params.add("client_secret", naverKey.get(2));
			params.add("code", code);
			params.add("state", naverKey.get(3));
			tokenURL = naverKey.get(4);
		}

		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params, headers);
		ResponseEntity<String> response = rt.exchange(tokenURL, HttpMethod.POST, tokenRequest, String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		System.out.println("API AccessToken:" + oauthToken.getAccess_token());

		return oauthToken;
	}

	// responseURL : kakaoKey.get(4)
	public MemberVO getAPIMember(String api, OAuthToken oauthToken)
			throws JsonMappingException, JsonProcessingException {
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<MultiValueMap<String, String>> profileRequest = new HttpEntity<>(headers);

		ResponseEntity<String> response = null;
		MemberVO mdto = new MemberVO();
		ObjectMapper objectMapper = new ObjectMapper();
		UUID tempPWD = UUID.randomUUID(); // Garbage PWD

		if (api.equals("KAKAO")) {
			response = rt.exchange(kakaoKey.get(4), HttpMethod.POST, profileRequest, String.class);
			KakaoProfile kakaoProfile = objectMapper.readValue(response.getBody(), KakaoProfile.class);
			mdto.setId("K_" + kakaoProfile.getId());
			mdto.setPwd(String.valueOf(tempPWD));
			mdto.setName(kakaoProfile.getProperties().getNickname());
			mdto.setEmail(kakaoProfile.getKakao_account().getEmail());
			mdto.setProfimg(kakaoProfile.getProperties().getProfile_image());

		} else if (api.equals("NAVER")) {
			response = rt.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST, profileRequest,
					String.class);
			NaverProfile naverProfile = objectMapper.readValue(response.getBody(), NaverProfile.class);
			String ssn = getSSN(naverProfile);
			String gender = getGender(ssn);
			int age = getAge(ssn);

			// id, pwd, name, ssn, age, tel, email, profimg, mdate, gender
			mdto.setId("N_" + naverProfile.getResponse().getId());
			mdto.setPwd(String.valueOf(tempPWD));
			mdto.setSsn(ssn);
			mdto.setAge(age);
			mdto.setGender(gender);
			mdto.setName(naverProfile.getResponse().getName());
			mdto.setTel(naverProfile.getResponse().getMobile());
			mdto.setEmail(naverProfile.getResponse().getEmail());
			mdto.setAddr("-");
			mdto.setProfimg(naverProfile.getResponse().getProfile_image());
		}
		return mdto;
	}

	public String getSSN(NaverProfile naverProfile) {
		int birthyear = Integer.parseInt(naverProfile.getResponse().getBirthyear());
		String gender = naverProfile.getResponse().getGender();
		char ssn_after;
		if (birthyear < 2000) {
			if (gender.equals("M")) {
				ssn_after = '1';
			} else {
				ssn_after = '0';
			}
		} else {
			if (gender.equals("M")) {
				ssn_after = '3';
			} else {
				ssn_after = '2';
			}
		}

		String ssn = naverProfile.getResponse().getBirthyear().substring(2)
				+ naverProfile.getResponse().getBirthday().replace("-", "") + "-" + ssn_after;
		System.out.println("getSSN=>" + ssn);
		return ssn;
	}

	// 추후 따로 분리
	public int getAge(String jumin) {
		char ch = jumin.charAt(7);
		int age = Integer.parseInt(jumin.substring(0, 2));
		LocalDate now = LocalDate.now();
		int year = now.getYear();

		if (ch == '1' || ch == '2') {
			age = year - (1900 + age) + 1;
		}
		if (ch == '3' || ch == '4') {
			age = year - (2000 + age) + 1;
		}
		return age;
	}

	// 추후 따로 분리
	public String getGender(String jumin) {
		char ch = jumin.charAt(7);
		String gender = null;
		if (ch == '1' || ch == '3') {
			gender = "남자";
		}
		if (ch == '0' || ch == '2') {
			gender = "여자";
		}
		return gender;
	}
}
