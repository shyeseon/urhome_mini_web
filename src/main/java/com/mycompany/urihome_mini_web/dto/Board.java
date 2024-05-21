package com.mycompany.urihome_mini_web.dto;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int bnumber;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private Date bdate;
	private String btype;
	private int bhitcount;
	private String battachoname;
	private String battachsname;
	private String battachtype;
	private byte[] battachdata;
	
	private MultipartFile battach;
}
