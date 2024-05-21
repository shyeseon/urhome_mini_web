package com.mycompany.urihome_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.OrderHistory;
import com.mycompany.urihome_mini_web.dto.OrderItemList;

@Mapper
public interface OrderHistoryDao {
	public int order(OrderHistory orderHistory);
	public int getOnumber(String mid);
	public List<OrderHistory> getOrderHistory(String mid);
}
