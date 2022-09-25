package com.main.ateam.review.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.ateam.review.service.ReviewBoardService;
import com.main.ateam.vo.ReviewBoardCommVO;
import com.main.ateam.vo.ReviewBoardVO;
import com.main.ateam.vo.SearchPageVO;


@Controller
@RequestMapping(value = "/reviewboard")
public class ReviewBoardController {


	private int nowPage = 1; // 현재 페이지 값 //**
	private int nowBlock = 1; // 현재 블럭
	private int totalRecord = 0; // 총 게시물 수
	private int numPerPage = 10; // 한페이지당 보여질 게시물 수
	private int pagePerBlock = 5; //한 블럭당 보여질 페이지 수 //**
	private int totalPage =0; // 전체 페이지 수 -> totalRecord/numPerPage //**
	private int totalBlock =0; // 전체 블럭 수
	private int beginPerPage =0; // 각 페이지별 시작 게시물의 index값
	private int endPerPage =0; // 각 페이지별 마지막 게시물의 index값
	
	@Autowired
	private ReviewBoardService service;
	
	// 후기 리스트
	@RequestMapping(value = "/reviewboardlist")
	public String reviewBoardList(Model model, Map<String,Object> map,
			@RequestParam(value = "cPage", required = true, defaultValue = "1") String s_page,
			@RequestParam(defaultValue = "id") String search_option, // 기본 검색 옵션값을 작성자로 한다.
			@RequestParam(defaultValue = "") String keyword // 키워드의 기본값을 ""으로 한다
			
			) {
		
		totalRecord = service.getCnt();
		totalPage = (int)Math.ceil(totalRecord/(double)numPerPage);
		totalBlock = (int)Math.ceil(totalPage/(double)pagePerBlock);
		
		SearchPageVO svo = new SearchPageVO(); // 페이지 서치용
		
		if(s_page != null) {
			nowPage = Integer.parseInt(s_page);
		}
		// begin ~ end  구하는 공식
		beginPerPage = (nowPage-1)*numPerPage + 1;
		endPerPage = (beginPerPage-1)+numPerPage;
		
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		map.put("search_option", search_option); // 추가. map을 object로 바꿈
		map.put("keyword",keyword); // 추가. map을 object로 바꿈

		List<ReviewBoardVO> list = service.getList(map);
		
		model.addAttribute("reviewlist", list);
		System.out.println(list.isEmpty());
	
		int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		int endPage = startPage+pagePerBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("map", map);

		
		return "reviewBoard/reviewboardList";
	}
	// 입력폼
	@GetMapping(value = "/reviewupForm")
	public String reviewUpForm() {
		return "reviewBoard/reviewupForm";
	}
	// 내용입력
	@PostMapping(value = "/uploadpro")
	public String uploadFile(Model m, ReviewBoardVO dto,
			HttpServletRequest request, HttpSession session) {
		
		service.addReviewBoard(dto);
		return "redirect:reviewboardlist";
	}
	// 리뷰상세 페이지 (후기 상세 내용 보여 줌)
	@GetMapping(value = "/reviewDetail")
	public String reviewboardDetail(Model model, int rnum, String mid) {
		System.out.println("후기 게시판 디테일 페이지 시작");
		ReviewBoardVO vo = service.getDetail(rnum);
		service.upReviewHits(rnum); // 추가. 조회수
		model.addAttribute("vo", vo);		
		return "reviewBoard/reviewDetail";
	}
	// 리뷰삭제
	@GetMapping(value = "/delReview")
	public String delReview(Model m, int rnum) {
		service.upDelete(rnum);
		return "redirect:reviewboardlist";
	}
	// 리뷰수정 페이지로 이동
	@RequestMapping(value = "/reviewUpdate")
	public String reviewupDefaultIndex(Model model, int rnum) {
		ReviewBoardVO vo = service.getDetail(rnum);
		model.addAttribute("vo", vo);
		return "reviewBoard/reviewUpdate";
	}
	// 리뷰수정 반영
	@PostMapping(value = "/uploadUpdate")
	public String upReviewBoard(Model m, ReviewBoardVO dto,
			HttpServletRequest request) {
		service.upReviewBoard(dto);
		return "redirect:reviewboardlist";

	}
	
}
