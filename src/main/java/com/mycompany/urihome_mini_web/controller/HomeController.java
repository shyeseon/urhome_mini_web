package com.mycompany.urihome_mini_web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.urihome_mini_web.dto.Product;
import com.mycompany.urihome_mini_web.dto.ProductCategory;
import com.mycompany.urihome_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("")
	public String index(Model model) {
		List<ProductCategory> bestList = productService.selectByPbanner("best");
		model.addAttribute("bestList", bestList);
		
		List<Product> famousList = productService.selectProductByPbanner("famous");
		model.addAttribute("famousList", famousList);
		
		return "index";
	}
}
