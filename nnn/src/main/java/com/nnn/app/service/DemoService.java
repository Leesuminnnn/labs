package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.DemoDao;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CAnswerVo;
import com.nnn.app.vo.CWhetherVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.ScoreVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;

@Service
public class DemoService {
	
	private DemoDao demoDao;
	
	@Autowired
	public DemoService(DemoDao demoDao) {
		this.demoDao = demoDao;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return demoDao.noticeSelect(map);
	}

	public UsersVo info2(UsersVo vo) {
		return demoDao.info2(vo);
	}

	public int login(UsersVo vo) {
		return demoDao.login(vo);
	}

	public int dbcheck(UsersVo vo) {
		int flag = 0;
		flag = demoDao.dbcheck(vo);
		return flag;
	}

	public UsersVo info(Integer idx) {
		return demoDao.info(idx);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.loginlog(map);
		return flag;
	}

	public List<UsersVo> evaluationtarget(Map<String, Object> map) {
		return demoDao.evaluationtarget(map);
	}

	public List<CWhetherVo> whetherSelect(Map<String, Object> map) {
		return demoDao.whetherSelect(map);
	}

	public int phOne(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.phOne(map);
		return flag;
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = demoDao.pwdinsert(map);
		
		return flag;
	}

	public int pwdajax(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.pwdajax(map);
		return flag;
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return demoDao.evList(map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
		int flag = 0;
		flag = demoDao.formcheck(map);
		return flag;
	}

	public int forminsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = demoDao.forminsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map) {
		int flag = 0;
		
		flag = demoDao.whether(map);
		
		return flag;
	}
	public int whetherUpdate(Map<String, Object> map) {
		int flag = 0;
		
		flag = demoDao.whetherUpdate(map);
		
		return flag;
	}

	public List<UsersVo> users(Map<String, Object> map) {
		return demoDao.users(map);
	}

	public List<UsersVo> users1(Map<String, Object> map) {
		return 
				demoDao.users1(map);
	}
	public List<UsersVo> users1pwd(Map<String, Object> map) {
		return demoDao.users1pwd(map);
	}
	
	public List<UsersVo> users2(Map<String, Object> map) {
		return demoDao.users2(map);
	}
	
	public List<UsersVo> users2pwd(Map<String, Object> map) {
		return demoDao.users2pwd(map);
	}
	
	public List<UsersVo> users3(Map<String, Object> map) {
		return demoDao.users3(map);
	}
	
	public List<UsersVo> users3pwd(Map<String, Object> map) {
		return demoDao.users3pwd(map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
		return demoDao.ph(map);
	}

	public int hsptselect1(Map<String, Object> map) {
		return demoDao.hsptselect1(map);
	}

	public int hsptselect2(Map<String, Object> map) {
		return demoDao.hsptselect2(map);
	}

	public int hsptselect3(Map<String, Object> map) {
		return demoDao.hsptselect3(map);
	}

	public int hsptpwdselect1(Map<String, Object> map) {
		return demoDao.hsptselectpwd1(map);
	}
	public int hsptpwdselect2(Map<String, Object> map) {
		return demoDao.hsptselectpwd2(map);
	}
	public int hsptpwdselect3(Map<String, Object> map) {
		return demoDao.hsptselectpwd3(map);
	}

	public int pwdreset(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.pwdreset(map);
		return flag;
	}
	public int pwdreset1(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.pwdreset1(map);
		return flag;
	}
	public int pwdreset2(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.pwdreset2(map);
		return flag;
	}
	public int pwdreset3(Map<String, Object> map) {
		int flag = 0;
		flag = demoDao.pwdreset3(map);
		return flag;
	}

	public List<TargetVo> target(Map<String, Object> map) {
		return demoDao.target(map);
	}

	public List<CAnswerVo> answerselect(Map<String, Object> map) {
		return demoDao.answerselect(map);
	}

	public int targetsum(Map<String, Object> map) {
		return demoDao.targetsum(map);
	}

	public int answersum(Map<String, Object> map) {
		return demoDao.answersum(map);
	}

	public int targetsum1(Map<String, Object> map) {
		return demoDao.targetsum1(map);
	}

	public int answersum1(Map<String, Object> map) {
		return demoDao.answersum1(map);
	}

	public int targetsum2(Map<String, Object> map) {
		return demoDao.targetsum2(map);
	}

	public int answersum2(Map<String, Object> map) {
		return demoDao.answersum2(map);
	}
	
	public int targetsum3(Map<String, Object> map) {
		return demoDao.targetsum3(map);
	}

	public int answersum3(Map<String, Object> map) {
		return demoDao.answersum3(map);
	}

	public int scoreInsert(Map<String, Object> map) {
		return demoDao.scoreInsert(map);
	}

	public List<ScoreVo> scoreSelect(Map<String, Object> map) {
		return demoDao.scoreSelect(map);
	}

	public CAnswerVo answerSelect(Map<String, Object> map) {
		return demoDao.answerSelect(map);
	}

	public int formUpdate(Map<String, Object> map) {
		return demoDao.formUpdate(map);
	}

	public int scoreUpdate(Map<String, Object> map) {
		return demoDao.scoreUpdate(map);
	}
}
