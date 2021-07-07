package com.it.herb.product.model;

import java.util.List;

public interface ProductService {
	List<ProductVO> selectProductByEvent(String eventName);
	ProductVO selectProductByNo(int produtNo);
	List<ProductVO> selectProductByCategory(int categoryNo);
	
}
