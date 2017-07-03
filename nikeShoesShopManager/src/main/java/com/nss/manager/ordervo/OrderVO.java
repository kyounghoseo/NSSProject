package com.nss.manager.ordervo;

import com.nss.manager.common.PagingVO;

public class OrderVO extends PagingVO {

	private int orderNO;
	private int productNO;
	private int customerNO;
	private String orderPrname;
	private String orderCsid;
	private String orderCount;
	private String orderPrice;
	private String orderSize;
	private String orderColor;
	private String orderCsname;
	private String orderCellphone;
	private String orderAddress;
	private String orderStatus;
	private String orderPayment;
	private String orderDate;
	private String orderShipno;
	private String orderShipdate;

	private String order_check;
	private String s_startDate;
	private String s_endDate;

	// 조건 검색시 필드
	private String keyword = "";
	private String search = "";
	private String sales_check;

	// 차트 검색시 필드
	private String chartDate;
	private int chartSales;
	private int chartRefund;

	public String getS_startDate() {
		return s_startDate;
	}

	public void setS_startDate(String s_startDate) {
		this.s_startDate = s_startDate;
	}

	public String getS_endDate() {
		return s_endDate;
	}

	public void setS_endDate(String s_endDate) {
		this.s_endDate = s_endDate;
	}

	public int getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
	}

	public int getProductNO() {
		return productNO;
	}

	public void setProductNO(int productNO) {
		this.productNO = productNO;
	}

	public int getCustomerNO() {
		return customerNO;
	}

	public void setCustomerNO(int customerNO) {
		this.customerNO = customerNO;
	}

	public String getOrderPrname() {
		return orderPrname;
	}

	public void setOrderPrname(String orderPrname) {
		this.orderPrname = orderPrname;
	}

	public String getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderColor() {
		return orderColor;
	}

	public void setOrderColor(String orderColor) {
		this.orderColor = orderColor;
	}

	public String getOrderCsname() {
		return orderCsname;
	}

	public void setOrderCsname(String orderCsname) {
		this.orderCsname = orderCsname;
	}

	public String getOrderCellphone() {
		return orderCellphone;
	}

	public void setOrderCellphone(String orderCellphone) {
		this.orderCellphone = orderCellphone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderPayment() {
		return orderPayment;
	}

	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderShipno() {
		return orderShipno;
	}

	public void setOrderShipno(String orderShipno) {
		this.orderShipno = orderShipno;
	}

	public String getOrderShipdate() {
		return orderShipdate;
	}

	public void setOrderShipdate(String orderShipdate) {
		this.orderShipdate = orderShipdate;
	}

	public String getOrderSize() {
		return orderSize;
	}

	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}

	public String getOrderCsid() {
		return orderCsid;
	}

	public void setOrderCsid(String orderCsid) {
		this.orderCsid = orderCsid;
	}

	public String getOrder_check() {
		return order_check;
	}

	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSales_check() {
		return sales_check;
	}

	public void setSales_check(String sales_check) {
		this.sales_check = sales_check;
	}

	public String getChartDate() {
		return chartDate;
	}

	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}

	public int getChartSales() {
		return chartSales;
	}

	public void setChartSales(int chartSales) {
		this.chartSales = chartSales;
	}

	public int getChartRefund() {
		return chartRefund;
	}

	public void setChartRefund(int chartRefund) {
		this.chartRefund = chartRefund;
	}

	@Override
	public String toString() {
		return "OrderVO [chartDate=" + chartDate + ", chartSales=" + chartSales + ", chartRefund=" + chartRefund + "]";
	}

}
