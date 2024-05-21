package com.mycompany.urihome_mini_web.dto;

import java.util.List;

import lombok.Data;

@Data
public class Order {
	private Orderer orderer;
	private Recipient recipient;
	private List<Cart> cartList;
	private int ototalPrice;
}
