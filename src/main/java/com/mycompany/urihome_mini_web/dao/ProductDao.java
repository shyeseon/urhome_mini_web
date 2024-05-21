package com.mycompany.urihome_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.urihome_mini_web.dto.Pager;
import com.mycompany.urihome_mini_web.dto.Product;

@Mapper
public interface ProductDao {
	public int count();
	public List<Product> selectByPage(Pager pager);
	public int insert(Product product);
	public Product selectByPid(String pid);	
	public int update(Product product);
	public int deleteByPid(String pid);
	public List<Product> selectAll();
	public List<Product> selectByPcategoryName(String pcategoryName);
	public int getSales();
	public int getExpenses();
	public List<Product> getProduct(String pid);
	public int disableByPid(Product product);
	public List<Product> selectProductByPbanner(String pbanner);

}
