package org.zico.domain;

import lombok.Data;

@Data
public class Store {

	private int storeNo;
	private String storeName, storeAddr, storeTel, openTime, closeTime;
	private double lat, lng;
	
}
