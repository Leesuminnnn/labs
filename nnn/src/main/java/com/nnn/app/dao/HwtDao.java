package com.nnn.app.dao;

import java.util.List;
import java.util.Map;
import java.util.Base64;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.SignVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WrittenVo;


@Repository
public class HwtDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr 4: root (CentOS)
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession3")
	private SqlSession sqlSession3;
	@Resource(name="sqlSession4")
	private SqlSession sqlSession4;
	public byte[] getSignatureDataByCsIdx;
	
	
	public static final String MAPPER = "hwt";

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".noticeselect", map);
//		return sqlSession3.selectList(MAPPER+".noticeselect", map);
		return sqlSession4.selectList(MAPPER+".noticeselect", map);
	}
	

	public UsersVo info2(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".info2", vo);
//		return sqlSession3.selectOne(MAPPER+".info2", vo);
		return sqlSession4.selectOne(MAPPER+".info2", vo);
	}

	public int login(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".login", vo);
//		return sqlSession3.selectOne(MAPPER+".login", vo);
		return sqlSession4.selectOne(MAPPER+".login", vo);
	}

	public int dbcheck(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
		return sqlSession4.selectOne(MAPPER+".dbcheck", vo);
	}

	public UsersVo info(int idx) {
//		return sqlSession1.selectOne(MAPPER+".info", idx);
//		return sqlSession3.selectOne(MAPPER+".info", idx);
		return sqlSession4.selectOne(MAPPER+".info", idx);
	}

	public int loginlog(Map<String, Object> map) {
//		return sqlSession1.insert(MAPPER+".loginlog", map);
//		return sqlSession3.insert(MAPPER+".loginlog", map);
		return sqlSession4.insert(MAPPER+".loginlog", map);
	}
//	public List<WrittenVo> list(WrittenVo writtenVo) {
//		return sqlSession1.selectList(MAPPER+".cslist", writtenVo);
//	}
	public List<WrittenVo> list(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".cslist", cri);
		return sqlSession4.selectList(MAPPER+".cslist", cri);
	}
	public List<WrittenVo> listsearch(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".csClistsearch", cri);
		return sqlSession4.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public List<WrittenVo> listsearch2(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".cslist", cri);
		return sqlSession4.selectList(MAPPER+".cslist", cri);
	}

	public List<UsersVo> users(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users", map);
//		return sqlSession3.selectList(MAPPER+".users", map);
		return sqlSession4.selectList(MAPPER+".users", map);
	}

	public List<UsersVo> users1(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1", map);
		return sqlSession4.selectList(MAPPER+".users1", map);
	}
	public List<UsersVo> users1pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users1", map);
//		return sqlSession3.selectList(MAPPER+".users1", map);
		return sqlSession4.selectList(MAPPER+".users1", map);
	}
	
	public List<UsersVo> users2(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2", map);
		return sqlSession4.selectList(MAPPER+".users2", map);
	}
	public List<UsersVo> users2pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users2", map);
//		return sqlSession3.selectList(MAPPER+".users2", map);
		return sqlSession4.selectList(MAPPER+".users2", map);
	}
	
	public List<UsersVo> users3(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3", map);
		return sqlSession4.selectList(MAPPER+".users3", map);
	}
	public List<UsersVo> users3pwd(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".users3", map);
//		return sqlSession3.selectList(MAPPER+".users3", map);
		return sqlSession4.selectList(MAPPER+".users3", map);
	}

	public List<UserPh> ph(Map<String, Object> map) {
//		return sqlSession1.selectList(MAPPER+".ph", map);
//		return sqlSession3.selectList(MAPPER+".ph", map);
		return sqlSession4.selectList(MAPPER+".ph", map);
	}
	
	public int hsptselect1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect1", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect1", map);
		return sqlSession4.selectOne(MAPPER+".hsptselect1", map);
	}
	public int hsptselect2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect2", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect2", map);
		return sqlSession4.selectOne(MAPPER+".hsptselect2", map);
	}
	public int hsptselect3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptselect3", map);
