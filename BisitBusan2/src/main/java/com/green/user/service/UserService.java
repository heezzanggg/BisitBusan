package com.green.user.service;

import java.util.HashMap;
import java.util.Map;

import com.green.user.vo.UserVo;

public interface UserService {
	
	void insertUser(UserVo user);
	
	UserVo login(HashMap<String, String> map);

	Map<Integer, Integer> randomdiceForKey(int s_code) throws Exception;

}
