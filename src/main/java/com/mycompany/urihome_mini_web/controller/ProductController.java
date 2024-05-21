package com.mycompany.urihome_mini_web.controller;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.urihome_mini_web.dto.Pimage;
import com.mycompany.urihome_mini_web.dto.Product;
import com.mycompany.urihome_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;

	@RequestMapping("/product_detail")
	public String product_detail(String pid, Model model) {
		Product product = productService.getProduct(pid);
		model.addAttribute("product", product);
		
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		
		param.put("pthumbBodyType", "thumb");
		int thumbImageCount = productService.getProductImageCount(param);
		model.addAttribute("thumbImageCount", thumbImageCount);
		
		param.put("pthumbBodyType", "body");
		int bodyImageCount = productService.getProductImageCount(param);
		model.addAttribute("bodyImageCount", bodyImageCount);
		
		HashMap<String, List<String>> productOption = productService.getProductOptionMap(pid);
		model.addAttribute("productOption", productOption);
		
		return "product/product_detail";
	}
	
	@RequestMapping("/product_list")
	public String product_list(Model model, String pcategoryName, String pid) {
		if(pcategoryName == null) {
			List<Product> productList = productService.getProductCategoryListAll();
			model.addAttribute("productList", productList);
		} else {
			List<Product> productList = productService.selectByPcategoryName(pcategoryName);
			model.addAttribute("productList", productList);
		}
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		
		param.put("pthumbBodyType", "thumb");
		int thumbImageCount = productService.getProductImageCount(param);
		model.addAttribute("thumbImageCount", thumbImageCount);
		
		param.put("pthumbBodyType", "body");
		int bodyImageCount = productService.getProductImageCount(param);
		model.addAttribute("bodyImageCount", bodyImageCount);
		
		HashMap<String, List<String>> productOption = productService.getProductOptionMap(pid);
		model.addAttribute("productOption", productOption);
		
		if(pcategoryName != null) {
			model.addAttribute("pcategoryName", pcategoryName);
		}else {
			model.addAttribute("pcategoryName", "");
		}
		
		return "/product/product_list";
	}
	
	// 전체 상품 조회
	@GetMapping("/getProductListAllAjax")
	public String getProductListAll(Model model) {
		List<Product> productList = productService.getProductCategoryListAll();
		model.addAttribute("productList", productList);
		return "product/getProductListAllAjax";
	}
	
	// 카테고리별 상품 조회
	@GetMapping("/getProductListAjax")
	public String getProductList(Model model, @RequestParam("pcategoryName") String pcategoryName) {
		List<Product> productList = productService.selectByPcategoryName(pcategoryName);
		model.addAttribute("productList", productList);
		return "product/getProductListAjax";
	}
	
	@GetMapping("/productImageDownload")
	public void productImageDownload(String pid, int index, String pthumbBodyType, HttpServletResponse response) throws Exception {
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		param.put("index", String.valueOf(index));
		param.put("pthumbBodyType", pthumbBodyType);
		Pimage pimage = productService.getPimage(param);
		byte[] data = productService.getProductImageData(param);
		
		response.setContentType(pimage.getPimageType());
		String fileName = new String(pimage.getPimageName().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");

		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}                                      
}
