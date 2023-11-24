package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.GoogleuserVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.WhetherVo;
import com.nnn.app.vo.WrittenVo;

@Repository
public class TestDao {
	//1 : csworktools.cafe24.com  , 2 : counselman
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

	public int login(TestusersVo vo) throws Exception {
		return sqlSession1.selectOne(MAPPER+".login", vo);
	}

	public TestusersVo info2(TestusersVo vo) {
		return sqlSession1.selectOne(MAPPER+".info2", vo);
	}
	
	public TestusersVo info(int idx) {
		return sqlSession1.selectOne(MAPPER+".info", idx);
	}

	public int pwdinsert(Map<String, Object> map ) {
		System.out.println("##########################DAO");
		return sqlSession1.update(MAPPER+".pwdinsert", map);
	}

	public List<TestusersVo> evaluationtarget(Map<String, Object> map) {
		System.out.println("########################DAO 코드");
		System.out.println(map);
		System.out.println("########################DAO 코드");
		return sqlSession1.selectList(MAPPER+".evaluationtarget", map);
	}

	public List<TestusersVo> BTlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".BTlist",map);
	}

	public List<TestusersVo> BFlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".BFlist",map);
	}

	public List<EvaluationVo> evList(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".evList", map);
	}

	public int frominsert(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".forminsert", map);
	}

	public int whether(Map<String, Object> map2) {
		return sqlSession1.insert(MAPPER+".whether", map2);
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".noticeselect", map);
	}

	public int loginlog(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".loginlog", map);
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".whetherselect", map);
	}

	public int guserinsert(GoogleuserVo user) {
		return sqlSession1.insert(MAPPER+".guserinsert", user);
	}

	
}
