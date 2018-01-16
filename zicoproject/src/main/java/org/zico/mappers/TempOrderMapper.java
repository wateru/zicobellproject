package org.zico.mappers;


import java.util.List;

import org.zico.domain.TempOrder;


public interface TempOrderMapper extends CRUDMapper<TempOrder, Integer> {
	
	public List<TempOrder> selectOrder(Integer orderNo);
	public void updateOrder(TempOrder order);
	public void updateStatus(TempOrder order);
	public String selectStatus(Integer orderNo);
	public String getToken(TempOrder order);
}
