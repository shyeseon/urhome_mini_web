package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderHistory {
	private int onumber;
	private String mid;
	private String ostatus;
	private int ototalPrice;
	private Date oitemDate;
}
