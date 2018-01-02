package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Notice;
import org.zico.dto.Criteria;
import org.zico.mappers.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper mapper;
	
	@Override
	public Notice get(Integer tno) {
		return mapper.read(tno);
	}

	@Override
	public List<Notice> getList(Criteria cri) {
		return mapper.list(cri);
	}

	// 생성
	@Override
	public void add(Notice notice) {
		mapper.create(notice);
	}
	
	// 삭제
	@Override
	public void remove(Integer nno) {
		mapper.delete(nno);
	}

	@Override
	public void modify(Notice notice) {
		mapper.update(notice);
	}

	@Override
	public void addHits(Integer nno) {
		mapper.updateHits(nno);
	}

	@Override
	public Integer getDetailCount() {
		return mapper.count();
	}
	
}
