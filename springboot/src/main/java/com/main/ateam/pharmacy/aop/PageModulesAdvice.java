package com.main.ateam.pharmacy.aop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.main.ateam.pharmacy.page.PageListInter;
import com.main.ateam.vo.SuperDTO;





@Component
@Aspect
public class PageModulesAdvice {

	 @Autowired
	 private ApplicationContext applicationContext;
	
	 private  int nowPage = 1;
	 private  int nowBlock = 1;
	 private  int totalRecord = 0; 
	 private  int numPerPage = 10;
	 private  int pagePerBlock = 5;
	 private  int totalPage = 0;
	 private  int totalBlock = 0;
	 private  int beginPerPage = 0;
	 private  int endPerPage = 0;
	 
	 @Around("execution(* com.main.ateam.pharmacy.controller.*Controller.ShopList*(..))")
	 public String pageModule(ProceedingJoinPoint jp) {
			Object[] args = jp.getArgs();
			String keyword = null;
			String type = null;
			Model m = (Model) args[0];
			String cPage = (String) args[1];
			String snum = null;
			String tnum = null;
			if (args.length > 2) {
				snum = (String) args[3];
				tnum = (String) args[2];
			}
			System.out.println(snum+"fsafsfdsf");
			System.out.println(tnum+"dadasafsfdsf");
			List<? extends SuperDTO> list = null;
			String myDao = jp.getSignature().getName();
			PageListInter pageListInter = applicationContext.getBean(myDao, PageListInter.class);
			System.out.println(pageListInter.toString()+"pageListIter");
			String url = null;
			try {
				url = (String) jp.proceed();
				totalRecord = (int) m.asMap().get("totalRecord");
				totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
				totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
				String s_page = cPage;
				if (s_page != null) {
					nowPage = Integer.parseInt(s_page);
				}
				beginPerPage = (nowPage - 1) * numPerPage + 1;
				endPerPage = (beginPerPage - 1) + numPerPage;
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("begin", beginPerPage);
				map.put("end", endPerPage);
				if (tnum != "" && snum != "" && tnum != null) { 
				
					map.put(tnum, tnum);
					map.put("searchf", snum);
					list = pageListInter.SearchShopList(map);
				}
				else if (tnum == "" || snum == "" || tnum == null){
	
					list = pageListInter.ShopListPage(map);
				}
				m.addAttribute("list", list);
				int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
				int endPage = startPage + pagePerBlock - 1;
				if (endPage > totalPage) {
					endPage = totalPage;
				}
				if (tnum != null) {
				m.addAttribute("type", tnum);
				m.addAttribute("searchf", snum);
				}
			
				m.addAttribute("startPage", startPage);
				m.addAttribute("endPage", endPage);
				m.addAttribute("nowPage", nowPage);
				m.addAttribute("pagePerBlock", pagePerBlock);
				m.addAttribute("totalPage", totalPage);
			} catch (Throwable e) {
				e.printStackTrace();
			}
			System.out.println("url=>" + url);
			return url;
	 }
}



