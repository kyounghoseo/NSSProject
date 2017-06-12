package com.nss.manager.productservice;

import java.util.List;

import com.nss.manager.productvo.ProductVO;


public interface ProductService {

	public List<ProductVO> productList(ProductVO pvo);

	public int productInsert(ProductVO pvo);
	
	public ProductVO productDetail(ProductVO pvo);
	
	public int productUpdate(ProductVO pvo);
	
	public int productDelete(int productNo);
	
	public int productListCnt(ProductVO pvo);

}
