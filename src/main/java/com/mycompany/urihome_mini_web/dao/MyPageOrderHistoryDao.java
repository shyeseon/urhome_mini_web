package com.mycompany.urihome_mini_web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.MyPageOrderHistory;
import com.mycompany.urihome_mini_web.dto.OnumberOrderHistory;

@Mapper
public interface MyPageOrderHistoryDao {
	public List<MyPageOrderHistory> getOrderProductHistory(String mid);
	public List<OnumberOrderHistory> getOnumberOrderHistory(HashMap<String, Object> param);
}
