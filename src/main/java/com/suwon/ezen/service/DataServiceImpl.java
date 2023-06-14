package com.suwon.ezen.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suwon.ezen.mapper.DataMapper;
import com.suwon.ezen.vo.UserVO;

import lombok.Setter;

@Service
public class DataServiceImpl implements DataService {
	@Setter(onMethod_ = @Autowired)
	private DataMapper mapper;
	
	// 사용자의 데이터 가져오기
	@Override
	public UserVO getUserInfo(String pointer) {
		UserVO vo = mapper.getUserInfo(pointer);
		
		return vo;
	}

	// 사용자의 tilt 테이블에서 column명 가져오기
	@Override
	public List<String> getTiltColumn(String tiltName) {
		List<String> result = mapper.getTiltColumn(tiltName);
		
		return result;
	}

	// 전체 데이터 가져오기
	@Override
	public List<Map<String, Object>> getTable(UserVO info, List<String> columnList) {
		List<Map<String, Object>> map = mapper.getTable(info, columnList);
		
		return map;
	}

	// 일부 데이터 가져오기(페이징)
	@Override
	public List<Map<String, Object>> getTablePaging(UserVO info, List<String> columnList, int offset) {
		List<Map<String, Object>> list = mapper.getTablePaging(info, columnList, offset);
		
		return list;
	}
	
	// userinfo 전체 데이터의 갯수 가져오기
	@Override
	public int getCountUserInfo() {
		int result = mapper.getCountUserInfo();
		
		return result;
	}
	
	// userinfo 전체 데이터 가져오기
	@Override
	public List<UserVO> getAllUserInfo(int offset) {
		List<UserVO> result = mapper.getAllUserInfo(offset);
		
		return result;
	}

	// 전체 데이터의 갯수 가져오기
	@Override
	public int getCountTilt(UserVO info) {
		int result = mapper.getCountTilt(info);
		
		return result;
	}

	// password가 유효한지 판단하기
	@Override
	public UserVO comparePassword(@Param("pwd") String pwd, @Param("cnt") int cnt) {
		UserVO vo = mapper.comparePassword(pwd, cnt);
		
		return vo;
	}
	
	// status 변경하기
	@Override
	public int changePassword(UserVO vo) {
		int result = mapper.changePassword(vo);
		
		return result;
	}

	// 날짜별 전체 데이터 가져오기
	@Override
	public List<Map<String, Object>> getTableByDate(@Param("info") UserVO info, @Param("date") String date, @Param("columnList") List<String> columnList) {
		List<Map<String, Object>> result = mapper.getTableByDate(info, date, columnList);
		
		return result;
	}

}
