package com.suwon.ezen.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.suwon.ezen.vo.UserVO;

public interface DataService {
	// 사용자의 데이터 가져오기
	public UserVO getUserInfo(String pointer);
		
	// 사용자의 tilt 테이블에서 column명 가져오기
	public List<String> getTiltColumn(String tiltName);
	
	// 전체 데이터 가져오기
	public List<Map<String, String>> getTable(@Param("info") UserVO info, @Param("columnList") List<String> columnList);
}
