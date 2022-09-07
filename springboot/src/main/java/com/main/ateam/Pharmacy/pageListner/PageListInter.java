package com.test.page;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;




public interface PageListInter {
	List<? extends SuperDTO> ShopListPage(Map<String, Object> map);
	List<? extends SuperDTO> SearchShopList(Map<String, Object> map);
	

}
