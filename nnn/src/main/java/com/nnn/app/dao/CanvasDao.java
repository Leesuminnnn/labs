package com.nnn.app.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.WrittenVo;

@Repository
public class CanvasDao {
	
	//1 : hwtools, 2 : counselman
//	@Resource(name="sqlSession2")
//	private SqlSession sqlSession2;
//	@Resource(name="sqlSession1")
//	private SqlSession sqlSession1;
	
	public static final String MAPPER = "canvas";
	private SqlSession sqlSession2;
	private SqlSession sqlSession1;
	@Autowired
	public CanvasDao(SqlSession sqlSession2, SqlSession sqlSession1) {
		this.sqlSession2 = sqlSession2;
		this.sqlSession1 = sqlSession1;
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
