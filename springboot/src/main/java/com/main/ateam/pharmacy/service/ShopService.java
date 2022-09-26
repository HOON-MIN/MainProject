package com.main.ateam.pharmacy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.main.ateam.pharmacy.dao.ShopDao;
import com.main.ateam.vo.PharmacyVO;
import com.main.ateam.vo.SuperDTO;



@Service
@Repository(value = "ShopListPage")
public class ShopService implements ShopDao {
	
	@Autowired
	private ShopDao shopdao;
	
	
	public int getAllShop() {
		return shopdao.getAllShop();
	}
	public PharmacyVO ShopDetail(int pnum) {
		return shopdao.ShopDetail(pnum);
	}
	public int searchCount(Map<String, String> map) {
		return shopdao.searchCount(map);
	}
	@Override
	public List<? extends SuperDTO> ShopListPage(Map<String, Object> map) {
		return shopdao.ShopListPage(map);
	}
	@Override
	public List<? extends SuperDTO> SearchShopList(Map<String, Object> map) {
		return shopdao.SearchShopList(map);
	}
	@Override
	public List<PharmacyVO> getAndroid() {
		return shopdao.getAndroid();
	}
	
	@Override
	public List<PharmacyVO> getPharmacy(Map<String, String> map) {
		return shopdao.getPharmacy(map);
	}
	@Override
	public List<PharmacyVO> getShopPharmacy(Map<String, String> map) {
		// TODO Auto-generated method stub
		return shopdao.getShopPharmacy(map);
	}

	
}
