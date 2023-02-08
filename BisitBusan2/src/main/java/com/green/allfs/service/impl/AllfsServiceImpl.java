package com.green.allfs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.allfs.dao.impl.AllfsDao;
import com.green.allfs.service.AllfsService;
import com.green.allfs.vo.AllfsVo;

@Service("allfsService")
public class AllfsServiceImpl implements AllfsService{
	
	@Autowired
	private AllfsDao allfsDao;

	@Override
	public List<AllfsVo> getAllfsView(String totloc_Lng) {
		List<AllfsVo> allfsView = allfsDao.getAllfsView(totloc_Lng);
		return allfsView;
	}

}
