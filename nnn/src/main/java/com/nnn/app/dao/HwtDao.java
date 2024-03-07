package com.nnn.app.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WrittenVo;

@Repository
public class HwtDao {
	
	//1 : hwtools, 2 : counselman
//	@Resource(name="sqlSession2")
//	private SqlSession sqlSession2;
//	@Resource(name="sqlSession1")
//	private SqlSession sqlSession1;
	
	public static final String MAPPER = "hwt";
	private SqlSession sqlSession2;
	private SqlSession sqlSession1;
	@Autowired
	public HwtDao(SqlSession sqlSession2, SqlSession sqlSession1) {
		this.sqlSession2 = sqlSession2;
		this.sqlSession1 = sqlSession1;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".noticeselect", map);
//		return sqlSession3.selectList(MAPPER+".noticeselect", map);
//		return sqlSession4.selectList(MAPPER+".noticeselect", map);
	}
	

	public UsersVo info2(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".info2", vo);
//		return sqlSession3.selectOne(MAPPER+".info2", vo);
//		return sqlSession4.selectOne(MAPPER+".info2", vo);
	}

	public int login(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".login", vo);
//		return sqlSession3.selectOne(MAPPER+".login", vo);
//		return sqlSession4.selectOne(MAPPER+".login", vo);
	}

	public int dbcheck(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession4.selectOne(MAPPER+".dbcheck", vo);
	}

	public UsersVo info(int idx) {
		return sqlSession1.selectOne(MAPPER+".info", idx);
//		return sqlSession3.selectOne(MAPPER+".info", idx);
//		return sqlSession4.selectOne(MAPPER+".info", idx);
	}

	public int loginlog(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".loginlog", map);
//		return sqlSession3.insert(MAPPER+".loginlog", map);
//		return sqlSession4.insert(MAPPER+".loginlog", map);
	}
//	public List<WrittenVo> list(WrittenVo writtenVo) {
//		return sqlSession1.selectList(MAPPER+".cslist", writtenVo);
//	}
	public List<WrittenVo> list(Criteria cri) {
		return sqlSession1.selectList(MAPPER+".cslist", cri);
	}
	public List<WrittenVo> listsearch(Criteria cri) {
		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public List<WrittenVo> listsearch2(Criteria cri) {
		return sqlSession1.selectList(MAPPER+".cslist", cri);
	}
	
//	public WrittenVo selectone(WrittenVo vo) {
//		return sqlSession1.selectOne(MAPPER+".selectone",vo);
//	}
	
	public WrittenVo selectone(int cs_idx) {
		return sqlSession1.selectOne(MAPPER+".selectone",cs_idx);
	}
	
	public int insert(WrittenVo vo) {
		return sqlSession1.insert(MAPPER+".insert", vo);
	}

	public List<Map<String, Object>> list2(Criteria cri) throws Exception{
		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public int Cnt(Criteria cri) {
		return sqlSession1.selectOne(MAPPER+".Cnt",cri);
	}
	
	public void update(WrittenVo vo) {
		sqlSession1.update(MAPPER+".update",vo);
	}

	public void modify(WrittenVo vo) {
		sqlSession1.update(MAPPER+".modify",vo);		
	}
}
