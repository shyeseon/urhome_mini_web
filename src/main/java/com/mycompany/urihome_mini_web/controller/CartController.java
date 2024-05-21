package com.mycompany.urihome_mini_web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.urihome_mini_web.dto.Cart;
import com.mycompany.urihome_mini_web.dto.Member;
import com.mycompany.urihome_mini_web.security.UriHomeUserDetails;
import com.mycompany.urihome_mini_web.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart")
public class CartController {
	@Autowired
	public CartService cartService;

	@PostMapping(value="/addCartItem", produces="application/json; charset=UTF-8")
	@ResponseBody
	@Secured("ROLE_USER")
	public String addCartItem(@RequestBody Cart cart,
		HttpSession session, Authentication authentication, Model model) {

		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName()
				;
		JSONObject jsonData = new JSONObject(cart);
	    String pid = jsonData.getString("pid");
		cart.setMid(mid);
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		param.put("mid", mid);
		if(cartService.findItem(param)==null) {
			cartService.createCart(cart);
		} else {
			cartService.updateCart(cart);
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}
		
	
	@GetMapping("/cartView")
	public String cartView(Authentication authentication, Model model, HttpSession session) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		List<Cart> cartItem = cartService.getCartList(mid);
		model.addAttribute("cartItem", cartItem);
		return "cart/cartView";
	}
	
	@PostMapping(value="/updateCartItem", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateCartItem(@RequestBody Cart cart, Authentication authentication) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		JSONObject jsonObject= new JSONObject(cart);
	    String pid = jsonObject.getString("pid");
	    
	    cart.setMid(mid);
		cartService.updateCartItemAmount(cart);
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}
	
	@PostMapping(value="/deleteCart" , produces="applicatio/json; charset=UTF-8")
	@ResponseBody
	public String deleteCart(@RequestBody Cart cart, Authentication authentication) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		JSONObject jsonObject= new JSONObject(cart);
		jsonObject.put("result", "success");
		
		HashMap<String, String> param = new HashMap<>();
		param.put("mid", mid);
		param.put("pid", cart.getPid());
		cartService.removeCart(param);
		return jsonObject.toString();
	}

}
	
	
	
	

