package org.zico.mappers;

import java.util.List;

import org.zico.domain.ChartOrder;
import org.zico.domain.ChartOrderDetail;
import org.zico.domain.SearchChart;

public interface ChartMapper {
	public ChartOrder selectOrder(SearchChart search);
	public List<ChartOrderDetail> selectOrderDetail(SearchChart search);
}
