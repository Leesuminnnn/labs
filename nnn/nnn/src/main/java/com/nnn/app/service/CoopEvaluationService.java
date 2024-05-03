package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.CoopEvaluationDao;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CAnswerVo;
import com.nnn.app.vo.CWhetherVo;
import com.nnn.app.vo.CoopusersVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;


@Service
public class CoopEvaluationService {

	private CoopEvaluationDao evaluationDao;
	
	@Autowired
	public CoopEvaluationService(CoopEvaluationDao evaluationDao) {
		this.evaluationDao = evaluationDao;
	}
	
	public int login(CoopusersVo vo) throws Exception {
		return evaluationDao.login(vo);
	}
	
	public CoopusersVo info2(CoopusersVo vo) throws Exception {
		return evaluationDao.info2(vo);
	}

	public CoopusersVo info(Integer idx) {
		return evaluationDao.info(idx);
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = evaluationDao.pwdinsert(map);
		
		return flag;
	}

	public List<CoopusersVo> coopevaluationtarget(Map<String, Object> map) {
		return evaluationDao.coopevaluationtarget(map);
	}

	public List<CoopusersVo> BTlist(Map<String, Object> map) {
		return evaluationDao.BTlist(map);
	}

	public List<CoopusersVo> BFlist(Map<String, Object> map) {
		return evaluationDao.BFlist(map);
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return evaluationDao.evList(map);
	}

