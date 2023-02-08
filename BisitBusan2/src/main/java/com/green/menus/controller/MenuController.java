package com.green.menus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;

@Controller
@RequestMapping("/Menus")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/List")    //  "/Menus/List"
	public  String   menuList( Model model ) {
		
		// 메뉴목록 조회
		List<MenuVo> menuList = menuService.getMenuList();
		model.addAttribute("menuList", menuList);
		
		return "menus/list";  // "/WEB-INF/views/menus/list.jps'
		
	}
	// /Menus/MenuUpdateForm/${ menu.menu_id }
	@RequestMapping("/MenuUpdateForm/{menu_id}")
	public   String   menuUpdateForm(@PathVariable String menu_id, Model model) {
		
		MenuVo  menuVo = menuService.menuView( menu_id );
		model.addAttribute( "menu", menuVo );
		
		return  "menus/update";		
	}
	

	
	
	
}






