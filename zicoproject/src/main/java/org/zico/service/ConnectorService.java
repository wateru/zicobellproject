package org.zico.service;

import org.zico.domain.Connector;

public interface ConnectorService {
	public void create(Connector connector);
	public void delete(String cid);
	public Integer getStore(String cid);
}
