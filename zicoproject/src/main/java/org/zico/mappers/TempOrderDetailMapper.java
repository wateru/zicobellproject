package org.zico.mappers;

import java.util.List;

import org.zico.domain.TempOrderDetail;

public interface TempOrderDetailMapper extends CRUDMapper<TempOrderDetail, Integer>{

	public List<TempOrderDetail> selectOrderDetail(Integer orderno);
	public void updateDetail(TempOrderDetail orderDetail);
	public void deleteDetail(TempOrderDetail orderDetail);
	
}
