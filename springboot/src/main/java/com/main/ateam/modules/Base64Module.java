package com.main.ateam.modules;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.Base64;

import org.springframework.stereotype.Component;

@Component
public class Base64Module {
	// https://blog.naver.com/PostView.nhn?blogId=pythagoras47&logNo=221973139548 출처
	public void base64ToMultipart(String base64, String filename, String filepath) throws Exception {
		String[] splitbase64 = base64.split(",");

		byte[] decodedByte = Base64.getDecoder().decode(splitbase64[1].getBytes());
		System.out.println("decodeByte=>" + decodedByte);
		System.out.println(
				"DIRS=>" + Paths.get(System.getProperty("user.dir"), "src/main/resources/static/upload\\audio"));
		File convertFile = new File(filepath + "\\" + filename);
		
		if (convertFile.createNewFile()) {
			FileOutputStream fos = new FileOutputStream(convertFile);
			fos.write(decodedByte);
			fos.close();
		}
	}
}
