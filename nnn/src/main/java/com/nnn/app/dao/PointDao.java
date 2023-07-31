package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Pointdetail;
import com.nnn.app.vo.PointplusVo;

@Repository
public class PointDao {

	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;

	public static final String MAPPER = "point";

//	@Autowired
//	public PointplusDao(SqlSession sqlSession1) {
//		this.sqlSession = sqlSession1;
//	}

	public int pointplus(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".pointplus", map);
	}
	
	public int pointdetail(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".pointdetail", map);
	}

	public List<Pointdetail> pointlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".pointlist", map);
	}

	public int pointresult(Map<String, Object> map) {
		
		return sqlSession1.selectOne(MAPPER+".pointresult", map);
	}



	

	

}
