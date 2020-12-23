<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "cs.deemo.dao.*, cs.deemo.dto.*, java.util.List, java.sql.Date" %>
    <%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
	  <%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
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
          
          
			<form action="bupdate2.do?no=${dto.no}" method="post">
        <div class="container">
        <input type="hidden" name="no" value="${dto.no }" id="no">
          
          <div style="margin-top:10%;">
          <div class="text-center" style="margin-bottom:20px;">
            <h2>${dto.title }</h2>
          </div>
          <div class="text-right" style="">
              <a href="boardlist.do" style="color:gray;">목록으로</a>
          </div>
          <div class="text-right">
            작성자 : ${dto.writer } &nbsp;
            작성일 : ${dto.regdate }
          </div>
          </div>
          <hr>
          <div class="context">
           ${dto.context }
          </div>
          <hr>
          <input type="submit" value ="글 수정" >
					<input type="button" value ="글 삭제" onclick ="location.href='bdelete.do?no=${dto.no}'">
          <hr>
        </div>
        </form>
    </body>
    <head>
    	<script type="text/javascript">
    		var no = encodeURIComponent(document.getElementById("no").value);    		
    		
    		function replylist(){
    			$.ajax({
    				url:'replyLoad.rp',
    				type:'post',
    				data: {"cboard": no},
    				async:true,
    				dataType:'json',
    				success:function(data){
    					var str = '';
    					
    					for(var i in data){
    						str +='<div>';
    						str +='<table border="0" style="width:100%;  border-spacing: 0 10px;"><tr><td style="text-align:left;"><strong>'+ data[i].cid + 
    						'</strong></td><td style="text-align:right;"><small class="pull-right text-muted">'+ data[i].cdate + '</small></td></tr>';
    						str +='<tr><td colspan="2" style="text-align: justify; text-justify: distribute;">' +data[i].ccontent + '</td></tr>';
    						str +='</table>';
    						str +='</div><hr>'
    						
    						console.log(data[i]);
    					}
    					$('#replyTable').html(str);
    				}	
    			});
    		}
	 		

    		function rinsert() {
    			var ccontent = encodeURIComponent(document.getElementById("ccontent").value);
    	 		$.ajax({
    	 			url:'replyInsert.rp',
    	 			data:{"cboard":no, "ccontent":ccontent},
    	 			type:'POST',
    	 			async:true,
    	 			success:function() {
    	 				replylist();
    	 				$('#ccontent').val("");
    	 			}
    	 		});
    		}
    		
    		$('document').ready(function() {
    			replylist();
    			object.style.wordWrap="break-word"
    		});
    	</script>
    </head>
    <body>
    <div class="container">
          <div>
            <textarea placeholder="댓글을 입력해주세요" cols="150" rows="3" id="ccontent"></textarea>
          </div>
          <div class="text-right">
            <button class="btn btn-success" onclick="rinsert()">댓글입력</button>
          </div>
        	<div class="container" style="text-align:center; border:1px solid #dddddd; white-space:normal;">
						<div id ="replyTable">
						</div>
					</div>
		</div>
    </body>
  </html>