package com.it.herb.product.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDAO {
	List<ProductVO> selectProductByEvent(String eventName);
	ProductVO selectProductByNo(int produtNo);
	List<ProductVO> selectProductByCategory(int categoryNo);
	
}
