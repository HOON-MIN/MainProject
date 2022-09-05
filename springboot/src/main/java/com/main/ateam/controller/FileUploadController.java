package com.main.ateam.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.vo.FileVO;

@Controller
public class FileUploadController {

	@RequestMapping("/upform")
	public String fileForm() {
		return "upform";
	}

	@RequestMapping("/upload")
	public String fileupLoad(FileVO v, HttpServletRequest request, Model m) {
		String img_path = "resources\\upload";
		String r_path = request.getRealPath("/");
		String oriFn = v.getFileOriName().getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("-----------------------------------");
		System.out.println("Path :" + path);
		File f = new File(path.toString());
		try {
			v.getFileOriName().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		m.addAttribute("imgName", oriFn);
		return "hello";
	}

}
