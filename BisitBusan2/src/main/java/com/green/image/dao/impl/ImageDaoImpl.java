package com.green.image.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.image.dao.ImageDao;
import com.green.image.vo.ImageVo;

@Repository("imageDao")
public class ImageDaoImpl implements ImageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ImageVo> getImageList() {
		List<ImageVo> imageList = sqlSession.selectList("Image.ImageList");

		
		return imageList;
	}
	
	

}
