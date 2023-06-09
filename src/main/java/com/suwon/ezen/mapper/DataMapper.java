package com.suwon.ezen.mapper;

import java.util.List;

import com.suwon.ezen.vo.UserVO;

public interface DataMapper {
	// 사용자의 데이터 가져오기
	public UserVO getUserInfo(String pointer);
	
	// 사용자의 tilt 테이블에서 column명 가져오기
	public List<String> getTiltColumn(String tiltName);
}
