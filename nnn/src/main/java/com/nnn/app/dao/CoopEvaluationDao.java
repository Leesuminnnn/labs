package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.CAnswerVo;
import com.nnn.app.vo.CWhetherVo;
import com.nnn.app.vo.CoopusersVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;

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
		return sqlSession1.update(MAPPER+".pwdinsert", map);
//		return sqlSession3.update(MAPPER+".pwdinsert", map);
	}

	public List<CoopusersVo> coopevaluationtarget(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".coopevaluationtarget", map);
//		return sqlSession3.selectList(MAPPER+".coopevaluationtarget", map);
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

	public List<CWhetherVo> whetherSelect(Map<String, Object> map) {
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
	public List<CoopusersVo> user(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user", map);
//		return sqlSession3.selectList(MAPPER+".users", map);
	}
	public List<CoopusersVo> users(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users", map);
//		return sqlSession3.selectList(MAPPER+".users", map);
	}
	
	public List<CoopusersVo> user1(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user1", map);
//		return sqlSession3.selectList(MAPPER+".user1", map);
	}
	public List<CoopusersVo> user2(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user2", map);
//		return sqlSession3.selectList(MAPPER+".user2", map);
	}
	public List<CoopusersVo> user3(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user3", map);
//		return sqlSession3.selectList(MAPPER+".user3", map);
	}
	public List<CoopusersVo> user4(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user4", map);
//		return sqlSession3.selectList(MAPPER+".user4", map);
	}
	public List<CoopusersVo> user5(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user5", map);
//		return sqlSession3.selectList(MAPPER+".user5", map);
	}
	public List<CoopusersVo> user6(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user6", map);
//		return sqlSession3.selectList(MAPPER+".user6", map);
	}
	public List<CoopusersVo> user7(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".user7", map);
//		return sqlSession3.selectList(MAPPER+".user7", map);
	}
	
	public List<CoopusersVo> users1pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1pwd", map);
	}
	public List<CoopusersVo> users2pwd(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2pwd", map);
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
		return sqlSession1.selectOne(MAPPER+".phOne", map);
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

	public int usercnt1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt1", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt1", map);
	}
	public int usercnt2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt2", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt2", map);
	}
	public int usercnt3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt3", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt3", map);
	}
	public int usercnt4(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt4", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt4", map);
	}
	public int usercnt5(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt5", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt5", map);
	}
	public int usercnt6(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt6", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt6", map);
	}
	public int usercnt7(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".usercnt7", map);
//		return sqlSession3.selectOne(MAPPER+".usercnt7", map);
	}
	
	public int userpwd1(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd1", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd1", map);
	}
	public int userpwd2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd2", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd2", map);
	}
	public int userpwd3(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd3", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd3", map);
	}
	public int userpwd4(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd4", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd4", map);
	}
	public int userpwd5(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd5", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd5", map);
	}
	public int userpwd6(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd6", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd6", map);
	}
	public int userpwd7(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".userpwd7", map);
//		return sqlSession3.selectOne(MAPPER+".userpwd7", map);
	}

	public List<TargetVo> target(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target", map);
//		return sqlSession3.selectList(MAPPER+".target", map);
	}
	public List<TargetVo> target1(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target1", map);
//		return sqlSession3.selectList(MAPPER+".target1", map);
	}
	public List<TargetVo> target2(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target2", map);
//		return sqlSession3.selectList(MAPPER+".target2", map);
	}
	public List<TargetVo> target3(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target3", map);
//		return sqlSession3.selectList(MAPPER+".target3", map);
	}
	public List<TargetVo> target4(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target4", map);
//		return sqlSession3.selectList(MAPPER+".target4", map);
	}
	public List<TargetVo> target5(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target5", map);
//		return sqlSession3.selectList(MAPPER+".target5", map);
	}
	public List<TargetVo> target6(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target6", map);
//		return sqlSession3.selectList(MAPPER+".target6", map);
	}
	public List<TargetVo> target7(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".target7", map);
//		return sqlSession3.selectList(MAPPER+".target7", map);
	}

	public List<CAnswerVo> answerselect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect", map);
//		return sqlSession3.selectList(MAPPER+".answerselect", map);
	}
	public List<CAnswerVo> answerselect1(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect1", map);
//		return sqlSession3.selectList(MAPPER+".answerselect1", map);
	}
	public List<CAnswerVo> answerselect2(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect2", map);
//		return sqlSession3.selectList(MAPPER+".answerselect2", map);
	}
	public List<CAnswerVo> answerselect3(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect3", map);
//		return sqlSession3.selectList(MAPPER+".answerselect3", map);
	}
	public List<CAnswerVo> answerselect4(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect4", map);
//		return sqlSession3.selectList(MAPPER+".answerselect4", map);
	}
	public List<CAnswerVo> answerselect5(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect5", map);
//		return sqlSession3.selectList(MAPPER+".answerselect5", map);
	}
	public List<CAnswerVo> answerselect6(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect6", map);
//		return sqlSession3.selectList(MAPPER+".answerselect6", map);
	}
	public List<CAnswerVo> answerselect7(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".answerselect7", map);
//		return sqlSession3.selectList(MAPPER+".answerselect7", map);
	}

	public int pwdajax(Map<String, Object> map) {
		return sqlSession1.update(MAPPER+".pwdajax", map);
//		return sqlSession3.update(MAPPER+".pwdajax", map);
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
	
	public int targetsum4(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum4", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum4", map);
	}

	public int answersum4(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum4", map);
//		return sqlSession3.selectOne(MAPPER+".answersum4", map);
	}
	
	public int targetsum5(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum5", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum5", map);
	}

	public int answersum5(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum5", map);
//		return sqlSession3.selectOne(MAPPER+".answersum5", map);
	}
	
	public int targetsum6(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum6", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum6", map);
	}

	public int answersum6(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum6", map);
//		return sqlSession3.selectOne(MAPPER+".answersum6", map);
	}
	
	public int targetsum7(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".targetsum7", map);
//		return sqlSession3.selectOne(MAPPER+".targetsum7", map);
	}

	public int answersum7(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".answersum7", map);
//		return sqlSession3.selectOne(MAPPER+".answersum7", map);
	}
	

	
}
