package com.mycompany.urihome_mini_web.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Pimage {
	private String pid;
	private int pimageIndex;
	private String pimageName;
	private String pimageType;
	private byte[] pimageData;
	private String pthumbBodyType;
	
}
