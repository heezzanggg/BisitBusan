package com.green.user.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.dao.UserDao;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public void insertUser(UserVo user) {
		
		userDao.insertUser( user );
		
	}
	
	@Override
	public UserVo login(HashMap<String, String> map) {
		UserVo    vo   =   userDao.login( map ); 
		return    vo;
	}
	
	@Override
	   public Map<Integer, Integer> randomdiceForKey(int s_code) 
	         throws Exception{

	      double dValue = Math.random();
	      System.out.println("3. 굴려서 나온 소수: " + dValue);
	      int iValue = (int)(dValue * 10);
	      System.out.println("4. 소수로 만든 숫자: " + iValue);
	      
	      //동일 숫자 혹 범위가 안맞으면 다시 숫자 뽑기 (역사는 역사범위(0~2) 자연은 자연범위(3~5) 사이로 숫자맞추기
	         if (s_code == iValue%6) {
	            System.out.println(" 주사위 다시 돌리기 ");
	            System.out.println(" 동일번호라서 다시 돌림, s_code, ivalue : "+ s_code + iValue);
	            randomdiceForKey(s_code);
	            }
	      
	         if((s_code < 3 && iValue%6 > 2) || (s_code >2 && iValue%6<3)) {
	            System.out.println(" 주사위 다시 돌리기 ");
	            System.out.println(" 범위가 안맞아서 다시 돌림, s_code, ivalue : " + s_code + iValue);
	            randomdiceForKey(s_code); }
	         
	         
	         
	         System.out.println("두번보이면 렉걸린거임 ************* ");  
	      
	         Map<Integer, Integer> randombox = new HashMap<>();
	         

	         Integer key = Integer.valueOf(s_code);
	         Integer value = Integer.valueOf(iValue%6);
	         
	         
	         
	         
	         randombox.put(key, value);
	         
	         
	         return randombox;
	         
	   }

}
