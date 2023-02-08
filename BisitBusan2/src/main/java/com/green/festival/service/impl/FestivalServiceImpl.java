package com.green.festival.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.festival.dao.FestivalDao;
import com.green.festival.service.FestivalService;
import com.green.festival.vo.FestivalVo;
import com.green.sight.vo.Criteria;

@Service("festivalService")
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDao festivalDao;
	

	//명소상세보기 리스트
	@Override
	public FestivalVo getFestivalInfoList(int f_code) {
		FestivalVo festivalvo = festivalDao.getFestivalTable(f_code);
		
		return festivalvo;
	}
	
	@Override
	public List<FestivalVo> getFestivalView(String sloc_Lng) {
		List<FestivalVo> festivalView = festivalDao.getFestivalView(sloc_Lng);
		System.out.println("페스티발 뷰뷰뷰뷰뷰뷰22222" + festivalView);
		
		return festivalView;
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return festivalDao.getTotalCount(cri);

	}

	@Override
	public List<FestivalVo> getFestivalTable(Criteria cri) throws Exception {
		return festivalDao.getFestivalTable(cri);
	}


}
