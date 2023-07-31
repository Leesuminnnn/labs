package com.nnn.app.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.PointplusDao;

@Service
public class PointplusService {

	private PointplusDao pointplusDao;

	@Autowired
	public PointplusService(PointplusDao pointplusDao) {
		this.pointplusDao = pointplusDao;
	}

	public int pointplus(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = pointplusDao.pointplus(map);
		System.out.println("result : "+result);
		return result;
	}
	

//	public List<PointplusVo> pointlist(Map<String, Object> map) {
//		return pointplusDao.pointlist(map);
//	}
	

	
}
