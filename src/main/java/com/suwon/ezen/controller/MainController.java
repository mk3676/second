package com.suwon.ezen.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.suwon.ezen.service.DataService;
import com.suwon.ezen.vo.Paging;
import com.suwon.ezen.vo.UserVO;

import lombok.Setter;

@RestController
@RequestMapping({ "/", "/main" })
public class MainController {
	@Setter(onMethod_ = @Autowired)
	private DataService service;
	
	@GetMapping("/start")
	public ModelAndView start(@RequestParam(required = false) String pointer) {
		ModelAndView model = new ModelAndView();
		System.out.println("pointer: " + pointer);
		
		if (pointer != null) {
			System.out.println("포인터가 있는 경우");
			model.addObject("pointer", pointer);
			model.setViewName("redirect:/main/displayColumn");
		}
		else {
			model.setViewName("test");
		}
		
		return model;
	}
	
	@GetMapping("displayColumn")
	public ModelAndView displayColumn(String pointer) {
		System.out.println("displayColumn, pointer: " + pointer);
		UserVO vo = service.getUserInfo(pointer);
		
		List<String> columnList =  service.getTiltColumn(vo.getTiltName());
		columnList.remove("index");
		columnList.remove("opdatetime");
	
		for (String str: columnList) {
			System.out.println(str);
		}

		List<Map<String, Object>> mapList = service.getTable(vo, columnList);
		List<String> key = new ArrayList<>();
		key.addAll(mapList.get(0).keySet());

		for (String str: key) {
			System.out.println("키값: " + str);
		}
		ModelAndView model = new ModelAndView();
		model.addObject("list", mapList);
		model.setViewName("test");
		
		return model;
	}
	
	@GetMapping("/second")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/second");
		model.addObject("list", null);
		
		return model;
	}
	
	@GetMapping("/first")
	public ModelAndView register(@Param("pageNum") Integer pageNum) {
		ModelAndView model = new ModelAndView();
		Paging paging = new Paging(service.getCountUserInfo(), pageNum);
		List<UserVO> userList = service.getAllUserInfo(paging.getOffset());
		
		for (UserVO vo: userList) {
			System.out.println("리스트: " + vo);
		}
		model.addObject("list", userList);
		model.setViewName("/main/first");
		
		return model;
	}
	
	@GetMapping("/test")
	public ModelAndView test() {
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/test");
		return model;
	}
	
	@GetMapping("/pwdCheck")
	public int pwdCheck(UserVO vo) {
		var originPwd = service.getPassword(vo.getTiltName());
		if(originPwd.equals(vo.getPwd())) {
			return 0;
		} else {
			return 1;
		}
	}
	
}
