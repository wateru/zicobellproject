package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.ChartOrder;
import org.zico.domain.ChartOrderDetail;
import org.zico.domain.SearchChart;
import org.zico.mappers.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	ChartMapper mapper;
	
	@Override
	public ChartOrder getChartOrder(SearchChart search) {
		return mapper.selectOrder(search);
	}

	@Override
	public List<ChartOrderDetail> getChartOrderDetail(SearchChart search) {
		return mapper.selectOrderDetail(search);
	}

}
