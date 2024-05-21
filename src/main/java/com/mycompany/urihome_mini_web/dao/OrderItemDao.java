package com.mycompany.urihome_mini_web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Cart;
import com.mycompany.urihome_mini_web.dto.OrderItem;

@Mapper
public interface OrderItemDao {
	int insertPayItems(HashMap<String, Object> param);
	List<OrderItem> getOrderItemList(int onumber);
}
