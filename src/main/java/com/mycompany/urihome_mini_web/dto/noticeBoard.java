package com.mycompany.urihome_mini_web.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class noticeBoard {

	private int bno;
	private String btitle;
	private Date bdate;
	private String bwriter;
	private int bhitcount;

}
