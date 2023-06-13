package com.suwon.ezen.controller;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@GetMapping("/displayColumn")
	public ModelAndView displayColumn(@RequestParam(value = "pageNum", required = false) Integer pageNum, @RequestParam String pointer) {
		System.out.println("displayColumn, pointer: " + pointer);
		// 사옹자 데이터 가져오기
		UserVO vo = service.getUserInfo(pointer);
		
		// 사용자 테이블(tilt + structure) 속성 가져오기(index, opdatetime 제거)
		List<String> columnList =  service.getTiltColumn(vo.getTiltName());
		columnList.remove("index");
		columnList.remove("opdatetime");

		// 사용자 테이블(tilt + structure) 전체 가져오기
		List<Map<String, Object>> mapList = service.getTable(vo, columnList);

		// 페이징 처리
		Paging paging = new Paging(service.getCountTilt(vo), pageNum);
		List<Map<String, Object>> pageList = mapList.subList(paging.getOffset(), Math.min(paging.getOffset() + 10, mapList.size()));
		
		// 사용자 테이블(tilt + structure) 속성 추가
		columnList.sort(Comparator.naturalOrder());
		columnList.add(0, "DATE");
		columnList.add(1, "BATT");
		columnList.add(2, "TEMP");
		
		// jsp로 전송
		ModelAndView model = new ModelAndView();
		model.addObject("list", mapList);
		model.addObject("key", columnList);
		model.addObject("pageList", pageList);
		model.addObject("paging", paging);
		model.addObject("pointer", pointer);
		model.setViewName("test");
		
		return model;
	}
	
	@GetMapping("/second")
	public ModelAndView index(@RequestParam(value = "pageNum", required = false) Integer pageNum, @RequestParam String pointer) {
		// 사옹자 데이터 가져오기
		UserVO vo = service.getUserInfo(pointer);
				
		// 사용자 테이블(tilt + structure) 속성 가져오기(index, opdatetime 제거)
		List<String> columnList =  service.getTiltColumn(vo.getTiltName());
		columnList.remove("index");
		columnList.remove("opdatetime");

		// 사용자 테이블(tilt + structure) 전체 가져오기
		List<Map<String, Object>> mapList = service.getTable(vo, columnList);

		// 페이징 처리
		Paging paging = new Paging(service.getCountTilt(vo), pageNum);
		List<Map<String, Object>> pageList = mapList.subList(paging.getOffset(), Math.min(paging.getOffset() + 10, mapList.size()));
				
		// 사용자 테이블(tilt + structure) 속성 추가
		columnList.sort(Comparator.naturalOrder());
		columnList.add(0, "DATE");
		columnList.add(1, "BATT");
		columnList.add(2, "TEMP");
				
		// jsp로 전송
		ModelAndView model = new ModelAndView();
		model.addObject("list", mapList);
		model.addObject("key", columnList);
		model.addObject("pageList", pageList);
		model.addObject("paging", paging);
		model.addObject("pointer", pointer);
		model.setViewName("/main/second");
				
		
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
		System.out.println("paging값: "+paging);
		model.addObject("list", userList);
		model.addObject("paging", paging);

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
	public ResponseEntity<HashMap<String, String>> pwdCheck(@Param("pwd") String pwd, @Param("cnt") int cnt) {
		System.out.println("패스워드 확인: " + pwd);
		UserVO vo = service.comparePassword(pwd, cnt);
		HashMap<String, String> map = new HashMap<String, String>(); 
		
		if (vo == null) {
			map.put("value", "0");
			map.put("text", "틀린 비밀번호 입니다.");
		}
		else if (pwd.equals(vo.getPwd())) {
			map.put("value", "1");
			map.put("text", vo.getPointer());
		}
		
		return new ResponseEntity<HashMap<String, String>>(map, HttpStatus.OK);
	}
	
}
