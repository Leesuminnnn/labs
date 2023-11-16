package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;

@Repository
public class EvaluationDao {

	//1 : hwtools, 2 : counselman 3: 서버 이관(csworktools2)
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession3")
	private SqlSession sqlSession3;
	
	public static final String MAPPER = "evaluation";
	
	public int login(UsersVo vo) throws Exception {
//		return sqlSession1.selectOne(MAPPER+".login", vo);
		return sqlSession3.selectOne(MAPPER+".login", vo);
	}

	public UsersVo info2(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".info2", vo);
		return sqlSession3.selectOne(MAPPER+".info2", vo);
	}
	
	public UsersVo info(int idx) {
//		return sqlSession1.selectOne(MAPPER+".info", idx);
		return sqlSession3.selectOne(MAPPER+".info", idx);
	}

	public int pwdinsert(Map<String, Object> map ) {
		System.out.println("##########################DAO");
//		return sqlSession1.update(MAPPER+".pwdinsert", map);
		return sqlSession3.update(MAPPER+".pwdinsert", map);
	}

	public List<UsersVo> evaluationtarget(Map<String, Object> map) {
		System.out.println("########################DAO 코드");
		System.out.println(map);
		System.out.println("########################DAO 코드");
//		return sqlSession1.selectList(MAPPER+".evaluationtarget", map);
		return sqlSession3.selectList(MAPPER+".evaluationtarget", map);
	}

	public List<UsersVo> BTlist(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".BTlist",map);
		return sqlSession3.selectList(MAPPER+".BTlist",map);
	}

	public List<UsersVo> BFlist(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".BFlist",map);
		return sqlSession3.selectList(MAPPER+".BFlist",map);
	}

	public List<EvaluationVo> evList(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".evList", map);
		return sqlSession3.selectList(MAPPER+".evList", map);
	}

	public int frominsert(Map<String, Object> map) {
//		return sqlSession1.insert(MAPPER+".forminsert", map);
		return sqlSession3.insert(MAPPER+".forminsert", map);
	}

	public int whether(Map<String, Object> map2) {
//		return sqlSession1.insert(MAPPER+".whether", map2);
		return sqlSession3.insert(MAPPER+".whether", map2);
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".noticeselect", map);
		return sqlSession3.selectList(MAPPER+".noticeselect", map);
	}

	public int loginlog(Map<String, Object> map) {
//		return sqlSession1.insert(MAPPER+".loginlog", map);
		return sqlSession3.insert(MAPPER+".loginlog", map);
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".whetherselect", map);
		return sqlSession3.selectList(MAPPER+".whetherselect", map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
//		return sqlSession1.selectOne(MAPPER+".formcheck", map);
		return sqlSession3.selectOne(MAPPER+".formcheck", map);
	}

	public int dbcheck(UsersVo vo) {
		
//		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
	}

	public List<UsersVo> users(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".users", map);
	}
	
	public List<UsersVo> users1(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".users1", map);
	}
	
	public List<UsersVo> users2(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".users2", map);
	}
	
	public List<UsersVo> users3(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".users3", map);
	}

	public List<LoginlogVo> log(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".log", map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
		return sqlSession3.selectList(MAPPER+".ph", map);
	}
}
