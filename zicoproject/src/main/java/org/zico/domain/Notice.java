package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	private Integer nno, nhits;
	private String ntitle, ncontent, nid;
	private Date regdate, updatedate;
}
