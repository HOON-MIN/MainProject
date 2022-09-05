package com.main.ateam.admin.controller.notice;

import java.util.HashMap;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.main.ateam.admin.service.NoticeService;
import com.main.ateam.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class Notice {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value = {"","/"})
	public ModelAndView basicPage(ModelAndView mv) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", 1);
		map.put("end", 10);
		mv.addObject("items", noticeService.getNoticeList(map));	
		mv.setViewName("manager/notice/noticeList");
		return mv;
	}
	@GetMapping("/detail")
	public ModelAndView totalCount(ModelAndView mv,int nnum) {
		mv.addObject("item", noticeService.getDetail(nnum));	
		mv.setViewName("manager/notice/noticeDetail");
		return mv;
	}
	@GetMapping("/addNotice")
	public ModelAndView addPage(ModelAndView mv) {
		mv.setViewName("manager/notice/add");
		return mv;
	}
	
	@PostMapping("/insert")
	public String addNotice(NoticeVO vo) {
		noticeService.addNotice(vo);
		return "redirect:/manager/notice";
	}
	@GetMapping("/delete")
	public String deleteNotice(int nnum) {
		noticeService.deleteNotice(nnum);
		return "redirect:/manager/notice";
	}
	@GetMapping("/update")
	public ModelAndView updatePage(ModelAndView mv,int nnum) {
		mv.addObject("item", noticeService.getDetail(nnum));	
		mv.setViewName("manager/notice/update");
		return mv;
	}
	@PostMapping("/modify")
	public String modifyNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "redirect:/manager/notice";
	}
}
