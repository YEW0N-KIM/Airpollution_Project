package com.acorn.project;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApartAPI {
    public static void main(String[] args) throws IOException {
    	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty");
	 	urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=XHhofBD0jO01cbj7mByrLZmfjk4RCQk%2Fv5Rvx7oXy%2FdhxB0PpL5LIVKGrw3jMiYMphG8vIw8BJTsL876ezO44A%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수(조회 날짜로 검색 시 사용 안함)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호(조회 날짜로 검색 시 사용 안함)*/
        urlBuilder.append("&" + URLEncoder.encode("sidoName","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /*시도*/
        urlBuilder.append("&" + URLEncoder.encode("ver","UTF-8") + "=" + URLEncoder.encode("1.4", "UTF-8")); /* 버전 */
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
    }
    
//  ﻿측정소별 실시간 측정정보 조회 : ﻿getMsrstnAcctoRltmMesureDnsty
//  ﻿https://api.odcloud.kr/api/RltmArpltnInforInqireSvrc/v1/getMsrstnAcctoRltmMesureDnsty?numOfRows=1&stationName=강남구&dataTerm=DAILY&ver=1.3&serviceKey=서비스키

//  ﻿통합대기환경지수 나쁨 이상 측정소 목록조회 : ﻿getUnityAirEnvrnIdexSnstiveAboveMsrstnList
//  https://api.odcloud.kr/api/RltmArpltnInforInqireSvrc/v1/getUnityAirEnvrnIdexSnstiveAboveMsrstnList?numOfRows=1&serviceKey=서비스키

  //    ﻿시도별 실시간 측정정보 조회 : ﻿getCtprvnRltmMesureDnsty
//	﻿https://api.odcloud.kr/api/RltmArpltnInforInqireSvrc/v1/getCtprvnRltmMesureDnsty?numOfRows=1&sidoName=서울&serviceKey=서비스키

}