package com.mycompany.urihome_mini_web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Pimage;

@Mapper
public interface PimageDao {

	public int insert(Pimage pimage);
	public Pimage selectByPidAndIndex(HashMap<String, String> param);
	public Pimage selectProductImageData(HashMap<String, String> param);
	public int count(HashMap<String, String> param);
	public int update(Pimage pimage);
	public int deleteByPid(String pid);
	public void deleteByPindex(HashMap<String, Object> param);

}
