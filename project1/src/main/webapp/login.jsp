<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
<link rel='stylesheet' href='assets/css/demo.css'>
<link rel='stylesheet' href='assets/css/style.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>


</head>
<body>

<div class="container">
  <button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal">
    Login
  </button>  
</div>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4>Login</h4>
          <br> <br>
        </div>
        <div class="d-flex flex-column text-center">
          <form id=loginForm action="./LoginService" method="post" >
            <div class="form-group">
              <input name="id" type="id" class="form-control" id="id"placeholder="아이디">
            </div>
            <div class="form-group">
              <input name="pw" type="password" class="form-control" id="password1" placeholder="비밀번호">
            </div>
           <!--   <button type="button" class="btn btn-info btn-block btn-round">로그인</button> -->
            <!--  a href="#" class="btn btn-default btn-block m-t-md"> 로그인 </a>-->
            <div class="btn btn-default btn-block m-t-md">
             <a href="javascript:goLogin()" class="newbtn btn-default btn-block m-t-md">로그인</a> <br><br>
             
            <a href="join.jsp" class="newbtn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
          </form>

      </div>
    </div>
	</div>
  </div>
</div>
<script type="text/javascript">

function goLogin(){
	var form = $('#loginForm');
    
    form.submit();
}
 
 $(document).ready(function() {             
	 $('#loginModal').modal('show');
	   $(function () {
	     $('[data-toggle="tooltip"]').tooltip()
	   })
	 })
 </script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Popper JS -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<!-- Bootstrap JS -->
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
</body>
</html>