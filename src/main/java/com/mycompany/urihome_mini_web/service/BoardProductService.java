package com.mycompany.urihome_mini_web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.BoardProductDao;
import com.mycompany.urihome_mini_web.dto.BoardProduct;

@Service
public class BoardProductService {
	// 이름으로 bean 지정
	@Resource
	private BoardProductDao boardProductDao;
	
	public void writeBoardProduct(BoardProduct boardProduct) {
		int rowNum = boardProductDao.insert(boardProduct);
	}
	
	// 페이지 가져오기
	public List<BoardProduct> getBoardProductList(HashMap<String, Object> param) {
		List<BoardProduct> boardProductList = boardProductDao.selectByPage(param);
		return boardProductList;
	}
	
	// 전체 행수를 가져옴
	public int getTotalRows(HashMap<String,String> param) {
		int totalRows = boardProductDao.count(param);
		return totalRows;
	}

	// 작성한 리뷰를 가져옴
	public BoardProduct getBoardProduct(int bpnumber) {
		BoardProduct review = boardProductDao.selectByBpno(bpnumber);
		return review;
	}

	public void removeBoardProduct(int bpnumber) {
		int rowReview = boardProductDao.deleteByBpno(bpnumber);
	}

	public void updateBoardProduct(BoardProduct boardProduct) {
		int rowReview = boardProductDao.updateByBpno(boardProduct);
	}

	public BoardProduct getBoardProductImage(int bpnumber) {
		BoardProduct boardProduct = boardProductDao.selectImageByBpno(bpnumber);
		return boardProduct;
	}

	public byte[] getBoardProductImageData(int bpnumber) {
		BoardProduct boardProduct = boardProductDao.selectImageDataByBpno(bpnumber);
		return boardProduct.getBpattachdata();
	}
	
}
