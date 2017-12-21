package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.zico.domain.Notice;
import org.zico.dto.Criteria;

public interface NoticeMapper {
	@Select("select count(nno) from notice")
	public Integer selectDetailCount();
	
	@Select("select * from notice where nno = #{nno}")
	public Notice select(Integer nno);
	
	@Select("select * from notice order by nno desc limit #{skip}, #{size}")
	public List<Notice> selectList(Criteria cri);
	
	@Insert("insert into notice(ntitle, ncontent, nid) values(#{ntitle}, #{ncontent}, '관리자')")
	public void insert(Notice notice);
	
	@Delete("delete from notice where nno = #{nno}")
	public void delete(Integer nno);
	
	@Update("update notice set ntitle = #{ntitle}, ncontent = #{ncontent} where nno = #{nno}")
	public void update(Notice notice);
	
	@Update("update notice set nhits = nhits+1 where nno = #{nno}")
	public void updateHits(Integer nno);
}
