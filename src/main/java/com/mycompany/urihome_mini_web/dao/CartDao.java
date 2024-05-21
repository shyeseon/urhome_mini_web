package com.mycompany.urihome_mini_web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Cart;
import com.mycompany.urihome_mini_web.dto.OrderItemList;


@Mapper
public interface CartDao {
	public List<Cart> cartProduct(String mid);
	public int insert(Cart cart);
	public Cart findByPidMid(HashMap<String, String> param);
	public int updateCart(Cart cart);
	public int deleteCart(HashMap<String, String> param);
	public void changeCheckOrder(Cart item);
	public List<OrderItemList> getOrderItem(String mid);
	public List<OrderItemList> getCheckOrderItem(String mid);


}