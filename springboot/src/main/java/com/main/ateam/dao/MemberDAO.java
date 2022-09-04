package com.main.ateam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.main.ateam.vo.MemberVO;

@Mapper
public interface MemberDAO {
   public List<MemberVO> login();
}