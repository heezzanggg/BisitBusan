package com.green.festival.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.festival.dao.FestivalDao;
import com.green.festival.vo.FestivalVo;
import com.green.sight.vo.Criteria;

@Repository("festivalDao")
public class FestivalDaoImpl implements FestivalDao {

	@Autowired
	private SqlSession sqlSession;
	

	//축제 상세보기 리스트
	@Override
	public FestivalVo getFestivalTable(int f_code) {
		FestivalVo festivalvo = sqlSession.selectOne("Festival.FestivalInfoList",f_code);
		return festivalvo;
	}
	
	@Override
	public List<FestivalVo> getFestivalView(String sloc_Lng) {
		List<FestivalVo> festivalView = sqlSession.selectList("Festival.FestivalView", sloc_Lng);
		System.out.println("페스티발 부뷰뷰" + festivalView);
		return festivalView;
	}

	//페이징처리된 축제 전체 리스트
	@Override
	public List<FestivalVo> getFestivalTable(Criteria cri) throws Exception {
		return sqlSession.selectList("Festival.FesivalTable",cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne("Festival.gettotalcount",cri);
	}
	

}
