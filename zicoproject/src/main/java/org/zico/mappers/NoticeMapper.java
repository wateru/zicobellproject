package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zico.domain.Notice;
import org.zico.dto.Criteria;

public interface NoticeMapper {
	@Select("select count(notice_no) from notice")
	public Integer selectDetailCount();
	
	@Select("select * from notice where notice_no = #{nno}")
	public Notice select(Integer nno);
	
	@Select("select * from notice order by notice_no desc limit #{skip}, #{size}")
	public List<Notice> selectList(Criteria cri);
	
	@Insert("insert into notice(notice_title, notice_content, nid) values(#{ntitle}, #{ncontent}, '관리자')")
	public void insert(Notice notice);
	
	@Delete("delete from notice where notice_no = #{nno}")
	public void delete(Integer nno);
	
	@Update("update notice set notice_title = #{ntitle}, notice_content = #{ncontent} where notice_no = #{nno}")
	public void update(Notice notice);
	
	@Update("update notice set notice_hits = nhits+1 where notice_no = #{nno}")
	public void updateHits(Integer nno);
}
