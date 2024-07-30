package com.acorn.project;


import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApartAPI {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/FmlandWthrInfoService/getDayStatistics"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=XHhofBD0jO01cbj7mByrLZmfjk4RCQk%2Fv5Rvx7oXy%2FdhxB0PpL5LIVKGrw3jMiYMphG8vIw8BJTsL876ezO44A%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON)*/
        urlBuilder.append("&" + URLEncoder.encode("ST_YMD","UTF-8") + "=" + URLEncoder.encode("20161201", "UTF-8")); /*일통계 시작 날짜(YYYYMMDD)*/
        urlBuilder.append("&" + URLEncoder.encode("ED_YMD","UTF-8") + "=" + URLEncoder.encode("20161201", "UTF-8")); /*일통계 종료 날짜(YYYYMMDD)*/
        urlBuilder.append("&" + URLEncoder.encode("AREA_ID","UTF-8") + "=" + URLEncoder.encode("4122000000", "UTF-8")); /*지역 아이디(활용가이드 하단첨부 참고)*/
        urlBuilder.append("&" + URLEncoder.encode("PA_CROP_SPE_ID","UTF-8") + "=" + URLEncoder.encode("PA130201", "UTF-8")); /*주산지 작물별 특성 아이디(활용가이드 하단첨부 참고)*/
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
}