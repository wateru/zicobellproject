package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;
import org.zico.domain.TempOrder;
import org.zico.domain.TempOrderDetail;
import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface TempOrderService {
	
	public List<Store> getList(Criteria cri);
	public int getListCount();
	public List<Menu> getMenuList(Criteria cri);
	public int getMenuListCount();
	public int insert(TempOrder order);
	public void detailInsert(TempOrderDetail orderDetail);
	public TempOrder orderList(TempOrder order);
	public List<TempOrderDetail> orderDetailList(TempOrderDetail orderDetail);
	public int comparisonCount(TempOrder order);
	public void orderUpdate(TempOrder order);
	public int orderNoSelect(TempOrder order);
	public void detailDelete(TempOrderDetail orderDetail);
	public void delete(int orderNo);
	
	public List<TempOrder> getOrder(Integer orderNo);
	public List<TempOrderDetail> getOrderDetail(Integer orderNo);

	public void modifyOrder(TempOrder order);
	public void modifyDetailOrder(TempOrderDetail orderDetail);
	
	public void modifyStatus(TempOrder order);
	public String getStatus(Integer orderNo);
}
