package com.nss.manager.salesdao;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;

public interface SalesDao {

	public List<OrderVO> salesList(OrderVO ovo);

	public int salesTotalCnt(OrderVO ovo);
}
