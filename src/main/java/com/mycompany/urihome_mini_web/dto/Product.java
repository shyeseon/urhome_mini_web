package com.mycompany.urihome_mini_web.dto;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class Product {
	private String pid;
	private String pname;
	private int pprice;
	private int pstock;
	private Date pdate;
	private int psellAmount;
	private int psales;
	private int productHitcount;
	private String pstatus;
	
	private String pcategoryName;
	private String pbanner;
	
	private List<Map<String, List<String>>> options;
}
