package org.zico.service;

import java.util.List;

import org.zico.domain.Notice;
import org.zico.dto.Criteria;

public interface NoticeService {
	public Notice get(Integer nno);
	public List<Notice> getList(Criteria cri);
	public void add(Notice notice);
	public void remove(Integer nno);
	public void modify(Notice notice);
	public void addHits(Integer nno);
	public Integer getDetailCount();
}
