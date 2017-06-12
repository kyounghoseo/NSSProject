package com.nss.manager.productdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.productvo.ProductVO;


@Repository
public class productDaoImpl implements ProductDao {

	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("ProductList",pvo);
	}

	@Override
	public int productInsert(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("ProductInsert",pvo);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return (ProductVO)session.selectOne("ProductDetail", pvo);
		
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("다오");
		return session.update("productUpdate",pvo);
	}

	@Override
	public int productDelete(int productNo) {
		// TODO Auto-generated method stub
		return session.delete("productDelete",productNo);
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("productListCnt",pvo);
	}

}
