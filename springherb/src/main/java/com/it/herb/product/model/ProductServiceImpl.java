package com.it.herb.product.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{
	private final ProductDAO productDao;
	
	@Override
	public List<ProductVO> selectProductByEvent(String eventName) {
		return productDao.selectProductByEvent(eventName);
	}

	@Override
	public ProductVO selectProductByNo(int produtNo) {
		return productDao.selectProductByNo(produtNo);
	}

	@Override
	public List<ProductVO> selectProductByCategory(int categoryNo) {
		return productDao.selectProductByCategory(categoryNo);
	}

}






