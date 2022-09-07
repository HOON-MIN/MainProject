package com.test.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.Name;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.daointer.ShopService;
import com.test.vo.PharmacyVO;
import com.test.vo.SuperDTO;

@Service
@Repository(value = "ShopListPage")
public class ShopDao implements ShopService{
	
	@Autowired
	private SqlSessionTemplate ss;


	@Override
	public int getAllShop() {
		return ss.selectOne("shop.getAllShop");
	}


	@Override
	public List<? extends SuperDTO> ShopListPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("shop.ShopListPage", map);
	}


	@Override
	public PharmacyVO getDetail(int pnum) {
		return ss.selectOne("shop.ShopDetail", pnum);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		return ss.selectOne("shop.searchCount", map);
	}


	@Override
	public List<? extends SuperDTO> SearchShopList(Map<String, Object> map) {
		return ss.selectList("shop.SearchShopList", map);
	}
	
}
	