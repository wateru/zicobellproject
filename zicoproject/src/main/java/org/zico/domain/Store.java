package org.zico.domain;

import lombok.Data;

@Data
public class Store {

	private int sno;
	private String sname, saddr, stel, category, openTime, closeTime, simage, sid;
	private double lat, lng;
	
}
