package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String mid;
	private String mpassword;
	private String mname;
	private String memail;
	private String mtel;
	private String mphone;
	private Date mdate;
	private String mzip;
	private String maddress;
	private String mdetailAddress;
	private String mrole;
	private Boolean agree1;
	private Boolean agree2;
	private Boolean agree3;
	
	private String mtel1;
	private String mtel2;
	private String mtel3;
	
	private String mphone1;
	private String mphone2;
	private String mphone3;
}
