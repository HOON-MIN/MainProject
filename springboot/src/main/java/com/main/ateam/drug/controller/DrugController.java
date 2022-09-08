package com.main.ateam.drug.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.ateam.drug.service.DrugService;
import com.main.ateam.drug.vo.DrugVO;




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
	
	@GetMapping(value = "/drugInsertForm")
	public String complainBoardFormMC() {
		return "drug/drugForm";
	}
	// list print
	
	@RequestMapping(value = "/drugList")
	public String totaldruglist(Model model, @RequestParam(defaultValue = "1") int dPage) {		
		model.addAttribute("plmn", "totaldruglist"); // "plmn" : PrintListMethodName
		
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

		List<DrugVO> list = service.getDrugList(map);
		model.addAttribute("list", list);
		return "drug/drugList";
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
	
	@RequestMapping(value= "/drugDetail")
	public String getDrugDetail(Model value,int drugIdx) {
		
		//Map<String, Object> map = new HashMap<>();
		//map.put("drug_idx", str);
		System.out.println(drugIdx);
		DrugVO vo = service.getDrugDetail(drugIdx);
		System.out.println(vo.getDrug_name());
		value.addAttribute("vo", vo);
		return "drug/drugDetail";
	}
	
	@RequestMapping(value= "/drugSearchShape")
	public String getDrugMain(Model value) {
		return "drug/drugShapeSearch";
	}
	/*@RequestMapping(value = "/cboardDetail")
	public String getcBoardDetail(Model value, int cnum) {
		
		 * session.removeAttribute("sessionID");// 통합시 삭제 할것
		 * session.setAttribute("sessionID", "kid");// 통합시 삭제 할것
		  String loginid = (String) session.getAttribute("sessionID");

		value.addAttribute("loginIdParam", loginid);

		System.out.println("loginid !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : " + loginid);
		ComplainBoardVO cbdto = complainDaoInter.getCBDetail(cnum);
		value.addAttribute("boardWriter", cbdto.getWriter());
		List<ComplainCommBoardVO> commentList = complainDaoInter.getCommentList(cnum);

		if (loginid.equals(cbdto.getWriter())) {
			int cowai = 1; // Comparison of author and ID
			value.addAttribute("cowai", cowai);
		}
		System.out.println(cbdto.getContent());
		System.out.println("쿼리스트링  숫자 ~~~~~~~~~~~:" + cnum);
		value.addAttribute("cbdto", cbdto);
		value.addAttribute("comentList", commentList);
		return "complainBoard/complainBoarDetail";
	}*/
}
