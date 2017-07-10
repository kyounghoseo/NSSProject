package com.nss.manager.productvo;

import org.springframework.web.multipart.MultipartFile;

import com.nss.manager.common.PagingVO;


public class ProductVO extends PagingVO {

	private int productNo;
	private String productName;
	private String productCategory;
	private String productCode;
	private int productPrice;
	private String productColor;
	private String productMainImage;
	private String productDetailImage1;
	private String productDetailImage2;
	private String productInfo;
	private String productFile;

	private String search = "";
	private String keyword = "";
	
	private String category_check;

	
	private MultipartFile mainImage;
	private MultipartFile detailImage1;
	private MultipartFile detailImage2;
	private MultipartFile file;
	
	
	public MultipartFile getMainImage() {
		return mainImage;
	}

	public void setMainImage(MultipartFile mainImage) {
		this.mainImage = mainImage;
	}

	public MultipartFile getDetailImage1() {
		return detailImage1;
	}

	public void setDetailImage1(MultipartFile detailImage1) {
		this.detailImage1 = detailImage1;
	}

	public MultipartFile getDetailImage2() {
		return detailImage2;
	}

	public void setDetailImage2(MultipartFile detailImage2) {
		this.detailImage2 = detailImage2;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductColor() {
		return productColor;
	}

	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}

	public String getProductMainImage() {
		return productMainImage;
	}

	public void setProductMainImage(String productMainImage) {
		this.productMainImage = productMainImage;
	}

	public String getProductDetailImage1() {
		return productDetailImage1;
	}

	public void setProductDetailImage1(String productDetailImage1) {
		this.productDetailImage1 = productDetailImage1;
	}

	public String getProductDetailImage2() {
		return productDetailImage2;
	}

	public void setProductDetailImage2(String productDetailImage2) {
		this.productDetailImage2 = productDetailImage2;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductFile() {
		return productFile;
	}

	public void setProductFile(String productFile) {
		this.productFile = productFile;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getCategory_check() {
		return category_check;
	}

	public void setCategory_check(String category_check) {
		this.category_check = category_check;
	}

}
