package com.nss.manager.ordervo;

import com.nss.manager.common.PagingVO;

public class OrderVO extends PagingVO {

	private int orderNO;
	private int productNO;
	private int customerNO;
	private String orderPrname;
	private String orderCsid;
	private int orderCount;
	private int orderPrice;
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

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
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

	@Override
	public String toString() {
		return "OrderVO [orderNO=" + orderNO + ", productNO=" + productNO + ", customerNO=" + customerNO
				+ ", orderPrname=" + orderPrname + ", orderCsid=" + orderCsid + ", orderCount=" + orderCount
				+ ", orderPrice=" + orderPrice + ", orderColor=" + orderColor + ", orderCsname=" + orderCsname
				+ ", orderCellphone=" + orderCellphone + ", orderAddress=" + orderAddress + ", orderStatus="
				+ orderStatus + ", orderPayment=" + orderPayment + ", orderDate=" + orderDate + ", orderShipno="
				+ orderShipno + ", orderShipdate=" + orderShipdate + ", orderSize=" + orderSize + ", order_check="
				+ order_check + ", getOrderNO()=" + getOrderNO() + ", getProductNO()=" + getProductNO()
				+ ", getCustomerNO()=" + getCustomerNO() + ", getOrderPrname()=" + getOrderPrname()
				+ ", getOrderCount()=" + getOrderCount() + ", getOrderPrice()=" + getOrderPrice() + ", getOrderColor()="
				+ getOrderColor() + ", getOrderCsname()=" + getOrderCsname() + ", getOrderCellphone()="
				+ getOrderCellphone() + ", getOrderAddress()=" + getOrderAddress() + ", getOrderStatus()="
				+ getOrderStatus() + ", getOrderPayment()=" + getOrderPayment() + ", getOrderDate()=" + getOrderDate()
				+ ", getOrderShipno()=" + getOrderShipno() + ", getOrderShipdate()=" + getOrderShipdate()
				+ ", getOrderSize()=" + getOrderSize() + ", getOrderCsid()=" + getOrderCsid() + ", getOrder_check()="
				+ getOrder_check() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
