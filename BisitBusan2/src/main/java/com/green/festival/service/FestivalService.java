package com.green.festival.service;

import java.util.List;

import com.green.festival.vo.FestivalVo;
import com.green.sight.vo.Criteria;
import com.green.sight.vo.SightVo;

public interface FestivalService {


	FestivalVo getFestivalInfoList(int f_code);
	
	List<FestivalVo> getFestivalView(String sloc_Lng);

	int getTotalCount(Criteria cri) throws Exception;
	
	List<FestivalVo> getFestivalTable(Criteria cri) throws Exception;

}
