package org.zico.service;

import java.util.List;

import org.zico.domain.ChartOrder;
import org.zico.domain.ChartOrderDetail;
import org.zico.domain.SearchChart;

public interface ChartService {
	public ChartOrder getChartOrder(SearchChart search);
	public List<ChartOrderDetail> getChartOrderDetail(SearchChart search);
}
