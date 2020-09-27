<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8") %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보</title>
</head>
<body>
	<jsp:useBean id="dto" class="week4.BookBean" scope="request"/>
	<c:set target="${dto }" var="name" value="${param.name }"/>
	<c:set target="${dto }" var="author" value="${param.author }"/>
 	<c:set target="${dto }" var="publisher" value="${param.publisher }"/>
	
		<h2>도서정보</h2>
		책 제목 : ${name }<br>
		작  가 : ${author }<br>
		출판사 : ${publisher }
</body>
</html>