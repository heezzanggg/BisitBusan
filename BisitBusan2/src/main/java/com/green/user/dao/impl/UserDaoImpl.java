package com.green.user.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.user.dao.UserDao;
import com.green.user.vo.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertUser(UserVo user) {
		
		sqlSession.insert("User.UserInsert", user);
		System.out.println("유ㅜ저입니다" + user);
		
	}
	
	@Override
	public UserVo login(HashMap<String, String> map) {
		System.out.println("map:" + map);
		UserVo  vo  =  sqlSession.selectOne("User.login", map); 
		
		System.out.println("vo:" + vo);
		return  vo;
	}

}
