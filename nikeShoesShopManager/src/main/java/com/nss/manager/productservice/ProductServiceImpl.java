package com.nss.manager.productservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.productdao.ProductDao;
import com.nss.manager.productvo.ProductVO;


@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		// TODO Auto-generated method stub
		List<ProductVO> proList = null;
		proList = productDao.productList(pvo);
		return proList;
	}

	@Override
	public int productInsert(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.productInsert(pvo);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.productDetail(pvo);
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("서비스");
		System.out.println(pvo.getProductCategory()+"카테고리");
		System.out.println(pvo.getProductCode()+"코드");
		System.out.println(pvo.getProductNo()+"넘버");
		int result = 0;
		result = productDao.productUpdate(pvo);
		System.out.println(result);
		return result;
	}

	@Override
	public int productDelete(int productNo) {
		// TODO Auto-generated method stub
		
		System.out.println("딜리트 서비스");
		int result = 0;
		result = productDao.productDelete(productNo);
		return result;
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		
		return productDao.productListCnt(pvo);
	}
	
	

}
