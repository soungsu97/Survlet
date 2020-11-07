<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import = "cs.dit.dao.*, cs.dit.dto.*, java.util.List, java.sql.Date" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
<div class="container">
	<h2>글 내용보기</h2>
	<br>
		<table class="table table-striped table-hover">
			<tr>
				<th>제목</th><td>${dto.title}</td>
			</tr>
			<tr>
				<th>작성자</th><td>${dto.writer}</td> 
			</tr>
			<tr>
				<th>날짜</th><td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>내용</th><td>${dto.content}</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value ="글 수정" onclick ="location.href='bview.do'">
					<input type="button" value ="글 삭제" onclick ="location.href='bdelete.do?no=${dto.no}'">
					<input type="button" value ="글 목록" onclick ="location.href='blist.do'">
				</td>
			</tr>
		</table><br><br>
	</form>
</div>
</body>
</html>