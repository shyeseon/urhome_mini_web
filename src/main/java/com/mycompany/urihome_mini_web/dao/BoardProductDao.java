package com.mycompany.urihome_mini_web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.BoardProduct;
import com.mycompany.urihome_mini_web.dto.Pager;

@Mapper
public interface BoardProductDao {
	
	public int insert(BoardProduct boardProduct);
	public List<BoardProduct> selectByPage(HashMap<String, Object> param);
	public int count(HashMap<String,String> param);
	public BoardProduct selectByBpno(int bpnumber);
	public int deleteByBpno(int bpnumber);
	public int updateByBpno(BoardProduct boardProduct);
	public BoardProduct selectImageByBpno(int bpnumber);
	public BoardProduct selectImageDataByBpno(int bpnumber);
	
}
