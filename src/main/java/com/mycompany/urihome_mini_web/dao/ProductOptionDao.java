package com.mycompany.urihome_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.ProductOption;

@Mapper
public interface ProductOptionDao {
	public int insert(ProductOption productOption);
	public int deleteByPid(String pid);
	public List<ProductOption> selectByPid(String pid);
	public int deleteByPidOption(ProductOption optionDelList);
	
}
