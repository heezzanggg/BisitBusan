package com.green.sight.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.festival.vo.FestivalVo;
import com.green.sight.dao.SightDao;
import com.green.sight.service.SightService;
import com.green.sight.vo.Criteria;
import com.green.sight.vo.SightVo;

@Service("sightService")
public class SightServiceImpl implements SightService {

	@Autowired
	private SightDao sightDao;
	
	@Override
	public List<SightVo> getSightList() {
		
		List<SightVo> sightList = sightDao.getSightList();
		
		return sightList;
	}
	
	@Override
	public List<SightVo> getSightList2() {
		
		List<SightVo> sightList2 = sightDao.getSightList2();

		return sightList2;
	}

	@Override
	public List<SightVo> getSightView(String tloc_Lng) {
		List<SightVo> sightView = sightDao.getSightView(tloc_Lng);
		return sightView;
	}

	@Override
	public List<SightVo> getSightAll() {
		List<SightVo> sightAll = sightDao.getSightAll();
		System.out.println("사이트올 서비스 임플리먼트틑" + sightAll);
		return sightAll;
	}

	

	@Override
	public List<SightVo> getAllfsView(String totloc_Lng) {
		List<SightVo> allfsView = sightDao.getAllfsView(totloc_Lng);
		System.out.println("전체데이터2323" + allfsView);
		return allfsView;
	}
	
	@Override
	public List<SightVo> getSightTable() {
		
		List<SightVo> sightTable = sightDao.getSightTable();
		
		return sightTable;
	}
	
	@Override
	public SightVo getSightInfoList(int s_code) {
		SightVo  sightvo = sightDao.getSightInfoList( s_code );
		return  sightvo;
	}
	@Override
	public void sightReadCntUpdate(int s_code) {
		sightDao.sightReadCntUpdate(s_code);
		
	}

	@Override
	public List<SightVo> listPage(Criteria cri) throws Exception {
		return sightDao.listPage(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sightDao.getTotalCount(cri);
	}


	

}
