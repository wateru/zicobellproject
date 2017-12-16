package org.zico.mappers;

public interface CRUDMapper<E, K> {

	public void create(E vo);
	public E read(K key);
	public void update(E vo);
	public void delete(K key);
	
}
