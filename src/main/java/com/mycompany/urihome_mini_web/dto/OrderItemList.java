package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderItemList {
	private int cnumber;
	private String mid;
	private String pid;
	private int pbuyAmount;
	private String pname;
	private int pprice;
	private int pstock;
	private Date pdate;
	private int psellAmount;
	private int psale;
	private int productHitCount;	
}
