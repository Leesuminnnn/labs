package com.nnn.app.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.WrittenVo;

@Repository
public class TestDao {
	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	
	public static final String MAPPER = "test";

//	@Autowired
//	public CanvasDao(SqlSession sqlSession2) {
//		this.sqlSession2 = sqlSession2;
//	}

	public List<TestVo> list(TestVo vo) {
		return sqlSession1.selectList(MAPPER+".cslist", vo);
	}
	
	public List<TestVo> listsearch(Criteria cri) {
		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public int Cnt(Criteria cri) {
		return sqlSession1.selectOne(MAPPER+".cslistsearchCnt",cri);
	}
	
	public int insert(TestVo vo) {
		return sqlSession1.insert(MAPPER+".insert", vo);
	}

	public TestusersVo login(TestusersVo vo) {
		return sqlSession1.selectOne(MAPPER+".login", vo);
	}

	public TestusersVo info(int idx) {
		return sqlSession1.selectOne(MAPPER+".info", idx);
	}
}
