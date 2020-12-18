<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
  <title>Deemo 메인화면</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/desgin.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	button{
		
	}
	</style>
	
  <script>
  jQuery(document).ready(function($){
    $(".scroll").click(function(event){
      event.preventDefault();
      $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
  });

  // $(window).scroll(function() {
  //     if($(this).scrollTop() == 0)
  //     $('#navi').css('opacity','.4');
  //
  //     else
  //         $('#navi').css('opacity','1');
  // });
  
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
        <button type="button" onclick="location.href='index.jsp'" style="display:block;
		margin-left:auto;
		margin-right: auto;">
        <img src="image/DEEMOLOGO.png" alt="LOGOIMG" width="50px" height="50">
        </button>
       	<%if(session.getAttribute("id") == null) {%>
        <a class="navbar-brand" href="#" data-toggle="modal" data-target="#myModal">Login</a>
        <% }else{ %> 
        <font color="white"><%=session.getAttribute("id") %>님 환영합니다</font>&nbsp;&nbsp;
        <a class="text-secondary" href="LogoutPro.jsp" class="trigger-btn">Logout</a>
        <% } %>
      </nav>

 <div class="modal" id="myModal">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h4 class="modal-title">Login</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <div class="modal-body" style="text-align:center;">
           <div class="container">
           <form action="login.do" method="post">
             <label for="id"><b>Username</b></label>
             <input type="text" placeholder="Enter Username" name="id" required>
             <br>
             <label for="pwd"><b>Password</b></label>
             <input type="password" placeholder="Enter Password" name="pwd" required>
             <br>
             <input id="sub" type="submit" value="Login">
             <input id="sign" type="button" data-toggle="modal" data-target="#myModal2" value="Sign Up">
           </div>
         </div>
         </form>
         <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
         </div>
       </div>
     </div>
   </div>

   <div class="modal fade" id="myModal2">
       <div class="modal-dialog modal-md">
         <div class="modal-content">

           <div class="modal-header">
             <h4 class="modal-title">Join</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>

           <div class="modal-body" style="text-align:center; vertical-align: middle; padding: 50px 0px 0px 5%;">
             <div class="container">
               <div class="col-md-11 col-md-offset-3">
               	<form action="insert.do" method="post">
                    <div class="form-group">
                       <label for="inputId">아이디</label>
                       <input type="text" class="form-control" id="inputId" name="id" placeholder="아이디를 입력해주세요">
                   </div>
                   <div class="form-group">
                       <label for="inputPassword">비밀번호</label>
                       <input type="password" class="form-control" id="inputPassword" name="pwd" placeholder="비밀번호를 입력해주세요">
                   </div>
                     <div class="form-group">
                         <label for="inputName">성명</label>
                         <input type="text" class="form-control" id="inputName" name="name" placeholder="이름을 입력해주세요">
                     </div>
                     <div class="form-group">
                         <label for="InputEmail">이메일 주소</label>
                         <input type="email" class="form-control" id="InputEmail" name="email" placeholder="이메일 주소를 입력해주세요">
                     </div>
                     <div class="form-group">
                         <label for="inputMobile">휴대폰 번호</label>
                         <input type="tel" class="form-control" id="inputMobile" name="mobile" placeholder="휴대폰번호를 입력해주세요">
                     </div>

                     <div class="form-group text-center">
                         <input type="submit" id="join-submit" class="btn btn-primary" value="회원가입">

                         <input type="button" onClick="location.href='index.jsp'" class="btn btn-warning" value="가입취소">
                     </div>
                 </form>
             </div>
           </div>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           </div>
         </div>
       </div>
     </div>

  <div class="container-fulid" style="background-image: url('image/deemo.jpg');"id="mainback">
    <div id="box">
          <h1 class>Deemo의 세계의 오신것을 환영합니다.</h1><br><br><br><br>
          <a class="btn btn-primary scroll" href="#target">Get Started</a>
    </div>
  </div>

<div id="target">
  <a href="boardlist.do">
 <div class="container-fluid">
  <div class="row">
  <div class="card" style="width:350px; height:350px;">
    <img class="card-img-top" src="image/WingsOfPiano.png" alt="Card image" style="width:100%; height:200px; border:1px solid;">
    <div class="card-body">
      <h4 class="card-title">Wings of piano</h4>
      <p class="card-text">곡 중에서 국내에서도 매우 인지도가 높은 곡 중 하나</p>
    </div>
    </a>
  </div>

  <a href="board.html">
  <div class="card" style="width:350px; height:350px;">
    <img class="card-img-top" src="image/Deemo.png" alt="Card image" style="width:100%; height:200px;">
    <div class="card-body">
      <h4 class="card-title">Undo</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
    </div>
    </a>
  </div>


  <div class="card" style="width:350px; height:350px;">
    <img class="card-img-top" src="image/Deemo.png" alt="Card image" style="width:100%; height:200px;">
    <div class="card-body">
      <h4 class="card-title">Platinum</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
    </div>
  </div>
</div>
</div>


  <div class="container-fluid">
    <div class="row">
      <div class="card" style="width:350px; height:350px;">
        <img class="card-img-top" src="image/Deemo.png" alt="Card image" style="width:100%; height:200px;">
        <div class="card-body">
          <h4 class="card-title">Sairai</h4>
          <p class="card-text"></p>
        </div>
      </div>

      <div class="card" style="width:350px; height:350px;">
        <img class="card-img-top" src="image/Deemo.png" alt="Card image" style="width:100%; height:200px;">
        <div class="card-body">
          <h4 class="card-title">Fable</h4>
          <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
        </div>
      </div>

      <div class="card" style="width:350px; height:350px;">
        <img class="card-img-top" src="image/Deemo.png" alt="Card image" style="width:100%; height:200px;">
        <div class="card-body">
          <h4 class="card-title">Magnolia</h4>
          <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
        </div>
      </div>
</div>
</div>
</section>

</body>
</html>
