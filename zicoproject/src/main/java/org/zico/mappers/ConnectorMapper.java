package org.zico.mappers;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.zico.domain.Connector;

public interface ConnectorMapper extends CRUDMapper{

	@Select("select connector_store_no from connector where connector_id = #{cid}")
	public Integer select(String cid);
	
	@Insert("insert into connector values(#{csno}, #{cid})")
	public void create(Connector connector);

	@Delete("delete from connector where connector_id = #{cid}")
	public void delete(String cid);
	
}
