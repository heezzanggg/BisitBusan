package com.green.menus.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.menus.dao.MenuDao;
import com.green.menus.vo.MenuVo;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {

	@Autowired
	private  SqlSession  sqlSession;
	
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo>  menuList = sqlSession.selectList("Menu.MenuList");
		return        menuList;
	}


	@Override
	public MenuVo menuView(String menu_id) {
		
		MenuVo   menuVo  =  sqlSession.selectOne("Menu.MenuView", menu_id);
		return   menuVo;
		
	}



}







