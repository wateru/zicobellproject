package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zico.domain.Notice;
import org.zico.dto.Criteria;

public interface NoticeMapper extends CRUDMapper<Notice, Integer>{
	
	@Update("update notice set notice_hits = notice_hits+1 where notice_no = #{nno}")
	public void updateHits(Integer nno);
}
