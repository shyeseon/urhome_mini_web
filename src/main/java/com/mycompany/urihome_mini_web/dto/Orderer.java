package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Orderer {
	private int onumber;
	private String oname;
	private String oemail;
	private String ophone;
	private String ozip;
	private String oaddress;
	private String odetailAddress;
}
