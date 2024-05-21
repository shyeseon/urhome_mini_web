package com.mycompany.urihome_mini_web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.PimageDao;
import com.mycompany.urihome_mini_web.dao.ProductCategoryDao;
import com.mycompany.urihome_mini_web.dao.ProductDao;
import com.mycompany.urihome_mini_web.dao.ProductOptionDao;
import com.mycompany.urihome_mini_web.dto.Pager;
import com.mycompany.urihome_mini_web.dto.Pimage;
import com.mycompany.urihome_mini_web.dto.Product;
import com.mycompany.urihome_mini_web.dto.ProductCategory;
import com.mycompany.urihome_mini_web.dto.ProductOption;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	@Autowired
	private ProductDao productDao;

	@Autowired
	private PimageDao pimageDao;

	@Autowired
	private ProductCategoryDao categoryDao;

	@Autowired
	private ProductOptionDao poptionDao;

	public int getTotalRows() {
		int totalRows = productDao.count();
		return totalRows;
	}

	public List<Product> getProductList(Pager pager) {
		return productDao.selectByPage(pager);
	}

	public void addProduct(Product product, ProductCategory category, List<ProductOption> poptionNameList,
		 List<Pimage> pimages) {
		int productRowNum = productDao.insert(product);
		int categoryRowNum = categoryDao.insert(category);

		Iterator<ProductOption> pniter = poptionNameList.iterator();
		while (pniter.hasNext()) {
			int poptionNameRowNum = poptionDao.insert(pniter.next());
		}
		Iterator<Pimage> iter = pimages.iterator();
		while (iter.hasNext()) {
			pimageDao.insert(iter.next());
		}
	}

	public Product getProduct(String pid) {
		Product product = productDao.selectByPid(pid);
		return product;
	}
	
	public void disableProduct(Product product) {
		int productRowNum = productDao.disableByPid(product);
	}

	public void updateProduct(Product product, ProductCategory category, List<ProductOption> optionDelList,
			List<ProductOption> poptionNameList, List<Pimage> pImages) {
		int productRowNum = productDao.update(product);
		int categoryRowNum = categoryDao.update(category);
		
		if (optionDelList != null && !optionDelList.isEmpty()) {
			Iterator<ProductOption> oditer = optionDelList.iterator();
			while (oditer.hasNext()){
				int poptionNameRowNum1 = poptionDao.deleteByPidOption(oditer.next());
			}
		}
		
		Iterator<ProductOption> pniter = poptionNameList.iterator();
		while (pniter.hasNext()) {
			int poptionNameRowNum2 = poptionDao.insert(pniter.next());
		}
		
		Iterator<Pimage> iter = pImages.iterator();
		while (iter.hasNext()) {
			pimageDao.insert(iter.next());
		}
	}


	public Pimage getPimage(HashMap<String, String> param) {
		Pimage pimage = pimageDao.selectByPidAndIndex(param);
		return pimage;
	}

	public byte[] getProductImageData(HashMap<String, String> param) {
		Pimage pimage = pimageDao.selectProductImageData(param);
		return pimage.getPimageData();
	}

	public int getProductImageCount(HashMap<String, String> param) {
		return pimageDao.count(param);
	}

	public void deleteProductImageData(String pid, List<Integer> thumbList, List<Integer> bodyList) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("pid", pid);
		if (thumbList.size() > 0) {
			param.put("pthumbBodyType", "thumb");
			param.put("indexList", thumbList);
			pimageDao.deleteByPindex(param);
		}
		if (bodyList.size() > 0) {
			param.put("pthumbBodyType", "body");
			param.put("indexList", bodyList);
			pimageDao.deleteByPindex(param);
		}
	}

	public ProductCategory getProductCategory(String pid) {
		ProductCategory category = categoryDao.getProductCategoryByPid(pid);
		return category;
	}
	
	public HashMap<String, String> getProductOption(String pid) {
		List<ProductOption> poption = poptionDao.selectByPid(pid);
		
		HashMap<String, String> result = new HashMap<>();
		
		Iterator<ProductOption> iter = poption.iterator();
		while(iter.hasNext()) {
			ProductOption option = iter.next();
			String optionName =  option.getPoption();
			String optionVal = option.getPoptionValue();
			
			if(!result.containsKey(optionName)) {
				result.put(optionName, optionVal);
			}else {
				result.put(optionName, result.get(optionName)+", "+optionVal);
			}
			
		}
		return result;
	}
	
	public HashMap<String, List<String>> getProductOptionMap(String pid) {
		HashMap<String, List<String>> productOptionMap = new HashMap<>();
		List<ProductOption> poption = poptionDao.selectByPid(pid);
		
		Iterator<ProductOption> iter = poption.iterator();
		while(iter.hasNext()) {
			ProductOption option = iter.next();
			String optionName =  option.getPoption();
			String optionVal = option.getPoptionValue();
			
			if(!productOptionMap.containsKey(optionName)) {
				List<String> optionValList = new ArrayList<>();
				optionValList.add(optionVal);
				productOptionMap.put(optionName, optionValList);
			}else {
				List<String> optionValList = productOptionMap.get(optionName);
				optionValList.add(optionVal);
				productOptionMap.put(optionName, optionValList);
			}
			
		}
		
		return productOptionMap;
	}

	public List<Product> getProductCategoryListAll() {
		List<Product> productList = productDao.selectAll();
		return productList;
	}
	
	public List<Product> selectByPcategoryName(String pcategoryName) {
		List<Product> productList = productDao.selectByPcategoryName(pcategoryName);
		return productList;
	}

	public int getSales() {
		int sales = productDao.getSales();
		return sales;
	}

	public int getExpenses() {
		int expenses = productDao.getExpenses();
		return expenses;
	}

	public List<Product> getProductListByPid(String pid) {		
		List<Product> productList = productDao.getProduct(pid);
		return productList;
	}

	public List<ProductCategory> selectByPbanner(String pbanner) {
		List<ProductCategory> bannerList = categoryDao.selectByPbanner(pbanner);
		return bannerList;
	}

	public List<Product> selectProductByPbanner(String pbanner) {
		List<Product> productList = productDao.selectProductByPbanner(pbanner);
		return productList;
	}
	
}
