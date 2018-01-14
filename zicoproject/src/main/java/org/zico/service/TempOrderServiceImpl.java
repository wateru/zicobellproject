package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zico.domain.Menu;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.domain.Store;
import org.zico.domain.TempOrder;
import org.zico.domain.TempOrderDetail;
import org.zico.dto.Criteria;
import org.zico.mappers.MenuMapper;
import org.zico.mappers.StoreMapper;
import org.zico.mappers.TempOrderDetailMapper;
import org.zico.mappers.TempOrderMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Service
public class TempOrderServiceImpl implements TempOrderService {

	@Autowired
	private TempOrderMapper orderMapper;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private TempOrderDetailMapper orderDetailMapper;
	
	@Override
	public List<Store> getList(Criteria cri) {
		
		return storeMapper.list(cri);
	}

	@Override
	public int getListCount() {
		
		return storeMapper.count();
	}

	@Override
	public List<Menu> getMenuList(Criteria cri) {
		// TODO Auto-generated method stub
		System.out.println("서비스 들어옴");
		return menuMapper.menulist(cri);
		
	}

	@Override
	public int getMenuListCount() {
		// TODO Auto-generated method stub
		return menuMapper.count();
	}
	//최초 주문시 인설트로 장바구니
	@Transactional
	@Override
	public int insert(TempOrder order) {
		System.out.println("욜로 들어오기는함??");
		orderMapper.create(order);
		System.out.println(orderMapper.last());
		return orderMapper.last();
	}
	//중복이 있을경우 업데이트로 장바구니
	@Override
	public void orderUpdate(TempOrder order) {
		System.out.println("jaeik : " + order);
		orderMapper.update(order);
		
		
	}
	//업데이할떄 번호를 알아야하기떄문에 검색
	@Override
	public int orderNoSelect(TempOrder order) {
		return orderMapper.orderNoSelect(order);
	}
	//새로운 장바구니를 만들기위해 기존 디테일 삭제
	@Override
	public void detailDelete(TempOrderDetail orderDetail) {
		orderDetailMapper.deleteDetail(orderDetail);
	}
	@Override
	public void delete(int orderNo) {
		orderDetailMapper.delete(orderNo);
	}

	//장바구니로 가기위해 디테일 등록
	@Override
	public void detailInsert(TempOrderDetail detail) {
		
		orderDetailMapper.create(detail);
		
		
	}

	@Override
	public TempOrder orderList(TempOrder order) {
		
		return orderMapper.orderlist(order);
	}

	@Override
	public List<TempOrderDetail> orderDetailList(TempOrderDetail detail) {

		System.out.println("디테일 조회 id :["+detail.getDetailMemberId()+"]");
		System.out.println("디테일 조회 상태:["+detail.getDetailStatus()+"]");
		System.out.println(detail.toString());
		System.out.println(orderDetailMapper.orderDetailList(detail));
		return orderDetailMapper.orderDetailList(detail);
	}

	@Override
	public int comparisonCount(TempOrder order) {
		return orderMapper.comparisonCount(order);
	}

	@Override
	public List<TempOrder> getOrder(Integer orderNo) {
		
		return orderMapper.selectOrder(orderNo);
	}

	@Override
	public List<TempOrderDetail> getOrderDetail(Integer orderNo) {
		
		return orderDetailMapper.selectOrderDetail(orderNo);
	}

	@Override
	public void modifyOrder(TempOrder order) {
		orderMapper.updateOrder(order);
	}

	@Override
	public void modifyDetailOrder(TempOrderDetail orderDetail) {
		orderDetailMapper.updateDetail(orderDetail);
	}

	@Override
	public void modifyStatus(TempOrder order) {
		orderMapper.updateStatus(order);
	}
	
	@Override
	public String getStatus(Integer orderNo) {
		return orderMapper.selectStatus(orderNo);
	}
	


}
