package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface StoreMapper extends CRUDMapper<Store, Integer>{

	// 매장 전체 목록
	@Select("select * from store order by storeno desc limit #{skip}, #{size}")
	public List<Store> getStore(Criteria cri);
	
	// 전체 매장 수
	@Select("select count(storeno) from store")
	public int getTotal(Criteria cri);
	
}

