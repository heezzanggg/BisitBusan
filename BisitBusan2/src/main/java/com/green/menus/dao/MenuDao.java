package com.green.menus.dao;

import java.util.List;

import com.green.menus.vo.MenuVo;

public interface MenuDao {

	List<MenuVo> getMenuList();

	MenuVo menuView(String menu_id);


	
}
