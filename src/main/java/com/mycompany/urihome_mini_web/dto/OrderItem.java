package com.mycompany.urihome_mini_web.dto;

import lombok.Data;

@Data
public class OrderItem {
	private int onumber;
	private String pid;
	private int pbuyAmount;
	private int ptotalPrice;
}
