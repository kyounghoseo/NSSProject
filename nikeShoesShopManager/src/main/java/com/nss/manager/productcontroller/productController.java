package com.nss.manager.productcontroller;


import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nss.manager.common.Paging;
import com.nss.manager.common.Util;
import com.nss.manager.productfileupload.FileUploadUtil;
import com.nss.manager.productservice.ProductService;
import com.nss.manager.productvo.ProductVO;



@Controller
@RequestMapping(value="/product")
public class productController {
	
	Logger logger = Logger.getLogger(productController.class);
	
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping(value="/productList" , method=RequestMethod.GET)
	public String boardList(@ModelAttribute ProductVO pvo, Model model){
		System.out.println("productList 들어옴");
		
		Paging.setPage(pvo);
		System.out.println("페이지="+pvo.getPage());
		System.out.println("페이지 사이즈="+pvo.getPageSize());
		int total = productService.productListCnt(pvo);
		System.out.println("total="+total);
		int count = total-(Util.nvl(pvo.getPage())-1)*Util.nvl(pvo.getPageSize());
		System.out.println("count="+count);
		
		
		List<ProductVO> productList = productService.productList(pvo);
		
		model.addAttribute("productList",productList);
		model.addAttribute("count",count);
		model.addAttribute("data",pvo);
		model.addAttribute("total",total);
		return "product/productList";
		
	}
	
	
	@RequestMapping(value="/insertForm")
	public String productForm(HttpSession session){
		
		System.out.println("insertForm 드러오니");
		
		session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
		logger.info("CSRF_TOKEN :" + UUID.randomUUID().toString());
		
		
		return "product/productInsert";
		
	}
	
	
	@RequestMapping(value="/productInsert",method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute ProductVO pvo, HttpServletRequest request) throws IOException,IllegalStateException{
		System.out.println("productinsert!!!!!");
		logger.info("productinsert 들어오니");
		String mainImage= FileUploadUtil.FileUpload(pvo.getMainImage(), request);
		String detailImage1= FileUploadUtil.FileUpload(pvo.getDetailImage1(), request);
		String detailImage2= FileUploadUtil.FileUpload(pvo.getDetailImage2(), request);
		String file = FileUploadUtil.FileUpload(pvo.getFile(), request);
		
		pvo.setProductMainImage(mainImage);
		pvo.setProductDetailImage1(detailImage1);
		pvo.setProductDetailImage2(detailImage2);
		pvo.setProductFile(file);
		int result = 0;
		String url = "";
		
		result = productService.productInsert(pvo);
		if(result ==1){
			url = "productList.do";
		}
		
		return "redirect:"+url;
		
	}
	
	@RequestMapping(value="/productDetail",method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute ProductVO pvo,Model model){
		logger.info("productDetail 드러오니");
		
		logger.info("productNo="+pvo.getProductNo());
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		String color = detail.getProductColor().substring(0,3);
	/*	if(detail!=null){
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br>"));
		}*/
		model.addAttribute("color",color);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
		
		
	}
	
	@RequestMapping(value="/updateForm",method=RequestMethod.POST)
	public String updateForm(@ModelAttribute ProductVO pvo , Model model){
		System.out.println("updateForm 드러오니");
		System.out.println(pvo.getProductNo());
		ProductVO updateData = new ProductVO();
		updateData = productService.productDetail(pvo);
		System.out.println(updateData.getProductName());
		model.addAttribute("updateData" , updateData);
		return "product/productUpdate";
	
	}
	
	
	@RequestMapping(value="/productUpdate",method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute ProductVO pvo,HttpServletRequest request)throws IllegalStateException,IOException{
		
		System.out.println("productUpdate 드러오니");
		
		int result = 0;
		String url = "";
		System.out.println("파일"+pvo.getProductFile());
		
		
		
		if(!pvo.getMainImage().isEmpty()){
			System.out.println("mainImage = "+pvo.getMainImage());
			FileUploadUtil.fileDelete(pvo.getProductMainImage(), request);
			String mainImage= FileUploadUtil.FileUpload(pvo.getMainImage(), request);
			pvo.setProductMainImage(mainImage);
		}/*else{
			pvo.setProductMainImage("");
		}*/
		
		if(!pvo.getDetailImage1().isEmpty()){
			System.out.println("detailImage1 ="+pvo.getDetailImage1());
			FileUploadUtil.fileDelete(pvo.getProductDetailImage1(), request);
			String detailImage1= FileUploadUtil.FileUpload(pvo.getDetailImage1(), request);
			pvo.setProductDetailImage1(detailImage1);
			
		}/*else{
			pvo.setProductDetailImage1("");
		}*/
		if(!pvo.getDetailImage2().isEmpty()){
			System.out.println("detailImage2 ="+pvo.getDetailImage2());
			FileUploadUtil.fileDelete(pvo.getProductDetailImage2(), request);
			String detailImage2= FileUploadUtil.FileUpload(pvo.getDetailImage2(), request);
			pvo.setProductDetailImage2(detailImage2);
			
		}/*else{
			pvo.setProductDetailImage2("");
		}*/
		if(!pvo.getFile().isEmpty()){
			System.out.println("file ="+pvo.getFile());
			FileUploadUtil.fileDelete(pvo.getProductFile(), request);
			String file = FileUploadUtil.FileUpload(pvo.getFile(), request);
			pvo.setProductFile(file);
			
		}/*else{
			pvo.setProductFile("");
		}*/
		
		
		
		
		
		result = productService.productUpdate(pvo);
		System.out.println(result);
		if(result==1){
			
			url = "/product/productDetail.do?productNo="+pvo.getProductNo();
	
		}
		return "redirect:"+url;		
	}
	
	@RequestMapping(value="/productDelete")
	public String boardDelete(@ModelAttribute ProductVO pvo,HttpServletRequest request)throws IOException{
		
		System.out.println("딜리트넘버"+pvo.getProductNo());
		
		int result = 0;
		String url = "";
		FileUploadUtil.fileDelete(pvo.getProductMainImage(), request);
		FileUploadUtil.fileDelete(pvo.getProductDetailImage1(), request);
		FileUploadUtil.fileDelete(pvo.getProductDetailImage2(), request);
		FileUploadUtil.fileDelete(pvo.getProductFile(), request);
		
		
		result = productService.productDelete(pvo.getProductNo());
		System.out.println(result);
		if(result ==1){
			url = "/product/productList.do";
		}
		return "redirect:"+url;
				
	}

}
