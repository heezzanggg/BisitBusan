package com.green.user.dao;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserDao {
	
	void insertUser(UserVo user);
	UserVo login(HashMap<String, String> map);
}
