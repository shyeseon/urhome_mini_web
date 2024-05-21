package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Answer {
	private int anumber;
	private String atitle;
	private String awriter;
	private String aimage;
	private String acontent;
	private Date adate;
	private int bpnumber;
}
