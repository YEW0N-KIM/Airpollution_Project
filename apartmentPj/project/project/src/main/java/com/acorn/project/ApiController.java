package com.acorn.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ApiController {
    
	@GetMapping("/api")
	public String averageAir(Model model) throws IOException {
		//	시도별 실시간 측정정보 조회
	 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty");
	 	urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=XHhofBD0jO01cbj7mByrLZmfjk4RCQk%2Fv5Rvx7oXy%2FdhxB0PpL5LIVKGrw3jMiYMphG8vIw8BJTsL876ezO44A%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수(조회 날짜로 검색 시 사용 안함)*/
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
        
        // JSON 데이터
        String jsonData2 = (String) sb.toString();
        JSONObject jsonData = new JSONObject(jsonData2);
        JSONObject jsonresp = jsonData.getJSONObject("response");
        
        // Header
        JSONObject header = jsonresp.getJSONObject("header");
        String resultCode = header.getString("resultCode");
        String resultMsg = header.getString("resultMsg");
        
        // Body
        JSONObject body = jsonresp.getJSONObject("body");
        int pageNo = body.getInt("pageNo");
        int totalCount = body.getInt("totalCount");
        
        ArrayList<AirAver> airList = new ArrayList<>();
        
        // Item
        JSONArray items = body.getJSONArray("items");
        for(int i = 0; i<items.length(); i++) {
        	JSONObject item = items.getJSONObject(1);
        	String dataTime = item.getString("dataTime");
        	String stationName = item.getString("stationName");
        	String mangName = item.getString("mangName");
        	String so2Value = item.getString("so2Value");
        	String coValue = item.getString("coValue");
        	String o3Value = item.getString("o3Value");
        	String no2Value = item.getString("no2Value");
        	String pm10Value = item.getString("pm10Value");
        	String pm25Value = item.getString("pm25Value");
        	String khaiValue = item.getString("khaiValue");
        	String khaiGrade = item.getString("khaiGrade");
        	String so2Grade = item.getString("so2Grade");
        	String coGrade = item.getString("coGrade");
        	String o3Grade = item.getString("o3Grade");
        	String no2Grade = item.getString("no2Grade");
        	String pm10Grade = item.getString("pm10Grade");
        	String pm25Grade = item.getString("pm25Grade");

        	AirAver data = new AirAver(resultCode, resultMsg, pageNo, totalCount, dataTime, stationName,
        			mangName, so2Value, coValue, o3Value, no2Value, pm10Value, pm25Value, khaiValue, khaiGrade, 
        			so2Grade, coGrade, o3Grade, no2Grade, pm10Grade, pm25Grade);
        	
        	airList.add(data);
        }
        
       
        model.addAttribute("airList", airList);
       
        
        
		return "main";
	}

}