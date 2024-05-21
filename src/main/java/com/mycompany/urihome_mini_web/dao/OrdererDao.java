
package com.mycompany.urihome_mini_web.dao;


import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Orderer;

@Mapper
public interface OrdererDao {
	public int order(Orderer orderer);
}
