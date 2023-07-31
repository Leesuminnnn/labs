package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.ImageEntity;

@Repository
public class ImageDao {
	
	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	
	public static final String MAPPER = "image";
	
//	@Autowired
//	public ImageDao(SqlSession sqlSession1) {
//		this.sqlSession = sqlSession1;
//	}
	
	public void save(ImageEntity imageEntity) {
		sqlSession1.insert(MAPPER+".save", imageEntity);
	}
	public ImageEntity selectimg(ImageEntity img) {
		return sqlSession1.selectOne(MAPPER+".imgselect", img);
	}

	public List<ImageEntity> imglist(ImageEntity img) {
		return sqlSession1.selectList(MAPPER+ ".imglist",img);
	}

	public ImageEntity getImageData(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".getImageData", map);
	}
}
