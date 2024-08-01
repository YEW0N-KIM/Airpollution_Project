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
</head>
<body>

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
	</c:forEach>
	

</body>
</html>

