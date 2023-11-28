package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CoopusersVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.WhetherVo;

@Repository
public class CoopEvaluationDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession3")
	private SqlSession sqlSession3;
	
	public static final String MAPPER = "coopevaluation";
	
	public int login(CoopusersVo vo) throws Exception {
		return sqlSession1.selectOne(MAPPER+".login", vo);
//		return sqlSession3.selectOne(MAPPER+".login", vo);
	}

	public CoopusersVo info2(CoopusersVo vo) {
		return sqlSession1.selectOne(MAPPER+".info2", vo);
//		return sqlSession3.selectOne(MAPPER+".info2", vo);
	}
	
	public CoopusersVo info(int idx) {
		return sqlSession1.selectOne(MAPPER+".info", idx);
//		return sqlSession3.selectOne(MAPPER+".info", idx);
	}

	public int pwdinsert(Map<String, Object> map ) {
		System.out.println("##########################DAO");
		return sqlSession1.update(MAPPER+".pwdinsert", map);
//		return sqlSession3.update(MAPPER+".pwdinsert", map);
	}

	public List<CoopusersVo> evaluationtarget(Map<String, Object> map) {
		System.out.println("########################DAO 코드");
		System.out.println(map);
		System.out.println("########################DAO 코드");
		return sqlSession1.selectList(MAPPER+".evaluationtarget", map);
//		return sqlSession3.selectList(MAPPER+".evaluationtarget", map);
	}

	public List<CoopusersVo> BTlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".BTlist",map);
//		return sqlSession3.selectList(MAPPER+".BTlist",map);
	}

	public List<CoopusersVo> BFlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".BFlist",map);
//		return sqlSession3.selectList(MAPPER+".BFlist",map);
	}

	public List<EvaluationVo> evList(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".evList", map);
//		return sqlSession3.selectList(MAPPER+".evList", map);
	}

	public int frominsert(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".forminsert", map);
//		return sqlSession3.insert(MAPPER+".forminsert", map);
	}

	public int whether(Map<String, Object> map2) {
		return sqlSession1.insert(MAPPER+".whether", map2);
//		return sqlSession3.insert(MAPPER+".whether", map2);
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".noticeselect", map);
//		return sqlSession3.selectList(MAPPER+".noticeselect", map);
	}

	public int loginlog(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".loginlog", map);
//		return sqlSession3.insert(MAPPER+".loginlog", map);
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".whetherselect", map);
//		return sqlSession3.selectList(MAPPER+".whetherselect", map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
		return sqlSession1.selectOne(MAPPER+".formcheck", map);
//		return sqlSession3.selectOne(MAPPER+".formcheck", map);
	}

	public int dbcheck(CoopusersVo vo) {
		
		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
	}

	public List<CoopusersVo> users(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users", map);
//		return sqlSession3.selectList(MAPPER+".users", map);
	}
	
	public List<CoopusersVo> users1(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1", map);
	}
	public List<CoopusersVo> users1pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1pwd", map);
	}
	
	public List<CoopusersVo> users2(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2", map);
	}
	public List<CoopusersVo> users2pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2pwd", map);
	}
	
	public List<CoopusersVo> users3(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3", map);
	}
	public List<CoopusersVo> users3pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3pwd", map);
	}

	public List<LoginlogVo> log(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".log", map);
//		return sqlSession3.selectList(MAPPER+".log", map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".ph", map);
//		return sqlSession3.selectList(MAPPER+".ph", map);
	}
	public int phOne(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".ph", map);
//		return sqlSession3.selectOne(MAPPER+".phOne", map);
	}
	
	public int pwdreset(Map<String, Object> map) {
		return  sqlSession1.update(MAPPER+".pwdreset", map);
//		return  sqlSession3.update(MAPPER+".pwdreset", map);
	}
	public int pwdreset1(Map<String, Object> map) {
		return  sqlSession1.update(MAPPER+".pwdreset1", map);
//		return  sqlSession3.update(MAPPER+".pwdreset1", map);
	}
	public int pwdreset2(Map<String, Object> map) {
		return  sqlSession1.update(MAPPER+".pwdreset2", map);
//		return  sqlSession3.update(MAPPER+".pwdreset2", map);
	}
	public int pwdreset3(Map<String, Object> map) {
		return  sqlSession1.update(MAPPER+".pwdreset3", map);
//		return  sqlSession3.update(MAPPER+".pwdreset3", map);
	}
	
	public int hsptselect1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptselect1", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect1", map);
	}
	public int hsptselect2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptselect2", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect2", map);
	}
	public int hsptselect3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptselect3", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect3", map);
	}

	public int hsptselectpwd1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptpwdselect1", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect1", map);
	}
	public int hsptselectpwd2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptpwdselect2", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect2", map);
	}
	public int hsptselectpwd3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".hsptpwdselect3", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect3", map);
	}

	public List<TargetVo> target(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target", map);
//		return sqlSession3.selectList(MAPPER+".target", map);
	}

	public List<AnswerVo> answerselect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect", map);
//		return sqlSession3.selectList(MAPPER+".answerselect", map);
	}

	public int pwdajax(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".pwdajax", map);
//		return sqlSession3.update(MAPPER+".pwdajax", map);
	}
	
	

	
}
