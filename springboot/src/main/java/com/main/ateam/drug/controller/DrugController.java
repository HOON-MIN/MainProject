package com.main.ateam.drug.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.main.ateam.drug.service.DrugService;
import com.main.ateam.vo.DrugVO;

@Controller
public class DrugController {
	@Autowired
	private DrugService service;
	int nowPage = 1; // 현재 페이지 값
	int nowBlock = 1; // 현재 블럭
	int totalRecord = 0; // 총 게시물 수
	int numPerPage = 10; // 한페이지당 보여질 게시물 수
	int pagePerBlock = 5; // 한 블럭 당 보여질 게시물 수
	int totalPage = 0; // 전체 페이지 수 => totalRecord/numPerPage
	int beginPerPage = 0; // 각 페이지 별 시작 게시물의 index 값
	int endPerPage = 0; // 각 페이지 별 마지막 게시물의 index값
	@Autowired
	HttpSession session;

	@GetMapping(value = "/drugInsertForm")
	public String complainBoardFormMC() {
		return "drug/drugForm";
	}
	// list print

	@RequestMapping(value = "/drugList")
	public String totaldruglist(Model model, @RequestParam(defaultValue = "1") int dPage) {
		model.addAttribute("plmn", "totaldruglist");
		// "plmn" : PrintListMethodName view단에서 어떤 컨트롤러로 부터 데이터가 넘어 왔는지 확인하는 용도
		// 어떤 컨트롤러로 부터 요청이 확는지 확인하여 출력되는 결과와 동작을 한 jsp로부터 다르게 만든다.

		totalRecord = service.drugTotalCount();
		System.out.println("총 게시물 수 :" + totalRecord);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));
		System.out.println("총 페이지 수 : !!!!!!!!!!!!!!!!!!!!" + totalPage);
		System.out.println("dPage:" + dPage);

		if (dPage != 0) {
			nowPage = dPage;
		}
		model.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		model.addAttribute("startPage", startPage);
		System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		map.put("plmn", 0);

		List<DrugVO> list = service.getDrugList(map);
		model.addAttribute("list", list);
		return "drug/drugList";
	}

	@RequestMapping(value = "/drugSearchList")
	public String drugSearchList(Model model, @RequestParam(defaultValue = "1") int dPage, @RequestParam String content,
			@RequestParam String searchSelect) {

		model.addAttribute("content", content);
		model.addAttribute("searchSelect", searchSelect);
		if (dPage != 0) {
			nowPage = dPage;
		}

		model.addAttribute("plmn", "drugSearchList");
		// "plmn" : PrintListMethodName view단에서 어떤 컨트롤러로 부터 데이터가 넘어 왔는지 확인하는 용도
		// 어떤 컨트롤러로 부터 요청이 확는지 확인하여 출력되는 결과와 동작을 한 jsp로부터 다르게 만든다.

		Map<String, String> map = new HashMap<>();
		if (searchSelect.equals("searchName")) {
			map.put("searchName", content.trim());
		} else if (searchSelect.equals("searchComponent")) {
			map.put("searchComponent", content.trim());
		} else if (searchSelect.equals("searchCompany")) {
			map.put("searchCompany", content.trim());
		}

		totalRecord = service.getDrugSearchTotalCount(map);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));

		System.out.println("------------------------검색 조회 관련 -----------------------------------");
		System.out.println("선택한 검색 종류 !!!!!!!!!!!!!!!!: " + searchSelect);
		System.out.println("검색창에 쓴 내용  !!!!!!!!!!!!!!!! : " + content);
		System.out.println("검색창에 쓴 내용 공백 자르기 !!!!!!!!!!!!!!!! : " + content.trim());
		System.out.println("검색한 내용에 대한 총 게시물 수 !!!!!!!!!!!!!!!! : " + totalRecord);

		model.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		model.addAttribute("startPage", startPage);
		System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);

		map.put("begin", String.valueOf(beginPerPage));
		map.put("end", String.valueOf(endPerPage));

		List<DrugVO> list = service.getDrugContentSearch(map);
		model.addAttribute("list", list);
		return "drug/drugList";
	}

	
	  @RequestMapping(value = "/shapeSearch")
	  public String shapSearch(Model model,@RequestParam(defaultValue = "1") int dPage, String
	  drug_identification,String drug_color_F,String drug_color_B, String
	  drug_shape,String drug_formulation,String drug_split_line_F,String
	  drug_split_line_B ) { 
	  Map<String, String> map = new HashMap<>();
	  model.addAttribute("plmn","shapeSearch"); 
	  // "plmn" : PrintListMethodName
	  //view단에서 어떤 컨트롤러로 부터 데이터가 넘어 왔는지 확인하는 용도
	  // 어떤 컨트롤러로 부터 요청이 확는지 확인하여 출력되는 결과와 동작을 한 jsp로부터 다르게 만든다.
	  
	  //뷰에서 받은 값을 컨트롤러에서 받아 map으로 mapper로 보내기
	  
	  map.put("drug_identification", drug_identification);
	  
	  
	  map.put("drug_color_F", drug_color_F); 
	  map.put("drug_color_B", drug_color_B);
	  map.put("drug_shape", drug_shape); 
	  map.put("drug_formulation",drug_formulation);
	  map.put("drug_split_line_F", drug_split_line_F);
	  
	  
	  
	 model.addAttribute("drug_identification", drug_identification);
	  
	  
	 model.addAttribute("drug_color_F", drug_color_F); 
	 model.addAttribute("drug_color_B", drug_color_B);
	 model.addAttribute("drug_shape", drug_shape); 
	 model.addAttribute("drug_formulation",drug_formulation);
	 model.addAttribute("drug_split_line_F", drug_split_line_F);
	  
	  
	  if (dPage != 0) { nowPage = dPage; }
	  System.out.println(dPage);
	  System.out.println("식별표시 : " + drug_identification);
	  System.out.println("전면 / 좌측 색깔 :" + drug_color_F);
	  System.out.println("후면 / 우측 색깔 :" + drug_color_B);
	  
	  System.out.println("모양 : " + drug_shape); 
	  System.out.println("제형 :" + drug_formulation);
	  System.out.println("분할선 : " + drug_split_line_F);
	  
		 
	  totalRecord = service.getDrugSearchShapeCount(map); 
	  totalPage = (int)
	  (Math.ceil((totalRecord) / (double) numPerPage)); 
	  
	  System.out.println("------------------------검색 조회 관련 -----------------------------------");
	  System.out.println("검색한 내용에 대한 총 게시물 수 !!!!!!!!!!!!!!!! : " + totalRecord);
		
	  
	  
	  
	  
	  model.addAttribute("nowPage", nowPage); beginPerPage = (nowPage - 1) *
	  numPerPage + 1; System.out.println("각 페이지 별 시작 게시물의 index값 : " +
	  beginPerPage); endPerPage = (beginPerPage - 1) + numPerPage;
	  System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage); 
	  int startPage= (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
	  model.addAttribute("startPage", startPage); 
	  System.out.println("startPage :"
	  + startPage); int endPage = startPage + pagePerBlock - 1;
	  System.out.println("endPage :" + endPage); if (endPage > totalPage) { endPage
	  = totalPage; } model.addAttribute("endPage", endPage);
	  model.addAttribute("totalPage", totalPage);
	  
	  map.put("begin", String.valueOf(beginPerPage));
	  map.put("end",String.valueOf(endPerPage));
	  
	  
	  List<DrugVO> list = service.getDrugSearchShape(map);
	  model.addAttribute("list", list);
	  
	  // "plmn" : PrintListMethodName view단에서 어떤 컨트롤러로 부터 데이터가 넘어 왔는지 확인하는 용도 // 어떤
	  // 컨트롤러로 부터 요청이 확는지 확인하여 출력되는 결과와 동작을 한 jsp로부터 jstl로 다르게 만든다.
	  
	  
	  return "drug/drugList";
	  
	  }
	 

	@RequestMapping(value = "/drugMyCase")
	public String drugMyCaseList(Model model, @RequestParam(defaultValue = "1") int dPage) {
		
		model.addAttribute("plmn", "drugMyCaseList");
		// "plmn" : PrintListMethodName view단에서 어떤 컨트롤러로 부터 데이터가 넘어 왔는지 확인하는 용도
		// 어떤 컨트롤러로 부터 요청이 확는지 확인하여 출력되는 결과와 동작을 한 jsp로부터 jstl로 다르게 만든다.
		int loginNUM ;
		try {
			loginNUM = (int) session.getAttribute("sessionNUM");
		} catch (NullPointerException e) {

			return "redirect:member/memberLoginForm";
		}

		totalRecord = service.myDrugCaseTotalCount(loginNUM);
		System.out.println("총 게시물 수 :" + totalRecord);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));
		System.out.println("총 페이지 수 : !!!!!!!!!!!!!!!!!!!!" + totalPage);
		System.out.println("dPage:" + dPage);

		if (dPage != 0) {
			nowPage = dPage;
		}
		model.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		model.addAttribute("startPage", startPage);
		System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		map.put("loginNUM", loginNUM);
		map.put("plmn", 1);

		List<DrugVO> list = service.getDrugList(map);
		model.addAttribute("list", list);
		return "drug/drugList";
	}

	@RequestMapping(value = "/drugSearchHistory")
	public String drugSearchHistoryList(Model model, @RequestParam(defaultValue = "1") int dPage) {
		int loginNUM;
		model.addAttribute("plmn", "drugSearchHistoryList"); // "plmn" : PrintListMethodName
		try {
			loginNUM = (int) session.getAttribute("sessionNUM");
		} catch (NullPointerException e) {

			return "redirect:member/memberLoginForm";
		}

		totalRecord = service.getDrugSearchHistoryTotalCount(loginNUM);
		System.out.println("총 게시물 수 :" + totalRecord);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));
		System.out.println("총 페이지 수 : !!!!!!!!!!!!!!!!!!!!" + totalPage);
		System.out.println("dPage:" + dPage);

		if (dPage != 0) {
			nowPage = dPage;
		}
		model.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		model.addAttribute("startPage", startPage);
		System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		map.put("loginNUM", loginNUM);
		map.put("plmn", 2);

		List<DrugVO> list = service.getDrugList(map);
		model.addAttribute("list", list);
		return "drug/drugList";
	}

	@RequestMapping(value = "/insertMyDrugCase")
	public String insertMyDrugCaset(Model m, int drugIdx) {
		int loginNUM;
		Map<String, Integer> map = new HashMap<>();

		if (session.getAttribute("sessionNUM") == null) {
			return "redirect:member/memberLoginForm";
		} else {
			loginNUM = (int) session.getAttribute("sessionNUM");
			map.put("session_num", loginNUM);
			map.put("drug_idx", drugIdx);
			try {
				service.setDrugMyCaseInsert(map);
			} catch (Exception e) {

				return "redirect:drugMyCase";
			}
			return "redirect:drugMyCase";
		}

	}

	@RequestMapping(value = "/insertDrugSearchHistory")
	public String insertDrugSearchHistory(Model m, int drugIdx) {
		int loginNUM;
		Map<String, Integer> map = new HashMap<>();

		if (session.getAttribute("sessionNUM") == null) {
			return "redirect:member/memberLoginForm";
		} else {
			loginNUM = (int) session.getAttribute("sessionNUM");
			map.put("session_num", loginNUM);
			map.put("drug_idx", drugIdx);

			service.setDrugSearchInsert(map);

			return "redirect:drugDetail?drugIdx=" + drugIdx;
		}
	}

	@RequestMapping(value = "/deleteMyDrugCase")
	public String deleteMyDrugCase(Model m, int drugIdx) {
		int loginNUM;
		Map<String, Integer> map = new HashMap<>();

		if (session.getAttribute("sessionNUM") == null) {
			return "redirect:member/memberLoginForm";
		} else {
			loginNUM = (int) session.getAttribute("sessionNUM");
			map.put("session_num", loginNUM);
			map.put("drug_idx", drugIdx);
			try {
				service.myDrugCaseDelete(map);
			} catch (Exception e) {

				return "redirect:drugMyCase";
			}
			return "redirect:drugMyCase";
		}

	}

	@PostMapping(value = "/drugInsert")
	public String drugInsert(Model m, DrugVO dto, HttpServletRequest request) {
		String img_path = "resources\\imgfile";
		// request를 가지고 이미지의 경로를 받아서 출력
		String r_path = request.getRealPath("/");
		System.out.println("r_path:" + r_path);
		// 업로드 된 이미지의 이름을 받아서 이미지를 복사
		// 이미지 이름 확인
		String oriFn = dto.getMfile().getOriginalFilename();
		// 이미지 사이즈 및 contentType 확인
		// application/vnd.ms-excel
		// application/pdf
		// text/plain
		// application/haansofthwp
		// image/jpeg
		long size = dto.getMfile().getSize();
		String contentType = dto.getMfile().getContentType();
		System.out.println("oriFn:" + oriFn);
		System.out.println("파일 크기 :" + size);
		System.out.println("파일의 type :" + contentType);
		// 메모리상(임시저장장소)에 파일을 우리가 설정한 경로에 복사 하겠다.
		// 이미지가 저장될 경로 만들기
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath :" + path);

		// 추상경로 (이미지를 저장할 경로) File 객체로 생성
		File f = new File(path.toString());

		// 임시 메모리에 담긴 즉 업로드한 파일의 값 -> File클래스의 경로로 복사
		try {
			dto.getMfile().transferTo(f);
			// 이미지 이름을 db에 저장하기 위해서 DTO 값을 재설정
			dto.setDrug_img(oriFn);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.setDrugInsert(dto);
		return "redirect:drugList?dPage=1";
	}

	@RequestMapping(value = "/drugDetail")
	public String getDrugDetail(Model value, int drugIdx) {

		// Map<String, Object> map = new HashMap<>();
		// map.put("drug_idx", str);
		System.out.println(drugIdx);
		DrugVO vo = service.getDrugDetail(drugIdx);
		System.out.println(vo.getDrug_name());
		value.addAttribute("vo", vo);
		return "drug/drugDetail";
	}

	@RequestMapping(value = "/drugSearchShape")
	public String getDrugMain(Model value) {
		return "drug/drugShapeSearch";
	}
	
	@RequestMapping(value = "/drugSearchImg")
	public String drugSearchImg(Model value) {
		return "drug/drugImgSearchForm";
	}
	
	@RequestMapping(value= "/drugImageSearch")
	public String drugImageSearch(Model value,
			@RequestParam String drugShapeExtractResult,
			@RequestParam String drugColorExtractResult,
			@RequestParam String identificationCharResult,
			@RequestParam(defaultValue = "1") int dPage) {
		//파이썬 ocr 또는 Google Cloud Vision API 로  식별표시 인식 추가후 
		//map으로 mapper로 보낸다음 쿼리문 써서 검색에 대한 약정보 리스트를 받은 다음 
		//리스트로 출력할 예정 
//		value.addAttribute("shape",drugShapeExtractResult);
//		value.addAttribute("color",drugColorExtractResult);
//		value.addAttribute("identificationChar",identificationCharResult);
		
		
		value.addAttribute("plmn", "drugImageSearchList");
		value.addAttribute("drugShapeExtractResult", drugShapeExtractResult);
		value.addAttribute("drugColorExtractResult", drugColorExtractResult);
		value.addAttribute("identificationCharResult", identificationCharResult);
		
		
		
		
		Map<String, String> map = new HashMap<>();
		map.put("shape", drugShapeExtractResult);
		map.put("color", drugColorExtractResult);
		map.put("identification", identificationCharResult);
		
		//-----------------------------------------------------------------------------
		totalRecord = service.getTotalImgDrugSearch(map);
		System.out.println("총 게시물 수 :" + totalRecord);
		totalPage = (int) (Math.ceil((totalRecord) / (double) numPerPage));
		System.out.println("총 페이지 수 : !!!!!!!!!!!!!!!!!!!!" + totalPage);
		System.out.println("dPage:" + dPage);

		if (dPage != 0) {
			nowPage = dPage;
		}
		value.addAttribute("nowPage", nowPage);
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		System.out.println("각 페이지 별 시작 게시물의 index값 : " + beginPerPage);
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("각 페이지 별 마지막 게시물의 index값 : " + endPerPage);
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		value.addAttribute("startPage", startPage);
		System.out.println("startPage :" + startPage);
		int endPage = startPage + pagePerBlock - 1;
		System.out.println("endPage :" + endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		value.addAttribute("endPage", endPage);
		value.addAttribute("totalPage", totalPage);

		map.put("begin", String.valueOf(beginPerPage));
		map.put("end",String.valueOf(endPerPage));



		List<DrugVO> list = service.getDrugSearchImage(map);
		value.addAttribute("list", list);
		return "drug/drugList";
	}
	

	
	
	/*
	 * @RequestMapping(value = "/drugImgSearch") public class DrugRestController{
	 * public
	 * 
	 * }
	 */
	/*
	 * @RequestMapping(value = "/cboardDetail") public String getcBoardDetail(Model
	 * value, int cnum) {
	 * 
	 * session.removeAttribute("sessionID");// 통합시 삭제 할것
	 * session.setAttribute("sessionID", "kid");// 통합시 삭제 할것 String loginid =
	 * (String) session.getAttribute("sessionID");
	 * 
	 * value.addAttribute("loginIdParam", loginid);
	 * 
	 * System.out.println("loginid !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : " +
	 * loginid); ComplainBoardVO cbdto = complainDaoInter.getCBDetail(cnum);
	 * value.addAttribute("boardWriter", cbdto.getWriter());
	 * List<ComplainCommBoardVO> commentList =
	 * complainDaoInter.getCommentList(cnum);
	 * 
	 * if (loginid.equals(cbdto.getWriter())) { int cowai = 1; // Comparison of
	 * author and ID value.addAttribute("cowai", cowai); }
	 * System.out.println(cbdto.getContent());
	 * System.out.println("쿼리스트링  숫자 ~~~~~~~~~~~:" + cnum);
	 * value.addAttribute("cbdto", cbdto); value.addAttribute("comentList",
	 * commentList); return "complainBoard/complainBoarDetail"; }
	 */
}
