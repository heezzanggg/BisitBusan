package com.green.menus.service;

import java.util.List;

import com.green.menus.vo.MenuVo;

public interface MenuService {

	List<MenuVo> getMenuList();
	
	MenuVo menuView(String menu_id);



}
