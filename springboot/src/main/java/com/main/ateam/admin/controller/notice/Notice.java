package com.main.ateam.admin.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.admin.service.NoticeService;
import com.main.ateam.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class Notice {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value = {"/nlist"})
	public ModelAndView nlist(ModelAndView mv) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", 1);
		map.put("end", 10);
		List<NoticeVO> vo = noticeService.getNoticeList(map);
		for(NoticeVO e: vo) {
			System.out.println(e.getSubject());
		}
		mv.addObject("items", noticeService.getNoticeList(map));	
		return mv;
	}
	@ResponseBody
	@GetMapping(value = "/basicPage")
	public List<NoticeVO> basicPage(ModelAndView mv) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", 1);
		map.put("end", 10);
		List<NoticeVO> vo = noticeService.getNoticeList(map);
		
			
		return vo;
	}
	@GetMapping("/detail")
	public ModelAndView totalCount(ModelAndView mv,int nnum) {
		mv.addObject("item", noticeService.getDetail(nnum));	
		mv.setViewName("admin/noticeDetail");
		return mv;
	}
	@GetMapping("/addNotice")
	public ModelAndView addPage(ModelAndView mv) {
		mv.setViewName("admin/add");
		return mv;
	}
	
	@PostMapping("/insert")
	public String addNotice(NoticeVO vo) {
		noticeService.addNotice(vo);
		return "redirect:/admin/notice";
	}
	@GetMapping("/delete")
	public String deleteNotice(int nnum) {
		noticeService.deleteNotice(nnum);
		return "redirect:/admin/notice";
	}
	@GetMapping("/update")
	public ModelAndView updatePage(ModelAndView mv,int nnum) {
		mv.addObject("item", noticeService.getDetail(nnum));	
		mv.setViewName("admin/update");
		return mv;
	}
	@PostMapping("/modify")
	public String modifyNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "redirect:/admin/notice";
	}
	//////////////////////////////////////////////////////////////////////
	
}
