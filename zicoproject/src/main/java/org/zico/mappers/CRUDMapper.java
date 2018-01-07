package org.zico.mappers;

import java.util.List;

import org.zico.dto.Criteria;

public interface CRUDMapper<E, K> {

	public void create(E vo);
	public E read(K key);
	public void update(E vo);
	public void delete(K key);
	public List<E> list(Criteria cri);
	public List<E> menulist(Criteria cri);
	public int count();
	public int last();
	public E orderlist(E vo);
	public List<E> orderDetailList(E vo);
	public int comparisonCount(E vo);
	public int orderNoSelect(E vo);
	
	
}
