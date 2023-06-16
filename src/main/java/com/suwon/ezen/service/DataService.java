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
	public List<Map<String, Object>> getTable(@Param("info") UserVO info, @Param("columnList") List<String> columnList);

	// 일부 데이터 가져오기(페이징)
	public List<Map<String, Object>> getTablePaging(@Param("info") UserVO info, @Param("columnList") List<String> columnList, @Param("offset") int offset);
	
	// userinfo 전체 데이터의 갯수 가져오기
	public int getCountUserInfo();
	
	// userinfo 전체 데이터 가져오기
	public List<UserVO> getAllUserInfo(int offset);

	// 전체 데이터의 갯수 가져오기
	public int getCountTilt(@Param("info") UserVO info);
	
	// password가 유효한지 판단하기
	public UserVO comparePassword(@Param("pwd") String pwd, @Param("cnt") int cnt);
	
	// status 변경하기
	public int changeStatus(UserVO vo);
	
	// 날짜별 전체 데이터 가져오기
	public List<Map<String, Object>> getTableByDate(@Param("info") UserVO info, @Param("date") String date, @Param("columnList") List<String> columnList);
}
