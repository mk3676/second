package com.suwon.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.suwon.ezen.service.DataService;
import com.suwon.ezen.vo.UserVO;

import lombok.Setter;

@RestController
@RequestMapping("/main/*")
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
			model.setViewName("redirect:/main/displayData");
		}
		else {
			model.setViewName("test");
		}
		
		return model;
	}
	
	@GetMapping("displayData")
	public ModelAndView displayData(String pointer) {
		System.out.println("displayData, pointer: " + pointer);
		UserVO vo = service.getUserInfo(pointer);
		
		List<String> columnList =  service.getTiltColumn(vo.getTiltName());
		columnList.remove("index");
		columnList.remove("opdatetime");

		ModelAndView model = new ModelAndView();
		model.addObject("columnList", columnList);
		model.setViewName("test");
		
		return model;
	}
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/index");
		model.addObject("list", null);
		
		return model;
	}
	
	@GetMapping("/register")
	public ModelAndView register() {
		ModelAndView model = new ModelAndView();
		model.setViewName("/main/register");
		return model;
	}
}
