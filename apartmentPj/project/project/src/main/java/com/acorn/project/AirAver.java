package com.acorn.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirAver {
	private String resultCode;
	private String resultMsg;
	private int pageNo;
	private int totalCount;
	private String dataTime;
	private String stationName;
	private String mangName;
	private String so2Value;
	private String coValue;
	private String o3Value;
	private String no2Value;
	private String pm10Value;
	private String pm25Value;
	private String khaiValue;
	private String khaiGrade;
	private String so2Grade;
	private String coGrade;
	private String o3Grade;
	private String no2Grade;
	private String pm10Grade;
	private String pm25Grade;


}
