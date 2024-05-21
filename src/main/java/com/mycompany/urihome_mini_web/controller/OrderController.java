package com.mycompany.urihome_mini_web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.mycompany.urihome_mini_web.dto.Order;
import com.mycompany.urihome_mini_web.dto.OrderItemList;
import com.mycompany.urihome_mini_web.dto.Product;
import com.mycompany.urihome_mini_web.security.UriHomeUserDetails;
import com.mycompany.urihome_mini_web.service.OrderService;
import com.mycompany.urihome_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;


	@GetMapping("/orderForm")
	@Secured("ROLE_USER")
	public String orderForm(String check, Model model, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		model.addAttribute("member", member);
		String mid = member.getMid();

		if (member.getMtel() != null) {
			String[] mtel = member.getMtel().split("-");
			model.addAttribute("mtel", mtel);
		} else {
			String[] mtel = { "", "", "" };
			model.addAttribute("mtel", mtel);
		}

		String[] mphone = member.getMphone().split("-");
		model.addAttribute("mphone", mphone);

		if (check == null) {
			List<OrderItemList> orderItemList = orderService.getOrderItem(mid);
			model.addAttribute("orderItemList", orderItemList);
		}
		else{
			List<OrderItemList> orderItemList = orderService.getCheckOrderItem(mid);
			model.addAttribute("orderItemList", orderItemList);
		}

		return "order/orderForm";
	}

	@Secured("ROLE_USER")
	@PostMapping("/selectOrder")
	@ResponseBody
	public String selectOrder(HttpServletRequest request, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		String mid = member.getMid();

		String[] selected = request.getParameterValues("selected");
		List<Cart> cartList = new ArrayList<>();

		for (int i = 0; i < selected.length; i++) {
			String[] select = selected[i].split(",");

			Cart cart = new Cart();
			cart.setMid(mid);
			cart.setPid(select[0]);
			cart.setSelected(select[1]);

			cartList.add(cart);
		}

		orderService.checkSelectOrder(cartList);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/order")
	public String order(@RequestBody Order order, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		String mid = member.getMid();
		
		HashMap<String, Object> orderInfo = new HashMap<>();
		orderInfo.put("mid", mid);
		orderInfo.put("order", order);
		
		List<Cart> cartList = order.getCartList();
		
		orderService.orderSelectItems(orderInfo);
		
		return "redirect:/";
	}
	
	@GetMapping("/orderNowForm")
	@Secured("ROLE_USER")
	public String orderNowForm(String pid, int pbuyAmount,
			Model model, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		model.addAttribute("member", member);
		String mid = member.getMid();

		if (member.getMtel() != null) {
			String[] mtel = member.getMtel().split("-");
			model.addAttribute("mtel", mtel);
		} else {
			String[] mtel = { "", "", "" };
			model.addAttribute("mtel", mtel);
		}
		
		String[] mphone = member.getMphone().split("-");
		model.addAttribute("mphone", mphone);
		
		Product orderItem = productService.getProduct(pid);
		model.addAttribute("orderItem", orderItem);
		model.addAttribute("pbuyAmount", pbuyAmount);

		return "order/orderNowForm";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/orderNow")
	public String orderNow(@RequestBody Order order, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		String mid = member.getMid();
		
		HashMap<String, Object> orderInfo = new HashMap<>();
		orderInfo.put("mid", mid);
		orderInfo.put("order", order);
		
		List<Cart> cartList = order.getCartList();
		
		orderService.orderSelectItem(orderInfo);
		
		return "redirect:/";
	}
	
}