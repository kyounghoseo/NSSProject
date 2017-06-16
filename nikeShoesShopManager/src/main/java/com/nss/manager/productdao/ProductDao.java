package com.nss.manager.productdao;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;
import com.nss.manager.productvo.ProductVO;

public interface ProductDao {

	public List<ProductVO> productList(ProductVO pvo);

	public int productInsert(ProductVO pvo);
	
	public ProductVO productDetail(ProductVO pvo);

	public int productUpdate(ProductVO pvo);
	
	public int productDelete(int productNo);
	
	public int productListCnt(ProductVO pvo);
	
	

}
