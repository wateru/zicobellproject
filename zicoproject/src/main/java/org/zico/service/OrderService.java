package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface OrderService {
	
	public List<Store> getList(Criteria cri);
	public int getListCount();
	public List<Menu> getMenuList(Criteria cri);
	public int getMenuListCount();
	public int insert(Order order);
	public void detailInsert(OrderDetail detail);
	public Order orderList(Order order);
	public List<OrderDetail> orderDetailList(OrderDetail detail);
	public int comparisonCount(Order order);
	public void orderUpdate(Order order);
	public int orderNoSelect(Order order);
	public void detailDelete(int orderNo);


}
