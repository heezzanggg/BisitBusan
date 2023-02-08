package com.green.festival.dao;

import java.util.List;

import com.green.festival.vo.FestivalVo;
import com.green.sight.vo.Criteria;

public interface FestivalDao {
	
	List<FestivalVo> getFestivalTable(Criteria cri) throws Exception;
	
	int getTotalCount(Criteria cri);

	FestivalVo getFestivalTable(int f_code);
	
	List<FestivalVo> getFestivalView(String sloc_Lng);



}
