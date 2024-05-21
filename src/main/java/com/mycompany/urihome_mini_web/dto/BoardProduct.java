package com.mycompany.urihome_mini_web.dto;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardProduct {
	private int bpnumber;
	private String bptitle;
	private String mid;
	private String bpcontent;
	private Date bpdate;
	private String bptype;
	private String pid;
	private String bpattachoname;
	private String bpattachtype;
	private byte[] bpattachdata;
	
	private MultipartFile bpattach;	// 큰 파일을 청크 단위로 쪼개서 효율적으로 파일 업로드
}
