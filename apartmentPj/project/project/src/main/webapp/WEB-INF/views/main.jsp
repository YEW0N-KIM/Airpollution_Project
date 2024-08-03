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
	<% 
		ArrayList<AirAver> airList = (ArrayList<AirAver>)request.getAttribute("airList");
		String sido = (String)request.getAttribute("sido");
	%>
	 <div class="main_container">
        <div id="map"></div> 
        <div class="air_info">
            <h2 class="air_info_title">오늘의 <span id="title_sido">${sido}<span></h2>
            
            <select name="stationName" id="" class="stationName">
            	<c:forEach var="list" items="${airList}">
            	    <option value="staionName"> ${sido} ${list.stationName}</option>
                </c:forEach>
            </select>

            <c:forEach var="list" items="${airList}" >
                <div class="air_info_detail">
                    <h3 class="detail_title">${list.stationName} </h3>
                    <div class="interGrade"> 
                    		<c:choose>
                    			<c:when test="${list.khaiGrade eq '1'}">   			
                    				 <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256 256-114.6 256-256S397.4 0 256 0zm80 176c17.68 0 31.97 14.25 31.97 32s-14.29 32-31.97 32c-17.8 0-32.09-14.25-32.09-32s14.29-32 32.09-32zm-160.9 0c17.8 0 32.09 14.25 32.09 32s-14.29 32-32.09 32c-17.68 0-31.97-14.25-31.97-32s15.17-32 31.97-32zM256 432c-60.55 0-134.5-38.25-143.9-93.25-1.938-11.88 9.324-21.62 20.71-18C163.1 330.5 208 336 256 336s92.88-5.5 123.2-15.25c11.26-3.625 22.52 6.125 20.71 18C390.5 393.8 316.5 432 256 432z" fill="#339af0" class="fill-000000"></path></svg>
                    			</c:when>
                    			<c:when test="${list.khaiGrade eq '2'}">   			
                    				<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256 256-114.6 256-256S397.4 0 256 0zm80 176c17.69 0 31.99 14.3 31.99 32s-14.3 32-31.99 32-32.02-14.3-32.02-32 14.32-32 32.02-32zm-160.9 0c17.69 0 32.02 14.3 32.02 32s-14.33 32-32.02 32-31.99-14.3-31.99-32 15.19-32 31.99-32zm195.7 170.2c-28.5 34.2-70.3 52.9-114.8 52.9s-86.27-19.55-114.8-53.76c-13.59-16.3 10.95-36.7 24.57-20.5C188.2 352.6 221 367.9 256 367.9s67.82-15.42 90.2-42.22c13.4-16.18 38.1 4.22 24.6 20.52z" fill="#00c73c" class="fill-000000"></path></svg>	 
                    			</c:when>
                    			<c:when test="${list.khaiGrade eq '3'}">   			
                    				<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256 256-114.6 256-256S397.4 0 256 0zm-80.9 176c17.69 0 32.02 14.3 32.02 32s-14.33 32-32.02 32-31.99-14.3-31.99-32 15.19-32 31.99-32zM352 368H159.1c-21.19 0-21.19-32 0-32h192c22.1 0 22.1 32 .9 32zm-16-128c-17.69 0-32.02-14.3-32.02-32s14.33-32 32.02-32 31.99 14.3 31.99 32-14.29 32-31.99 32z" fill="#fcc419" class="fill-000000"></path></svg>
                    			</c:when>
                    			<c:when test="${list.khaiGrade eq '4'}">   			
                    				<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256 256-114.6 256-256S397.4 0 256 0zm80 176c17.68 0 31.97 14.25 31.97 32s-14.29 32-31.97 32c-17.8 0-32.09-14.25-32.09-32s14.29-32 32.09-32zm-160.9 0c17.8 0 32.09 14.25 32.09 32s-14.29 32-32.09 32c-17.68 0-31.97-14.25-31.97-32s15.17-32 31.97-32zm196 223.7c-1 .2-2.1.3-4 .3-7.469 0-14.12-5.25-15.66-12.88C351.8 384.5 337.1 320 256 320s-95.75 64.47-96.34 67.22c-1.812 8.625-10.03 14.16-18.88 12.41-8.625-1.781-14.19-10.12-12.47-18.75C134.8 348.8 169.7 288 256 288s121.3 60.75 127.7 92.88c1.7 8.62-3.9 16.22-12.6 18.82z" fill="#fa5252" class="fill-000000"></path></svg>
                    			</c:when>
                    			<c:otherwise>
                    				<svg data-name="Layer 1" id="Layer_1" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#efcc00;}.cls-2{fill:#353535;}</style></defs><title/><path class="cls-1" d="M30.16,11.51,6.84,51.9a2.13,2.13,0,0,0,1.84,3.19H55.32a2.13,2.13,0,0,0,1.84-3.19L33.84,11.51A2.13,2.13,0,0,0,30.16,11.51Z"/><path class="cls-2" d="M29,46a3,3,0,1,1,3,3A2.88,2.88,0,0,1,29,46Zm1.09-4.66-.76-15h5.26l-.73,15Z"/></svg>
                    			</c:otherwise>
                    		</c:choose>
                       
                    </div>

                    <div class="stationInfo detail_info"> ${list.mangName}</div>
                    <div class="date detail_info"> ${list.dataTime }</div>
                    
                    <div class="info_gallery1">
                        <div class="so2value_container gallery_box"> 
                            <div class="so2 title">아황산가스</div>
                            <c:choose>
                            	<c:when test="${list.so2Grade eq '1' }">
                            		<div class="so2Grade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.so2Grade eq '2' }">
                            		<div class="so2Grade">보통</div>
                            	</c:when>
                            	<c:when test="${list.so2Grade eq '3' }">
                            		<div class="so2Grade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.so2Grade eq '4' }">
                            		<div class="so2Grade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="so2Value">${list.so2Value}</div>
                        </div>
                        
                        <div class="coValue_container gallery_box"> 
                            <div class="co title">일산화탄소</div>
                            <c:choose>
                            	<c:when test="${list.coGrade eq '1' }">
                            		<div class="coGrade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.coGrade eq '2' }">
                            		<div class="coGrade">보통</div>
                            	</c:when>
                            	<c:when test="${list.coGrade eq '3' }">
                            		<div class="coGrade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.coGrade eq '4' }">
                            		<div class="coGrade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="coValue">${list.coValue}</div>
                        </div>

                        <div class="o3Value_container gallery_box"> 
                            <div class="o3 title">오존</div>
                             <c:choose>
                            	<c:when test="${list.o3Grade eq '1' }">
                            		<div class="o3Grade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.o3Grade eq '2' }">
                            		<div class="o3Grade">보통</div>
                            	</c:when>
                            	<c:when test="${list.o3Grade eq '3' }">
                            		<div class="o3Grade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.o3Grade eq '4' }">
                            		<div class="o3Grade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="o3Value">${list.o3Value}</div>
                        </div>
                    </div>
                    
                    <div class="info_gallery2">
                        <div class="no2Value_container gallery_box"> 
                            <div class="no2 title">이산화질소</div>
                            <c:choose>
                            	<c:when test="${list.no2Grade eq '1' }">
                            		<div class="no2Grade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.no2Grade eq '2' }">
                            		<div class="no2Grade">보통</div>
                            	</c:when>
                            	<c:when test="${list.no2Grade eq '3' }">
                            		<div class="no2Grade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.no2Grade eq '4' }">
                            		<div class="no2Grade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="no2Value">${list.no2Value}</div>
                        </div>

                        <div class="pm10Value_container gallery_box"> 
                            <div class="pm10 title">미세먼지</div>
                             <c:choose>
                            	<c:when test="${list.pm10Grade eq '1' }">
                            		<div class="pm10Grade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.pm10Grade eq '2' }">
                            		<div class="pm10Grade">보통</div>
                            	</c:when>
                            	<c:when test="${list.pm10Grade eq '3' }">
                            		<div class="pm10Grade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.pm10Grade eq '4' }">
                            		<div class="pm10Grade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="pm10Value">${list.pm10Value}</div>
                        </div>

                        <div class="pm25Value_container gallery_box"> 
                            <div class="pm25 title">초미세먼지</div>
                            <c:choose>
                            	<c:when test="${list.pm25Grade eq '1' }">
                            		<div class="pm25Grade">좋음</div>
                            	</c:when>
                            	<c:when test="${list.pm25Grade eq '2' }">
                            		<div class="pm25Grade">보통</div>
                            	</c:when>
                            	<c:when test="${list.pm25Grade eq '3' }">
                            		<div class="pm25Grade">나쁨</div>
                            	</c:when>
                            	<c:when test="${list.pm25Grade eq '4' }">
                            		<div class="pm25Grade">매우 나쁨</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="pm25Grade">측정 불가</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="pm25Value">${list.pm25Value}</div>
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </div>
     </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7560b5ddb94a9dc91354ef62a6b750ee"></script>
    <script src="/project/resources/js/map.js"></script>
	

</body>
</html>

