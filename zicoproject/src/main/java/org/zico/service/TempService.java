package org.zico.service;

import java.util.List;

import org.zico.domain.Order;
import org.zico.domain.OrderDetail;

public interface TempService {
	public List<Order> getOrder(Integer orderno);
	public List<OrderDetail> getOrderDetail(Integer orderno);
}
