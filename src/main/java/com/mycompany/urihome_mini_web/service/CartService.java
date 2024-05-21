package com.mycompany.urihome_mini_web.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.CartDao;
import com.mycompany.urihome_mini_web.dto.Cart;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
	@Autowired
	private CartDao cartDao;
	
	public void createCart(Cart cart) {
		cartDao.insert(cart);
		
	}
	public List<Cart> getCartList(String mid) {
		List<Cart> cartItem= cartDao.cartProduct(mid);
		return cartItem;
	}
	public Cart findItem(HashMap<String, String> param) {
		Cart result=cartDao.findByPidMid(param);
		return result;
	}
	public void updateCart(Cart cart) {
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", cart.getPid());
		param.put("mid", cart.getMid());
		Cart existCart= cartDao.findByPidMid(param);
		cart.setPbuyAmount(existCart.getPbuyAmount()+cart.getPbuyAmount());
		cartDao.updateCart(cart);
		
	}
	public void updateCartItemAmount(Cart cart) {
		cart.setPbuyAmount(cart.getPbuyAmount());
		cartDao.updateCart(cart);
	}
	public void removeCart(HashMap<String, String> param) {
		int row = cartDao.deleteCart(param);
	}
}
