package com.green.sight.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.festival.vo.FestivalVo;
import com.green.sight.dao.SightDao;
import com.green.sight.vo.Criteria;
import com.green.sight.vo.SightVo;


@Repository("sightDao")
public class SightDaoImpl implements SightDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override //main.jsp 인기여행지리스트(1~3)
	public List<SightVo> getSightList() {
		
		List<SightVo> sightList = sqlSession.selectList("Sight.SightList");
		return sightList;
	
	}
	@Override //main.jsp 인기여행지리스트 (3~6)
	public List<SightVo> getSightList2() {
		
		List<SightVo> sightList2 = sqlSession.selectList("Sight.SightList2");
	
		return sightList2;
		
	}

	@Override
	public List<SightVo> getSightView(String tloc_Lng) {
	
		List<SightVo> sightView = sqlSession.selectList("Sight.SightView", tloc_Lng);
		System.out.println("사이트뷰입니다아아" + sightView);
		return sightView;
	}

	@Override
	public List<SightVo> getSightAll() {
		List<SightVo> sightAll = sqlSession.selectList("Sight.SightAll");
		System.out.println("사이트 올입니다아아" + sightAll);
		return sightAll;
	}


	@Override
	public List<SightVo> getAllfsView(String totloc_Lng) {
		List<SightVo> allfsView = sqlSession.selectList("Festival.AllfsView", totloc_Lng);
		System.out.println("다오 임플리먼트 데이터" + allfsView);
		return allfsView;
	}
	
	@Override
	public List<SightVo> getSightTable() {
		
		List<SightVo> sightTable = sqlSession.selectList("Sight.SightTable");
		
		return sightTable;
	}

	@Override
	public SightVo getSightInfoList(int s_code) {
		SightVo sightvo = sqlSession.selectOne("Sight.SightInfoList", s_code );
				
		return  sightvo;
	}

	@Override
	public void sightReadCntUpdate(int s_code) {
		sqlSession.update("Sight.SightReadCntUpdate", s_code);	
		
	}
	
	@Override
	public List<SightVo> listPage(Criteria cri) throws Exception {
		return sqlSession.selectList("Sight.listPage",cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne("Sight.gettotalcount",cri);
	}



	
	
	
}
