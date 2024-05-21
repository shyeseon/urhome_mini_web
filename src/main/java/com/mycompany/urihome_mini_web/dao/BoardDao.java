package com.mycompany.urihome_mini_web.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.urihome_mini_web.dto.Board;
import com.mycompany.urihome_mini_web.dto.Pager;

@Mapper
public interface BoardDao {
	public int insert(Board board);
	public int count();
	public List<Board> selectByPage(Pager pager);
	public Board selectByBno(int bnumber);
	public Board selectByPrevBno(int bnumber);
	public Board selectByNextBno(int bnumber);
	public Board selectAttachData(int bnumber);
	public int update(Board board);
	public int deleteByBno(int bnumber);
	public int setBhitcountUp(Board board);

}
