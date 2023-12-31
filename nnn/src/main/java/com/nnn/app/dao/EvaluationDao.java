package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.SubVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UserVo;
import com.nnn.app.vo.UseroptionVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;

@Repository
public class EvaluationDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr
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
//		System.out.println(map);
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
//		return sqlSession1.selectList(MAPPER+".users", map);
		return sqlSession3.selectList(MAPPER+".users", map);
	}
	
	public List<UsersVo> users1(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users1", map);
		return sqlSession3.selectList(MAPPER+".users1", map);
	}
	public List<UsersVo> users1pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users1", map);
		return sqlSession3.selectList(MAPPER+".users1pwd", map);
	}
	
	public List<UsersVo> users2(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users2", map);
		return sqlSession3.selectList(MAPPER+".users2", map);
	}
	public List<UsersVo> users2pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users2", map);
		return sqlSession3.selectList(MAPPER+".users2pwd", map);
	}
	
	public List<UsersVo> users3(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users3", map);
		return sqlSession3.selectList(MAPPER+".users3", map);
	}
	public List<UsersVo> users3pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users3", map);
		return sqlSession3.selectList(MAPPER+".users3pwd", map);
	}

	public List<LoginlogVo> log(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".log", map);
		return sqlSession3.selectList(MAPPER+".log", map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".ph", map);
		return sqlSession3.selectList(MAPPER+".ph", map);
	}
	public int phOne(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".phOne", map);
		return sqlSession3.selectOne(MAPPER+".phOne", map);
	}
	
	public int pwdreset(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset", map);
		return  sqlSession3.update(MAPPER+".pwdreset", map);
	}
	public int pwdreset1(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset1", map);
		return  sqlSession3.update(MAPPER+".pwdreset1", map);
	}
	public int pwdreset2(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset2", map);
		return  sqlSession3.update(MAPPER+".pwdreset2", map);
	}
	public int pwdreset3(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset3", map);
		return  sqlSession3.update(MAPPER+".pwdreset3", map);
	}
	
	public int hsptselect1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect1", map);
		return sqlSession3.selectOne(MAPPER+".hsptselect1", map);
	}
	public int hsptselect2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect2", map);
		return sqlSession3.selectOne(MAPPER+".hsptselect2", map);
	}
	public int hsptselect3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect3", map);
		return sqlSession3.selectOne(MAPPER+".hsptselect3", map);
	}

	public int hsptselectpwd1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect1", map);
		return sqlSession3.selectOne(MAPPER+".hsptpwdselect1", map);
	}
	public int hsptselectpwd2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect2", map);
		return sqlSession3.selectOne(MAPPER+".hsptpwdselect2", map);
	}
	public int hsptselectpwd3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect3", map);
		return sqlSession3.selectOne(MAPPER+".hsptpwdselect3", map);
	}

	public List<TargetVo> target(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".target", map);
		return sqlSession3.selectList(MAPPER+".target", map);
	}

	public List<AnswerVo> answerselect(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".answerselect", map);
		return sqlSession3.selectList(MAPPER+".answerselect", map);
	}

	public int pwdajax(Map<String, Object> map) {
//		return sqlSession1.update(MAPPER+".pwdajax", map);
		return sqlSession3.update(MAPPER+".pwdajax", map);
	}

	public int targetsum(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".targetsum", map);
		return sqlSession3.selectOne(MAPPER+".targetsum", map);
	}

	public int answersum(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".answersum", map);
		return sqlSession3.selectOne(MAPPER+".answersum", map);
	}

	public int targetsum1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".targetsum1", map);
		return sqlSession3.selectOne(MAPPER+".targetsum1", map);
	}
	
	public int answersum1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".answersum1", map);
		return sqlSession3.selectOne(MAPPER+".answersum1", map);
	}

	public int targetsum2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".targetsum2", map);
		return sqlSession3.selectOne(MAPPER+".targetsum2", map);
	}
	
	public int answersum2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".answersum2", map);
		return sqlSession3.selectOne(MAPPER+".answersum2", map);
	}

	public int targetsum3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".targetsum3", map);
		return sqlSession3.selectOne(MAPPER+".targetsum3", map);
	}
	
	public int answersum3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".answersum3", map);
		return sqlSession3.selectOne(MAPPER+".answersum3", map);
	}

	public UsersVo my(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".my", vo);
		return sqlSession3.selectOne(MAPPER+".my", vo);
	}

	public int subcnt(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".subcnt", map);
		return sqlSession3.selectOne(MAPPER+".subcnt", map);
	}

	public List<UsersVo> sub(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".sub", map);
		return sqlSession3.selectList(MAPPER+".sub", map);
	}

	public List<AnswerVo> user(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".user", map);
		return sqlSession3.selectList(MAPPER+".user", map);
	}

	public List<AnswerVo> subanswerlist(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".subanswerlist", map);
		return sqlSession3.selectList(MAPPER+".subanswerlist", map);
	}

	public List<UsersVo> k(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".k", map);
		return sqlSession3.selectList(MAPPER+".k", map);
	}

	public int kcnt(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".kcnt", map);
		return sqlSession3.selectOne(MAPPER+".kcnt", map);
	}

	public List<UsersVo> klist(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".klist", map);
		return sqlSession3.selectList(MAPPER+".klist", map);
	}

	public List<AnswerVo> kuser(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".kuser", map);
		return sqlSession3.selectList(MAPPER+".kuser", map);
	}

	public List<UsersVo> klist2(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".klist2", map);
		return sqlSession3.selectList(MAPPER+".klist2", map);
	}

	public int kscnt(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".kscnt", map);
		return sqlSession3.selectOne(MAPPER+".kscnt", map);
	}

	public List<UsersVo> klistall(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".klistall", map);
		return sqlSession3.selectList(MAPPER+".klistall", map);
	}

	public Object phselect(String id) {
//		return sqlSession1.selectOne(MAPPER+".phselect", id);
		return sqlSession3.selectOne(MAPPER+".phselect", id);
	}

	public List<AnswerVo> alistall(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".alistall", map);
		return sqlSession3.selectList(MAPPER+".alistall", map);
	}
	
	public List<SubVo> subop(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".subop", map);
//		return sqlSession3.selectList(MAPPER+".subop", map);
	}

	public List<UserVo> userall(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".userall", map);
//		return sqlSession3.selectList(MAPPER+".userall", map);
	}

	public List<UseroptionVo> userop(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".userop", map);
//		return sqlSession3.selectList(MAPPER+".userop", map);
	}

	public int vmember(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".vmember", map);
		return sqlSession3.selectOne(MAPPER+".vmember", map);
	}



}
