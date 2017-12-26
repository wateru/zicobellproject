package org.zico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Connector;
import org.zico.mappers.ConnectorMapper;

@Service
public class ConnectorServiceImpl implements ConnectorService{

	@Autowired
	ConnectorMapper mapper;
	
	@Override
	public void create(Connector connector) {
		// TODO Auto-generated method stub
		mapper.create(connector);
	}

	@Override
	public void delete(String cid) {
		// TODO Auto-generated method stub
		mapper.delete(cid);
	}

	@Override
	public Integer getStore(String cid) {
		// TODO Auto-generated method stub
		return mapper.select(cid);
	}
	

}
