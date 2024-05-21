package com.mycompany.urihome_mini_web.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.CartDao;
import com.mycompany.urihome_mini_web.dao.MyPageOrderHistoryDao;
import com.mycompany.urihome_mini_web.dao.OrderHistoryDao;
import com.mycompany.urihome_mini_web.dao.OrderItemDao;
import com.mycompany.urihome_mini_web.dao.OrdererDao;
import com.mycompany.urihome_mini_web.dao.RecipientDao;
import com.mycompany.urihome_mini_web.dto.Cart;
import com.mycompany.urihome_mini_web.dto.MyPageOrderHistory;
import com.mycompany.urihome_mini_web.dto.OnumberOrderHistory;
import com.mycompany.urihome_mini_web.dto.Order;
import com.mycompany.urihome_mini_web.dto.OrderHistory;
import com.mycompany.urihome_mini_web.dto.OrderItem;
import com.mycompany.urihome_mini_web.dto.OrderItemList;
import com.mycompany.urihome_mini_web.dto.Orderer;
import com.mycompany.urihome_mini_web.dto.Recipient;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
	@Autowired
	private OrderHistoryDao orderHistoryDao;
	@Autowired
	private OrdererDao ordererDao;
	@Autowired
	private OrderItemDao orderItemDao;
	@Autowired
	private RecipientDao recipientDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private MyPageOrderHistoryDao mypageOrderHistoryDao;

	
	public List<OrderItemList> getOrderItem(String mid) {
	List<OrderItemList> orderItemList = cartDao.getOrderItem(mid);
	return orderItemList;
	}


	public void checkSelectOrder(List<Cart> cartList) {
		Iterator<Cart> iter = cartList.iterator();

		
		while(iter.hasNext()) {
			Cart item = iter.next();
			cartDao.changeCheckOrder(item);
		}
	}


	public List<OrderItemList> getCheckOrderItem(String mid) {
		List<OrderItemList> orderItemList = cartDao.getCheckOrderItem(mid);
		return orderItemList;
	}


	public void orderSelectItems(HashMap<String, Object> orderInfo) {
		String mid = (String) orderInfo.get("mid");
		Order order = (Order) orderInfo.get("order");
		
		Orderer orderer = order.getOrderer();
		Recipient recipient = order.getRecipient();
		List<Cart> cartList = order.getCartList();
		int ototalPrice = order.getOtotalPrice();
		
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setMid(mid);
		orderHistory.setOstatus("결제완료");
		orderHistory.setOtotalPrice(ototalPrice);
		
		int orderRow = orderHistoryDao.order(orderHistory);
		int onumber = orderHistoryDao.getOnumber(mid);
		
		orderer.setOnumber(onumber);
		recipient.setOnumber(onumber);
		
		int ordererRow = ordererDao.order(orderer);
		int recipientRow = recipientDao.order(recipient);
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("onumber", onumber);
		
		HashMap<String, String> delCart = new HashMap<>();
		delCart.put("mid", mid);
		
		for(int i = 0; i < cartList.size(); i++) {
			Cart cart = cartList.get(i);
			delCart.put("pid", cart.getPid());
			param.put("pid", cart.getPid());
			param.put("pbuyAmount", cart.getPbuyAmount());
			param.put("ptotalPrice", cart.getPtotalPrice());
			
			int orderItemRow = orderItemDao.insertPayItems(param);
			
			int cartRow = cartDao.deleteCart(delCart);
		}
	}


	public void orderSelectItem(HashMap<String, Object> orderInfo) {
		String mid = (String) orderInfo.get("mid");
		Order order = (Order) orderInfo.get("order");
		
		Orderer orderer = order.getOrderer();
		Recipient recipient = order.getRecipient();
		List<Cart> cartList = order.getCartList();
		int ototalPrice = order.getOtotalPrice();
		
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setMid(mid);
		orderHistory.setOstatus("결제완료");
		orderHistory.setOtotalPrice(ototalPrice);
		
		int orderRow = orderHistoryDao.order(orderHistory);
		int onumber = orderHistoryDao.getOnumber(mid);
		
		orderer.setOnumber(onumber);
		recipient.setOnumber(onumber);
		
		int ordererRow = ordererDao.order(orderer);
		int recipientRow = recipientDao.order(recipient);
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("onumber", onumber);
		
		HashMap<String, String> delCart = new HashMap<>();
		delCart.put("mid", mid);
		
		for(int i = 0; i < cartList.size(); i++) {
			Cart cart = cartList.get(i);
			delCart.put("pid", cart.getPid());
			param.put("pid", cart.getPid());
			param.put("pbuyAmount", cart.getPbuyAmount());
			param.put("ptotalPrice", cart.getPtotalPrice());
			
			int orderItemRow = orderItemDao.insertPayItems(param);
		}
	}


	public List<OrderHistory> getOrderHistory(String mid) {
		List<OrderHistory> orderHistoryList = orderHistoryDao.getOrderHistory(mid);
		return orderHistoryList;
	}


	public List<String> getOrderHistoryPid(List<OrderHistory> ohistoryList) {
		Iterator<OrderHistory> iter = ohistoryList.iterator();
		List<String> orderHistoryPidList = new ArrayList<>();
		while(iter.hasNext()) {
			OrderHistory ohistory = iter.next();
			List<OrderItem> orderItemList = orderItemDao.getOrderItemList(ohistory.getOnumber());
			for(OrderItem oitem : orderItemList) {
				orderHistoryPidList.add(oitem.getPid());
			}
		}
		return orderHistoryPidList;
	}


	public List<MyPageOrderHistory> getmyPageOrderList(String mid) {
		List<MyPageOrderHistory> mypageOrderList = mypageOrderHistoryDao.getOrderProductHistory(mid);
		List<MyPageOrderHistory> myOrderList = new ArrayList<>();
		
		Iterator<MyPageOrderHistory> iter = mypageOrderList.iterator();
		List<Integer> onumList = new ArrayList<>();
		
		while(iter.hasNext()) {
			MyPageOrderHistory ohist = iter.next();
			
			if(!onumList.contains(ohist.getOnumber())) {
				onumList.add(ohist.getOnumber());
				myOrderList.add(ohist);
			}
		}
		
		return myOrderList;
	}


	public List<OnumberOrderHistory> getOnumberOrderHistory(HashMap<String, Object> param) {
		List<OnumberOrderHistory> onumberOrderHistory = mypageOrderHistoryDao.getOnumberOrderHistory(param);
		return onumberOrderHistory;
	}
}
