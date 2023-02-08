package com.green.allfs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.allfs.dao.impl.AllfsDao;
import com.green.allfs.vo.AllfsVo;

@Repository("allfsDao")
public class AllfsDaoImpl implements AllfsDao{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<AllfsVo> getAllfsView(String totloc_Lng) {
		List<AllfsVo> allfsView = sqlSession.selectList("AllFs.AllfsView", totloc_Lng);

		return allfsView;
	}

}
