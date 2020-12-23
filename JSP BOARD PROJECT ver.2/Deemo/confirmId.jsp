<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "cs.deemo.dao.*, cs.deemo.dto.*, java.util.List, java.sql.Date" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = MemberDAO.getInstance();
		boolean result = dao.confirmId(id);
		
		if(result){ %>
		<center>
		<br/><br/>
		<h4>이미 사용중인 ID입니다.</h4>
		</center>
		<%} else {%>
		<center>
		<br/><br/>
		<h4>입력하신 <%=id %>는 사용할 수 있는 ID입니다.</h4>
		</center>	
		<%}%>
</body>
</html>