package com.suwon.ezen.mapper;

import org.springframework.stereotype.Component;

import com.suwon.ezen.vo.UserVO;

public interface DataMapper {
	public UserVO getUserInfo(String pointer);
}
