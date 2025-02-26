package com.suwon.ezen.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private int cnt;
	private String username;
	private String phone;
	private String email;
	private String pwd;
	private String imageName;
	private String structureName;
	private String tiltName;
	private String pointer;
	private String status;
	private Date creDate;
}
