<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "cs.deemo.dao.*, cs.deemo.dto.*, java.util.List, java.sql.Date" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <script type="text/javascript">
  function PageMove(page){
      location.href = "boardlist.do?page="+page;
    }
  </script>
    <title>Deemo 게시판</title>
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/desgin.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </head>
  <body>
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" id="navi">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="#">곡</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">일러스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">스토리</a>
        </li>
        </ul>
        <img src="image/DEEMOLOGO.png" alt="LOGOIMG" width="50px" height="50" onclick="location.href='index.jsp'" style="display:block; margin-left:auto; margin-right:auto;">
       	<%if(session.getAttribute("id") == null) {%>
        <a class="navbar-brand" href="#" data-toggle="modal" data-target="#myModal">Login</a>
        <% }else{ %> 
        <font color="white"><%=session.getAttribute("id") %>님 환영합니다</font>&nbsp;&nbsp;
        <a class="text-secondary" href="LogoutPro.jsp" class="trigger-btn">Logout</a>
        <% } %>
      </nav>
      
    <div class="container-fulid" style="background-image: url('image/deemo2.jpg'); height:600px; background-repeat:no-repeat;">
    <div id="box">
          <h1 class style="color: white;">게시판</h1>
    </div>
  	</div>
			
			
			
<div class="container">
<form method="post" action="search.do">
				<div class="container col-lg-4">
					<input type="text" class="form-control" placeholder="Search" name="kwd" style="margin:auto; float:left;"></input>
				</div>	
				<div style="float:left; margin-bottom:3%;">
					<button class="btn btn-primary" type="submit" style="float: center;">검색	 </button>
				</div>
			</form>
   <table class="table table-hover">
      <thead>
        <tr>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>날짜</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
				<c:forEach var="dto" items = "${dtos}">
					<tr>
						<td><a href="bview.do?no=${dto.no}">${dto.num}</a></td>
						<td><a href="bview.do?no=${dto.no}">${dto.title}</a></td>
						<td><a href="bview.do?no=${dto.no}">${dto.writer}</a></td>
						<td><a href="bview.do?no=${dto.no}"><fmt:formatDate value="${dto.regdate}"/></a></td>
						<td><a href="bview.do?no=${dto.no}">${dto.views}</a></td>
				</tr>
				</c:forEach>
      </tbody>
    </table>
    <hr>

    <a class="btn btn-info" href="boardWrite.jsp" id="textWrite">글쓰기</a>

    <br>

    <div class="toolbar-bottom" style="text-align: center;">
		  <div class="toolbar mt-lg">
		    <div class="sorter">
		      <ul class="pagination" style="display:table; margin-left:auto; margin-right:auto;">
		        <li class="btn btn-outline-dark rounded-0"><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
		        <li class="btn btn-outline-dark rounded-0"><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
		              <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		                  <c:choose>
		                      <c:when test="${i eq paging.pageNo}">
		                <li class="btn btn-outline-dark rounded-0 active text-white"><a href="javascript:PageMove(${i})">${i}</a></li>
		                      </c:when>
		                      <c:otherwise>
		                        <li class="btn btn-outline-dark rounded-0"><a href="javascript:PageMove(${i})">${i}</a></li>
		                      </c:otherwise>
		                  </c:choose>
		              </c:forEach>
		        <li class="btn btn-outline-dark rounded-0"><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
		        <li class="btn btn-outline-dark rounded-0"><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
     		  </ul>
    		</div>
  		</div>
		</div>
	</div>
 </body>
</html>