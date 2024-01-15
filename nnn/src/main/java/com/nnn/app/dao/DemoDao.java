package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CAnswerVo;
import com.nnn.app.vo.CWhetherVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.ScoreVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UsersVo;

@Repository
public class DemoDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession3")
	private SqlSession sqlSession3;
	
	public static final String MAPPER = "demo";

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".noticeselect", map);
//		return sqlSession3.selectList(MAPPER+".noticeselect", map);
	}

	public UsersVo info2(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".info2", vo);
//		return sqlSession3.selectOne(MAPPER+".info2", vo);
	}

	public int login(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".login", vo);
//		return sqlSession3.selectOne(MAPPER+".login", vo);
	}

	public int dbcheck(UsersVo vo) {
		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
	}

	public UsersVo info(int idx) {
		return sqlSession1.selectOne(MAPPER+".info", idx);
//		return sqlSession3.selectOne(MAPPER+".info", idx);
	}

	public int loginlog(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".loginlog", map);
//		return sqlSession3.insert(MAPPER+".loginlog", map);
	}

	public List<UsersVo> evaluationtarget(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".evaluationtarget", map);
//		return sqlSession3.selectList(MAPPER+".evaluationtarget", map);
	}

	public List<CWhetherVo> whetherSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".whetherselect", map);
//		return sqlSession3.selectList(MAPPER+".whetherselect", map);
	}

	public int phOne(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".phOne", map);
//		return sqlSession3.selectOne(MAPPER+".phOne", map);
	}

	public int pwdinsert(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".pwdinsert", map);
//		return sqlSession3.update(MAPPER+".pwdinsert", map);
	}

	public int pwdajax(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".pwdajax", map);
//		return sqlSession3.update(MAPPER+".pwdajax", map);
	}

	public List<EvaluationVo> evList(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".evList", map);
//		return sqlSession3.selectList(MAPPER+".evList", map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
		return sqlSession1.selectOne(MAPPER+".formcheck", map);
//		return sqlSession3.selectOne(MAPPER+".formcheck", map);
	}

	public int forminsert(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".forminsert", map);
//		return sqlSession3.insert(MAPPER+".forminsert", map);
	}

	public int whether(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".whether", map);
//		return sqlSession3.insert(MAPPER+".whether", map);
	}

	public int whetherUpdate(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".whetherUpdate", map);
//		return sqlSession3.update(MAPPER+".whetherUpdate", map);
	}
	
	public List<UsersVo> users(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users", map);
//		return sqlSession3.selectList(MAPPER+".users", map);
	}

	public List<UsersVo> users1(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1", map);
	}
	public List<UsersVo> users1pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1pwd", map);
	}
	
	public List<UsersVo> users2(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2", map);
	}
	public List<UsersVo> users2pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2pwd", map);
	}
	
	public List<UsersVo> users3(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3", map);
	}
	public List<UsersVo> users3pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3pwd", map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".ph", map);
//		return sqlSession3.selectList(MAPPER+".ph", map);
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

	public List<TargetVo> target(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target", map);
//		return sqlSession3.selectList(MAPPER+".target", map);
	}

	public List<CAnswerVo> answerselect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect", map);
//		return sqlSession3.selectList(MAPPER+".answerselect", map);
	}

	public int targetsum(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum", map);
	}

	public int answersum(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum", map);
//		return sqlSession3.selectOne(MAPPER+".answersum", map);
	}

	public int targetsum1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum1", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum1", map);
	}
	
	public int answersum1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum1", map);
//		return sqlSession3.selectOne(MAPPER+".answersum1", map);
	}

	public int targetsum2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum2", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum2", map);
	}
	
	public int answersum2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum2", map);
//		return sqlSession3.selectOne(MAPPER+".answersum2", map);
	}

	public int targetsum3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum3", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum3", map);
	}
	
	public int answersum3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum3", map);
//		return sqlSession3.selectOne(MAPPER+".answersum3", map);
	}

	public int scoreInsert(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".scoreInsert", map);
//		return sqlSession3.insert(MAPPER+".scoreInsert", map);
	}

	public List<ScoreVo> scoreSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".scoreSelect", map);
//		return sqlSession3.selectList(MAPPER+".scoreSelect", map);
	}

	public CAnswerVo answerSelect(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answerSelect", map);
//		return sqlSession3.selectOne(MAPPER+".answerSelect", map);
	}

	public int formUpdate(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".formUpdate", map);
//		return sqlSession3.update(MAPPER+".formUpdate", map);
	}

	public int scoreUpdate(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".scoreUpdate", map);
//		return sqlSession3.update(MAPPER+".scoreUpdate", map);
	}
	
	
	
	
	
	
	
	
	
}
