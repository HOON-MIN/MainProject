package com.main.ateam.pharmacy.dao;

import java.util.List;
import java.util.Map;

import com.main.ateam.pharmacy.page.PageListInter;
import com.main.ateam.vo.PharmacyVO;
import com.main.ateam.vo.SuperDTO;




public interface ShopDao extends PageListInter{

	public int getAllShop();	
	public List<? extends SuperDTO> ShopListPage(Map<String, Object> map);
	public PharmacyVO ShopDetail(int pnum);
	public int searchCount(Map<String, String> map);
	public List<? extends SuperDTO> SearchShopList(Map<String, Object> map);
	public List<PharmacyVO> getAndroid();
	public List<PharmacyVO> getPharmacy(Map<String, String> map);
	public List<PharmacyVO> getShopPharmacy(Map<String, String> map);
	
}
	