	public int frominsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = evaluationDao.frominsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map2) {
		int flag = 0;
		
		flag = evaluationDao.whether(map2);
		
		return flag;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return evaluationDao.noticeSelect(map);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = evaluationDao.loginlog(map);
		return flag;
	}

	public List<CWhetherVo> whetherSelect(Map<String, Object> map) {
		return evaluationDao.whetherSelect(map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
		int flag = 0;
		flag = evaluationDao.formcheck(map);
		return flag;
	}

	public int dbcheck(CoopusersVo vo) {
		int flag = 0;
		flag = evaluationDao.dbcheck(vo);
		return flag;
	}
	public List<CoopusersVo> user(Map<String, Object> map) {
		return evaluationDao.user(map);
	}
	public List<CoopusersVo> users(Map<String, Object> map) {
		return evaluationDao.users(map);
	}
	
	public List<CoopusersVo> user1(Map<String, Object> map) {
		return evaluationDao.user1(map);
	}
	
	public List<CoopusersVo> user2(Map<String, Object> map) {
		return evaluationDao.user2(map);
	}
	
	public List<CoopusersVo> user3(Map<String, Object> map) {
		return evaluationDao.user3(map);
	}
	
	public List<CoopusersVo> user4(Map<String, Object> map) {
		return evaluationDao.user4(map);
	}
	
	public List<CoopusersVo> user5(Map<String, Object> map) {
		return evaluationDao.user5(map);
	}
	
	public List<CoopusersVo> user6(Map<String, Object> map) {
		return evaluationDao.user6(map);
	}
	
	public List<CoopusersVo> user7(Map<String, Object> map) {
		return evaluationDao.user7(map);
	}
	public int usercnt1(Map<String, Object> map) {
		return evaluationDao.usercnt1(map);
	}
	public int usercnt2(Map<String, Object> map) {
		return evaluationDao.usercnt2(map);
	}
	public int usercnt3(Map<String, Object> map) {
		return evaluationDao.usercnt3(map);
	}
	public int usercnt4(Map<String, Object> map) {
		return evaluationDao.usercnt4(map);
	}
	public int usercnt5(Map<String, Object> map) {
		return evaluationDao.usercnt5(map);
	}
	public int usercnt6(Map<String, Object> map) {
		return evaluationDao.usercnt6(map);
	}
	public int usercnt7(Map<String, Object> map) {
		return evaluationDao.usercnt7(map);
	}
	
//	public List<CoopusersVo> users1pwd(Map<String, Object> map) {
//		return evaluationDao.users1pwd(map);
//	}
//	public List<CoopusersVo> users2pwd(Map<String, Object> map) {
//		return evaluationDao.users2pwd(map);
//	}
//	public List<UsersVo> users3pwd(Map<String, Object> map) {
//		return evaluationDao.users3pwd(map);
//	}
//	
//	public List<CoopusersVo> log(Map<String, Object> map) {
//		return evaluationDao.log(map);
//	}

//	public List<UserPh> ph(Map<String, Object> map) {
//		return evaluationDao.ph(map);
//	}
//	
	public int phOne(Map<String, Object> map) {
		int flag = 0;
		flag = evaluationDao.phOne(map);
		return flag;
	}
	public int pwdreset(Map<String, Object> map) {
		int flag = 0;
		flag = evaluationDao.pwdreset(map);
		return flag;
	}
//	public int pwdreset1(Map<String, Object> map) {
//		int flag = 0;
//		flag = evaluationDao.pwdreset1(map);
//		return flag;
//	}
//	public int pwdreset2(Map<String, Object> map) {
//		int flag = 0;
//		flag = evaluationDao.pwdreset2(map);
//		return flag;
//	}
//	public int pwdreset3(Map<String, Object> map) {
//		int flag = 0;
//		flag = evaluationDao.pwdreset3(map);
//		return flag;
//	}
//
	public int userpwd1(Map<String, Object> map) {
		return evaluationDao.userpwd1(map);
	}
	public int userpwd2(Map<String, Object> map) {
		return evaluationDao.userpwd2(map);
	}
	public int userpwd3(Map<String, Object> map) {
		return evaluationDao.userpwd3(map);
	}
	public int userpwd4(Map<String, Object> map) {
		return evaluationDao.userpwd4(map);
	}
	public int userpwd5(Map<String, Object> map) {
		return evaluationDao.userpwd5(map);
	}
	public int userpwd6(Map<String, Object> map) {
		return evaluationDao.userpwd6(map);
	}
	public int userpwd7(Map<String, Object> map) {
		return evaluationDao.userpwd7(map);
	}

	public List<TargetVo> target(Map<String, Object> map) {
		return evaluationDao.target(map);
	}
	public List<TargetVo> target1(Map<String, Object> map) {
		return evaluationDao.target1(map);
	}
	public List<TargetVo> target2(Map<String, Object> map) {
		return evaluationDao.target2(map);
	}
	public List<TargetVo> target3(Map<String, Object> map) {
		return evaluationDao.target3(map);
	}
	public List<TargetVo> target4(Map<String, Object> map) {
		return evaluationDao.target4(map);
	}
	public List<TargetVo> target5(Map<String, Object> map) {
		return evaluationDao.target5(map);
	}
	public List<TargetVo> target6(Map<String, Object> map) {
		return evaluationDao.target6(map);
	}
	public List<TargetVo> target7(Map<String, Object> map) {
		return evaluationDao.target7(map);
	}

	public List<CAnswerVo> answerselect(Map<String, Object> map) {
		return evaluationDao.answerselect(map);
	}
	public List<CAnswerVo> answerselect1(Map<String, Object> map) {
		return evaluationDao.answerselect1(map);
	}
	public List<CAnswerVo> answerselect2(Map<String, Object> map) {
		return evaluationDao.answerselect2(map);
	}
	public List<CAnswerVo> answerselect3(Map<String, Object> map) {
		return evaluationDao.answerselect3(map);
	}
	public List<CAnswerVo> answerselect4(Map<String, Object> map) {
		return evaluationDao.answerselect4(map);
	}
	public List<CAnswerVo> answerselect5(Map<String, Object> map) {
		return evaluationDao.answerselect5(map);
	}
	public List<CAnswerVo> answerselect6(Map<String, Object> map) {
		return evaluationDao.answerselect6(map);
	}
	public List<CAnswerVo> answerselect7(Map<String, Object> map) {
		return evaluationDao.answerselect7(map);
	}

	public int pwdajax(Map<String, Object> map) {
		
		int flag = 0;
		flag = evaluationDao.pwdajax(map);
		return flag;
	}
	public int targetsum(Map<String, Object> map) {
		return evaluationDao.targetsum(map);
	}

	public int answersum(Map<String, Object> map) {
		return evaluationDao.answersum(map);
	}
	
	public int targetsum1(Map<String, Object> map) {
		return evaluationDao.targetsum1(map);
	}
	public int answersum1(Map<String, Object> map) {
		return evaluationDao.answersum1(map);
	}
	
	public int targetsum2(Map<String, Object> map) {
		return evaluationDao.targetsum2(map);
	}
	public int answersum2(Map<String, Object> map) {
		return evaluationDao.answersum2(map);
	}
	
	public int targetsum3(Map<String, Object> map) {
		return evaluationDao.targetsum3(map);
	}
	public int answersum3(Map<String, Object> map) {
		return evaluationDao.answersum3(map);
	}
	
	public int targetsum4(Map<String, Object> map) {
		return evaluationDao.targetsum4(map);
	}
	public int answersum4(Map<String, Object> map) {
		return evaluationDao.answersum4(map);
	}
	
	public int targetsum5(Map<String, Object> map) {
		return evaluationDao.targetsum5(map);
	}
	public int answersum5(Map<String, Object> map) {
		return evaluationDao.answersum5(map);
	}
	
	public int targetsum6(Map<String, Object> map) {
		return evaluationDao.targetsum6(map);
	}
	public int answersum6(Map<String, Object> map) {
		return evaluationDao.answersum6(map);
	}
	
	public int targetsum7(Map<String, Object> map) {
		return evaluationDao.targetsum7(map);
	}
	public int answersum7(Map<String, Object> map) {
		return evaluationDao.answersum7(map);
	}

	
}
