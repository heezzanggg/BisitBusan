package com.green.image.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.image.dao.ImageDao;
import com.green.image.service.ImageService;
import com.green.image.vo.ImageVo;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDao imageDao;
	
	@Override
	public List<ImageVo> getImageList() {
		List<ImageVo> imageList = imageDao.getImageList();
		System.out.println("ImageService_imageList:"+imageList);
		

		return imageList;
	}
	


}
