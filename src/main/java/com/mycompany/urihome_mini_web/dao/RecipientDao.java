package com.mycompany.urihome_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Recipient;

@Mapper
public interface RecipientDao {
	public int order(Recipient recipient);

}
