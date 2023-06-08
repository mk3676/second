package com.suwon.ezen.vo;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class DataVO {
	 private String label;
     private String fill;
     private List<Integer> data;
     private String backgroundColor;
     private String borderColor;
     private String pointBackgroundColor;
     private String pointHoverBackgroundColor;
     private List<Integer> borderDash;
     private double borderWidth;
     private int pointRadius;
     private int pointHoverRadius;
     private String pointBorderColor;
}
