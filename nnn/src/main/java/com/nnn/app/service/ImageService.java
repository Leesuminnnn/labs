package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.ImageDao;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.ImageEntitytest;
import com.nnn.app.vo.PDFRequest;

@Service
public class ImageService {

	private ImageDao imageDao;
	
	@Autowired
	public ImageService(ImageDao imageDao) {
		this.imageDao = imageDao;
	}
	
	public void saveImage(PDFRequest pdfRequest) {
		
		imageDao.save(pdfRequest);
		
	}
	public void saveImagetest(ImageEntitytest image) {
		
		imageDao.savetest(image);
		
	}
	public ImageEntity selectimg(ImageEntity img) {
		return imageDao.selectimg(img);
	}

	public List<ImageEntity> imglist(ImageEntity img) {
		return imageDao.imglist(img);
	}

	public ImageEntity getImageData(Map<String, Object> map) {
		return imageDao.getImageData(map);
	}

}
