package com.mycompany.urihome_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.urihome_mini_web.dto.Member;
import com.mycompany.urihome_mini_web.dto.Pager;
import com.mycompany.urihome_mini_web.dto.Pimage;
import com.mycompany.urihome_mini_web.dto.Product;
import com.mycompany.urihome_mini_web.dto.ProductCategory;
import com.mycompany.urihome_mini_web.dto.ProductOption;
import com.mycompany.urihome_mini_web.service.MemberService;
import com.mycompany.urihome_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/dashBoard")
	public String dashBoard(Model model, HttpServletRequest request) {
		model.addAttribute("side", "dashBoard");
		
		// 총 판매량
		int sales = productService.getSales();
		model.addAttribute("sales", sales);
		
		// 총 매출 
		int expenses = productService.getExpenses();
		model.addAttribute("expenses", expenses);
		
		// 총 회원수 조회
		int memberCount = memberService.getMemberCount();
		model.addAttribute("memberCount", memberCount);
		
		// 방문자 수 조회
		ServletContext application = request.getServletContext();
		Integer visiters = (Integer) application.getAttribute("visiters");
		
		if(visiters == null) {
			application.setAttribute("visiters", 1);
		} else {
			application.setAttribute("visiters", visiters+1);
		}
		
		return "admin/dashBoard";
	}

	@GetMapping("/productManageView")
	public String productManageView(String pageNo, Model model, HttpSession session) {
		if (pageNo == null) {
			pageNo = "1";
		}

		model.addAttribute("pageNo", pageNo);
		
		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = productService.getTotalRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		List<Product> productList = productService.getProductList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		model.addAttribute("side", "productManage");
		return "admin/productManageView";
	}

	@GetMapping("/productManageTable")
	public String productManageTable(String pageNo, Model model, HttpSession session) {
		model.addAttribute("pageNo", pageNo);

		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = productService.getTotalRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		List<Product> productList = productService.getProductList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);
		return "admin/productManageTable";
	}
	
	
	@GetMapping("/addProductInfoView")
	public String addProductInfoView(Model model) {
		model.addAttribute("side", "productManage");
		return "admin/addProductInfoView";
	}

	@PostMapping("/addProduct")
	@ResponseBody
	public String addProduct(Product product, ProductCategory category, 
			@RequestParam("pthumbnailImage") MultipartFile[] thumbFiles,
			@RequestParam("pbodyImage") MultipartFile[] bodyFiles,
			@RequestParam("product") JSONObject p) {

		String pid = (String) p.get("pid");
		String pname = (String) p.get("pname");
		int pprice = (int) p.get("pprice");
		int pstock = (int) p.get("pstock");
		String pcategoryName = (String) p.get("pcategoryName");
		String pbanner = (String) p.get("banner");
		String pstatus = (String) p.get("pstatus");
		
		product.setPid(pid);
		product.setPname(pname);
		product.setPprice(pprice);
		product.setPstock(pstock);
		product.setPstatus(pstatus);

		category.setPid(pid);
		category.setPcategoryName(pcategoryName);
		category.setPbanner(pbanner);
		
		List<ProductOption> poptionList = new ArrayList<>();
		JSONArray optionNames = (JSONArray) p.get("optionNames");
		JSONArray optionVals = (JSONArray) p.get("optionVals");
		
		for (int i = 0; i < optionNames.length(); i++) {
			String optionName = optionNames.getString(i);
			JSONArray optionVal = optionVals.getJSONArray(i);
			for(int j = 0; j < optionVal.length(); j++) {
				ProductOption poption = new ProductOption();
				poption.setPid(pid);
				poption.setPoption(optionName);
				poption.setPoptionValue(optionVal.getString(j));
				poptionList.add(poption); 
			}
		}
				
		List<Pimage> pimages = new ArrayList<Pimage>();
		if (thumbFiles != null || bodyFiles != null) {
			for (MultipartFile img : thumbFiles) {
				Pimage pimage = new Pimage();
				pimage.setPid(product.getPid());
				pimage.setPimageName(img.getOriginalFilename());
				pimage.setPimageType(img.getContentType());
				pimage.setPthumbBodyType("thumb");
				try {
					pimage.setPimageData(img.getBytes());
				} catch (IOException e) {
				}

				pimages.add(pimage);
			}
			for (MultipartFile img : bodyFiles) {
				Pimage pimage = new Pimage();
				pimage.setPid(product.getPid());
				pimage.setPimageName(img.getOriginalFilename());
				pimage.setPimageType(img.getContentType());
				pimage.setPthumbBodyType("body");
				try {
					pimage.setPimageData(img.getBytes());
				} catch (IOException e) {
				}

				pimages.add(pimage);
			}
		}

		productService.addProduct(product, category, poptionList, pimages);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}

	@GetMapping("/productUpdateView")
	public String productUpdateView(String pid, Model model) {
		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		param.put("pthumbBodyType", "thumb");
		Product product = productService.getProduct(pid);
		int thumbImageCount = productService.getProductImageCount(param);
		param.put("pthumbBodyType", "body");
		int bodyImageCount = productService.getProductImageCount(param);

		ProductCategory category = productService.getProductCategory(pid);
		HashMap<String, String> poptions = productService.getProductOption(pid);
		
		model.addAttribute("thumbImageCount", thumbImageCount);
		model.addAttribute("bodyImageCount", bodyImageCount);
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		model.addAttribute("poptions", poptions);
		model.addAttribute("side", "productManage");
		return "admin/productUpdateView";
	}

	@PostMapping("/updateProduct")
	@ResponseBody
	public String updateProduct(Product product, ProductCategory category,
			@RequestParam(value = "pthumbnailImage", required = false) MultipartFile[] pthumbnailImage,
			@RequestParam(value = "pbodyImage", required = false) MultipartFile[] pbodyImage,
			@RequestParam("product") JSONObject p) {

		String pid = (String) p.get("pid");
		String pname = (String) p.get("pname");
		int pprice = (int) p.get("pprice");
		int pstock = (int) p.get("pstock");
		String pstatus = (String) p.get("pstatus");

		product.setPid(pid);
		product.setPname(pname);
		product.setPprice(pprice);
		product.setPstock(pstock);
		product.setPstatus(pstatus);

		String pcategoryName = (String) p.get("pcategoryName");
		String pbanner = (String) p.get("pbanner");

		category.setPid(pid);
		category.setPcategoryName(pcategoryName);
		category.setPbanner(pbanner);
		
		JSONArray optionDel = (JSONArray) p.get("optionDel");
		List<ProductOption> optionDelList = new ArrayList<>();
		for (int i = 0; i < optionDel.length(); i++) {
			String option = optionDel.getString(i);
			ProductOption poption = new ProductOption();
			poption.setPid(pid);
			poption.setPoption(option);
			optionDelList.add(poption);
		}

		List<ProductOption> poptionList = new ArrayList<>();
		JSONArray optionNames = (JSONArray) p.get("optionNames");
		JSONArray optionVals = (JSONArray) p.get("optionVals");
		
		for (int i = 0; i < optionNames.length(); i++) {
			String optionName = optionNames.getString(i);
			JSONArray optionVal = optionVals.getJSONArray(i);
			for(int j = 0; j < optionVal.length(); j++) {
				ProductOption poption = new ProductOption();
				poption.setPid(pid);
				poption.setPoption(optionName);
				poption.setPoptionValue(optionVal.getString(j));
				poptionList.add(poption);
			}
		}
		
		JSONArray thumbArr = (JSONArray) p.get("thumbDel");
		List<Integer> thumbList = new ArrayList<>();
		for (int i = 0; i < thumbArr.length(); i++) {
			Integer obj = thumbArr.getInt(i);
			thumbList.add(obj);
		}

		JSONArray bodyArr = (JSONArray) p.get("bodyDel");
		List<Integer> bodyList = new ArrayList<>();
		for (int i = 0; i < bodyArr.length(); i++) {
			Integer obj = bodyArr.getInt(i);
			bodyList.add(obj);
		}

		List<Pimage> pimages = new ArrayList<Pimage>();
		productService.deleteProductImageData(pid, thumbList, bodyList);

		HashMap<String, String> param = new HashMap<>();
		param.put("pid", pid);
		param.put("pthumbBodyType", "thumb");

		if (pthumbnailImage != null) {
			for (MultipartFile img : pthumbnailImage) {
				Pimage pimage = new Pimage();
				pimage.setPid(product.getPid());
				pimage.setPimageName(img.getOriginalFilename());
				pimage.setPimageType(img.getContentType());
				pimage.setPthumbBodyType("thumb");
				try {
					pimage.setPimageData(img.getBytes());
				} catch (IOException e) {
				}

				pimages.add(pimage);
			}
		}
		if (pbodyImage != null) {
			for (MultipartFile img : pbodyImage) {
				Pimage pimage = new Pimage();
				pimage.setPid(product.getPid());
				pimage.setPimageName(img.getOriginalFilename());
				pimage.setPimageType(img.getContentType());
				pimage.setPthumbBodyType("body");
				try {
					pimage.setPimageData(img.getBytes());
				} catch (IOException e) {
				}

				pimages.add(pimage);
			}
		}

		productService.updateProduct(product, category, optionDelList, poptionList, pimages);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}

	@PostMapping("/disableProduct")
	@ResponseBody
	public String disableProduct(@RequestBody Product product) {
		productService.disableProduct(product);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.append("result", "success");
		
		return "redirect:/admin/productManageView";
	}
	
	//회원 관리 뷰
	@GetMapping("/customerManageView")
	public String customerManageView(String pageNo, Model model, HttpSession session) {
		if (pageNo == null) {
			pageNo = "1";
		}

		model.addAttribute("pageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = memberService.getTotalRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		List<Member> memberList = memberService.getMemberList(pager);

		model.addAttribute("pager", pager);
		model.addAttribute("memberList", memberList);
		model.addAttribute("side", "customerManage");
		return "admin/customerManageView";
	}
	
	@GetMapping("/userInfoView")
	public String userInfoView(String mid, Model model) {	
		
		Member userInfo = memberService.getMember(mid); // 실제로는 DB에서 회원 정보를 조회하는 메서드를 호출합니다.
        model.addAttribute("member", userInfo); // 모델에 회원 정보를 추가합니다.
		model.addAttribute("side", "customerManage");

        
		return "admin/userInfoView";
	}	

	@GetMapping("/productImageDownload")
	public void productImageDownload(String pid, int index, String pthumbBodyType, HttpServletResponse response)
			throws Exception {
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