//		return sqlSession3.selectOne(MAPPER+".hsptselect3", map);
		return sqlSession4.selectOne(MAPPER+".hsptselect3", map);
	}

	public int hsptselectpwd1(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect1", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect1", map);
		return sqlSession4.selectOne(MAPPER+".hsptpwdselect1", map);
	}
	public int hsptselectpwd2(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect2", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect2", map);
		return sqlSession4.selectOne(MAPPER+".hsptpwdselect2", map);
	}
	public int hsptselectpwd3(Map<String, Object> map) {
//		return sqlSession1.selectOne(MAPPER+".hsptpwdselect3", map);
//		return sqlSession3.selectOne(MAPPER+".hsptpwdselect3", map);
		return sqlSession4.selectOne(MAPPER+".hsptpwdselect3", map);
	}

	public int pwdreset(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset", map);
//		return  sqlSession3.update(MAPPER+".pwdreset", map);
		return  sqlSession4.update(MAPPER+".pwdreset", map);
	}
	public int pwdreset1(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset1", map);
//		return  sqlSession3.update(MAPPER+".pwdreset1", map);
		return  sqlSession4.update(MAPPER+".pwdreset1", map);
	}
	public int pwdreset2(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset2", map);
//		return  sqlSession3.update(MAPPER+".pwdreset2", map);
		return  sqlSession4.update(MAPPER+".pwdreset2", map);
	}
	public int pwdreset3(Map<String, Object> map) {
//		return  sqlSession1.update(MAPPER+".pwdreset3", map);
//		return  sqlSession3.update(MAPPER+".pwdreset3", map);
		return  sqlSession4.update(MAPPER+".pwdreset3", map);
	}
//	public WrittenVo selectone(WrittenVo vo) {
//		return sqlSession1.selectOne(MAPPER+".selectone",vo);
//	}
	
	public WrittenVo selectone(int cs_idx) {
//		return sqlSession1.selectOne(MAPPER+".selectone",cs_idx);
		return sqlSession4.selectOne(MAPPER+".selectone",cs_idx);
	}
	
	public int insert(WrittenVo vo) {
//		return sqlSession1.insert(MAPPER+".insert", vo);
		return sqlSession4.insert(MAPPER+".insert", vo);
	}

	public List<Map<String, Object>> list2(Criteria cri) throws Exception{
//		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
		return sqlSession4.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public int Cnt(Criteria cri) {
//		return sqlSession1.selectOne(MAPPER+".Cnt",cri);
		return sqlSession4.selectOne(MAPPER+".Cnt",cri);
	}
	
	public void update(WrittenVo vo) {
//		sqlSession1.update(MAPPER+".update",vo);
		sqlSession4.update(MAPPER+".update",vo);
	}

	public void modify(WrittenVo vo) {
//		sqlSession1.update(MAPPER+".modify",vo);
		sqlSession4.update(MAPPER+".modify",vo);		
	}

	public List<UsersVo> setting(Map<String, Object> map) {
//		return sqlSession3.selectList(MAPPER+".setting", map);
		return sqlSession4.selectList(MAPPER+".setting", map);
	}


	public List<UsersVo> accessAll(Map<String, Object> map) {
//		return sqlSession3.selectList(MAPPER+".accessAll", map);
		return sqlSession4.selectList(MAPPER+".accessAll", map);
	}

	public void save(ImageEntity imageEntity) {
//		sqlSession1.insert(MAPPER+".save", imageEntity);
		sqlSession4.insert(MAPPER+".save", imageEntity);
	}

	public int phOne(Map<String, Object> map) {
		return sqlSession4.selectOne(MAPPER+".phOne", map);
	}

	public int pwdinsert(Map<String, Object> map) {
		return sqlSession4.update(MAPPER+".pwdinsert", map);
	}


	public int pwdajax(Map<String, Object> map) {
		return sqlSession4.update(MAPPER+".pwdajax", map);
	}


	public ImageEntity getImageData(Map<String, Object> map) {
		return sqlSession4.selectOne(MAPPER+".getImageData", map);
	}

	public int insertsign(SignVo svo) {
		return sqlSession4.insert(MAPPER+".signinsert",svo);
	}
	
	public void updateSign(SignVo svo) {
		sqlSession4.update(MAPPER+".signupdate",svo);
	}

	public int select() {
		return sqlSession4.selectOne(MAPPER+".select");
	}
	
	public SignVo getSignatureByCsIdx(int cs_idx) {
        return sqlSession4.selectOne(MAPPER+".getSignatureByCsIdx", cs_idx);
	}
	
}
