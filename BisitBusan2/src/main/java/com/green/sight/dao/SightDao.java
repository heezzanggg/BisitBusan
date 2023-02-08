package com.green.sight.dao;

import java.util.HashMap;
import java.util.List;

import com.green.festival.vo.FestivalVo;
import com.green.sight.vo.Criteria;
import com.green.sight.vo.SightVo;

public interface SightDao {

	List<SightVo> getSightList();
	
	List<SightVo> getSightList2();
	
	List<SightVo> getSightView(String tloc_Lng);

	List<SightVo> getSightAll();

	List<SightVo> getAllfsView(String totloc_Lng);
	
	List<SightVo> getSightTable();

	SightVo getSightInfoList(int s_code);

	void sightReadCntUpdate(int s_code);
		
	List<SightVo> listPage(Criteria cri) throws Exception;

	int getTotalCount(Criteria cri);

}
