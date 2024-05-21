package com.mycompany.urihome_mini_web.dto;

import lombok.Data;

@Data
public class Cart {
	private Integer cnumber;
	private String mid;
	private String pid;
	private int pbuyAmount;
	private String pname;
	private int pprice;
	private int pstock;
	private String selected;
	
	private int ptotalPrice;
}
