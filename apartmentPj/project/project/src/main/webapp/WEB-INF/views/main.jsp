<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.acorn.project.AirAver" %>
<%@ page import="org.json.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="/project/resources/css/map.css">
</head>
<body>
	<%-- <div id="map" style="width: 100%; height: 80vh;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<% ArrayList<AirAver> airList = (ArrayList<AirAver>)request.getAttribute("airList"); %>
	
	<c:forEach var="list" items="${airList}" >

		<div> 측정소 명 :${list.stationName}</div>
		<div> 측정망 정보 :${list.mangName}</div>
		<div> 측정 날짜 ㅣ ${list.dataTime }</div>
		<div> 아황산가스 농도 : ${list.so2Value}</div>
		<div> ﻿일산화탄소 농도 : ${list.coValue}</div>
		<div> ﻿﻿오존 농도 : ${list.o3Value}</div>
		<div> ﻿﻿이산화질소 농도 : ${list.no2Value}</div>
		<div> ﻿﻿미세먼지(PM10) 농도 : ${list.pm10Value}</div>
		<div>﻿미세먼지(PM2.5) 농도 : ${list.pm25Value}</div>
		<div> ﻿통합대기환경수치 : ${list.khaiValue}</div>
		<div> ﻿통합대기환경지수 : ${list.khaiGrade}</div>
		<div> ﻿﻿아황산가스 지수 : ${list.so2Grade}</div>
		<div> ﻿﻿일산화탄소 지수 : ${list.coGrade}</div>
		<div> ﻿오존 지수 : ${list.o3Grade}</div>
		<div> ﻿﻿﻿이산화질소 지수 : ${list.no2Grade}</div>
		<div> ﻿미세먼지(PM10) 24시간 등급 : ${list.pm10Grade}</div>
		<div> ﻿미세먼지(PM2.5) 24시간 등급 : ${list.pm25Grade}</div>
		<hr>
	</c:forEach> --%>
	<% ArrayList<AirAver> airList = (ArrayList<AirAver>)request.getAttribute("airList"); %>
	 <div class="main_container">
        <div id="map"></div> 
        <div class="air_info">
            <h2 class="air_info_title">오늘의 서울</h2>
            
            <select name="stationName" id="" class="stationName">
            	<c:forEach var="list" items="${airList}">
            	    <option value="staionName">${list.stationName}</option>
                </c:forEach>
            </select>

            <c:forEach var="list" items="${airList}" >
                <div class="air_info_detail">
                    <h3 class="detail_title">${list.stationName} </h3>
                    <div class="interGrade"> 
                        <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256 256-114.6 256-256S397.4 0 256 0zm80 176c17.68 0 31.97 14.25 31.97 32s-14.29 32-31.97 32c-17.8 0-32.09-14.25-32.09-32s14.29-32 32.09-32zm-160.9 0c17.8 0 32.09 14.25 32.09 32s-14.29 32-32.09 32c-17.68 0-31.97-14.25-31.97-32s15.17-32 31.97-32zM256 432c-60.55 0-134.5-38.25-143.9-93.25-1.938-11.88 9.324-21.62 20.71-18C163.1 330.5 208 336 256 336s92.88-5.5 123.2-15.25c11.26-3.625 22.52 6.125 20.71 18C390.5 393.8 316.5 432 256 432z" fill="#339af0" class="fill-000000"></path></svg>
                    </div>

                    <div class="stationInfo detail_info"> ${list.mangName}</div>
                    <div class="date detail_info"> ${list.dataTime }</div>
                    
                    <div class="info_gallery1">
                        <div class="so2value_container gallery_box"> 
                            <div class="so2 title">아황산가스</div>
                            <div class="so2Grade">${list.so2Grade}</div>
                            <div class="so2Value">${list.so2Value}</div>
                        </div>
                        
                        <div class="coValue_container gallery_box"> 
                            <div class="co title">일산화탄소</div>
                            <div class="coGrade">${list.coGrade}</div>
                            <div class="coValue">${list.coValue}</div>
                        </div>

                        <div class="o3Value_container gallery_box"> 
                            <div class="o3 title">오존</div>
                            <div class="o3Grade">${list.o3Grade}</div>
                            <div class="o3Value">${list.o3Value}</div>
                        </div>
                    </div>
                    
                    <div class="info_gallery2">
                        <div class="no2Value_container gallery_box"> 
                            <div class="no2 title">이산화질소</div>
                            <div class="no2Grade">${list.o3Grade}</div>
                            <div class="no2Value">${list.o3Value}</div>
                        </div>

                        <div class="pm10Value_container gallery_box"> 
                            <div class="pm10 title">미세먼지</div>
                            <div class="pm10Grade">${list.pm10Grade}</div>
                            <div class="pm10Value">${list.pm10Value}</div>
                        </div>

                        <div class="pm25Value_container gallery_box"> 
                            <div class="pm25 title">초미세먼지</div>
                            <div class="pm25Grade">${list.pm25Grade}</div>
                            <div class="pm25Value">${list.pm25Value}</div>
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </div>
     </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script>
    <script src="map.js"></script>
	

</body>
</html>

