package com.main.ateam.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NaverProfile {
	private String resultcode;
	private String message;
	private Response response;

	@Getter
	@Setter
	@NoArgsConstructor
	public class Response {
		private String id;
		private String profile_image;
		private String gender;
		private String email;
		private String mobile;
		private String mobile_e164;
		private String name;
		private String birthday;
		private String birthyear;
	}
}
