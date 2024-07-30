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
		${list}
	</c:forEach>
	

</body>
</html>

