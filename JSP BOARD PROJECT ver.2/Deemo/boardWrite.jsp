<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- <script src="/js/summernote/summernote-lite.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/css/summernote/summernote-lite.css"> -->
    <title>Deemo 글작성</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/desgin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <script>
  $(document).ready(function() {
     $('#summernote').summernote({
             height: 300,
             minHeight: null,
             maxHeight: null,
             lang: "ko-KR"
     });
});
  

window.onload =function() {
  document.getElementById('title').focus();
}
    </script>
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

  <div class="container">
   <form action="binsert.do" method="post">
     <input name="title" type="text" placeholder="제목" size="100" maxlength="50"> <br>
		<br><br>
    <textarea name="context" id="summernote" value=""></textarea>
    <input type="submit" value="등록하기">
    <input type="button" value="돌아가기" onClick="location.href='board.html'">
  </form>
</div>
  </body>
</html>