package com.nnn.app.service;

import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.ImageDao;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.ImageEntitytest;
import com.nnn.app.vo.PDFRequest;

@Service
public class ImageService {

	private ImageDao imageDao;
//	private final Path rootLocation;	// 이미지 저장 경로
	
	@Autowired
	public ImageService(ImageDao imageDao) {
		this.imageDao = imageDao;
	}
	public void saveImage1(ImageEntity imageEntity) {
		
		imageDao.save1(imageEntity);
		
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
	public String saveImage4(String imageBase64) {
		
		return null;
	}
	
//	public ImageService() {
//		this.rootLocation = Paths.get("/path/to/image/storage");
//	}
//	public String saveImage(String imageBase64) throws Exception {
//        String[] parts = imageBase64.split(",");
//        String imageDataBytes = parts[1];
//        byte[] data = Base64.decodeBase64(imageDataBytes);
//
//        String filename = UUID.randomUUID().toString() + ".png";
//        Path destinationFile = rootLocation.resolve(Paths.get(filename))
//                                           .normalize().toAbsolutePath();
//
//        try (FileOutputStream fos = new FileOutputStream(destinationFile.toString())) {
//            fos.write(data);
//        }
//
//        return destinationFile.toString();
//	}

}
