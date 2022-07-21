<%@page import="Model.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가치해조 : 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">





html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #fff;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}


#logo {
	width: 240px;
	height: 44px;
	cursor: pointer;
}

#header {
	text-align: center;
	width: 100%;
	border-bottom:1.5px solid #ecf0ee;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

/* 입력폼 */
h3 {
	margin: 25px 0 15px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.box.int_id {
	padding-right: 110px;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}



.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}



#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
.btn_area {
	margin: 30px 0 91px;
}

#btnJoin {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background: #5865F2;
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
ul {list-style: none;}
li {list-style: none;}
a {text-decoration: none;}

.h_cont {display: flex; justify-content: space-around; padding-left: 150px; padding-top:0;}

.h_random {margin: 25px 0;}
.h_random li {display: inline-block; margin: 20px 0 0 20px;  }
.h_random li a {font-size: 24px; color: black; font-weight: 500; transition: 0.2s;}
.h_random li a:hover {color: #5865F2;}

.logo {
    display: inline-block;
    width: 150px;
    height: 50px;
    background: url(./image/Testimg/welogo.png) no-repeat;
    background-size: contain;
}

.h_menubar {margin: 25px 0;}
.h_menubar li {display: inline-block; margin: 20px 0 0 20px; }
.h_menubar li a {font-size: 24px; color: black; font-weight: 500; transition: 0.2s;}
.h_menubar li a:hover {color: #ff5b00;}


.h_menu {margin: 25px 0;}
.h_menu li {display: inline-block; margin: 30px 0 0 30px; }
.h_menu li a {font-size: 18px; color: black; font-weight: 500; transition: 0.2s;}
.h_menu li a:hover {color: #5865F2;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

<%
   LoginDTO dto = (LoginDTO)session.getAttribute("id"); 
%>



<header id="header">
            <div class="h_cont">
                <ul class="h_random">
                    <li><a href="view.jsp" class="logo"></a></li>
                    <!--  li><a href="#">둘러보기</a></nav>-->
                </ul>
                <ul class="h_menubar">
                   <!--  <li><a href="">파티 만들기</a></li> -->
                   <!-- <li><a href="#">파티 검색</a></li> -->
                   <!--   <li><a href="#">파티 기록</a></li>-->
                    <!-- li><a href="#">About us</a></li-->
                </ul>
                  <ul class="h_menu">
                   <li><a href="view.jsp">로그인</a></li>
                   <li><a href="Main.jsp">마이페이지</a></li>
                   
                </ul>
            </div>
        </header>
	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">
		
		
			<form action="JoinService1" method="post" enctype="multipart/form-data">
				<!-- ID -->
				<div>
					<h3 class="join_title">
					<label for="id">아이디 입력</label>
						
					</h3>
					<span class="box int_id"> <input name="id" type="text"
						id="input_id" class="int" maxlength="20" required> <span
						class="step_url">
							
					</span>
					</span> 
					<font id = "checkId" size = "2"></font>
				</div>

				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input name="pw" type="password"
						id="pswd1" class="int" maxlength="20" required> <span
						id="alertTxt">사용불가</span>

					</span> 
				</div>

				<!-- PW2 -->
				<div>
					<h3 class="join_title">
						<label for="nick">닉네임 입력</label>
					</h3>
					<span class="box int_pass_check"><input name="nick"
						type="name" id="input_nick" class="int" maxlength="20" required>
						
					</span>
					 <font id = "checkNick" size = "2"></font>
				</div>

				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> <input name="name" type="text"
						id="name" class="int" maxlength="20" required>
					</span> 
				</div>

				<!-- BIRTH -->
				<div>
					<h3 class="join_title">
						<label for="yy">생년월일</label>
					</h3>

					<div id="bir_wrap">
						<!-- BIRTH_YY -->
						<div id="bir_yy">
							<span class="box"> <input name="birth_yy" type="text"
								id="yy" class="int" maxlength="4" placeholder="년(4자)" required>
							</span>
						</div>

						<!-- BIRTH_MM -->
						<div id="bir_mm">
							<span class="box"> <select name="birth_mm" id="mm"
								class="sel">
									<option>월</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select>
							</span>
						</div>

						<!-- BIRTH_DD -->
						<div id="bir_dd">
							<span class="box"> <input name="birth_dd" type="text"
								id="dd" class="int" maxlength="2" placeholder="일" required>
							</span>
						</div>

					</div>
					
				</div>

				<!-- GENDER -->
				<div>
					<h3 class="join_title">
						<label for="gender">성별</label>
					</h3>
					<span class="box gender_code"> <select name="gender"
						id="gender" class="sel">
							<option>성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
					</select>
					</span> 
				</div>

				<!-- EMAIL -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일<span class="optional"></span></label>
					</h3>
					<span class="box int_email"> <input name="email" type="text"
						id="email" class="int" maxlength="100" placeholder="이메일 입력"
						required>
					</span> 
				</div>

				<!-- MOBILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input name="phone" type="tel"
						id="mobile" class="int" maxlength="16" placeholder="전화번호 입력"
						required>
					</span> 
				</div>

				<!-- profile -->
				<div>
					<h3 class="join_title">
						<label for="profileNo">자기소개 (선택 입력)</label>
					</h3>
					<span class="box int_mobile"> <input name="profile"
						type="profile" id="pf" class="int" maxlength="16"
						placeholder="선택 입력">
					</span> 
				</div>

				<!-- photo  -->
				<h3 class="join_title">
				<label for="profileNo">사진 선택 (선택 입력)</label>
				</h3>
			     <div class="image-container">
                        <img style="width: 200px;height: 200px;" id="preview-image" >
                        <input name="file" style="display: block;" type="file" id="input-image">
                    </div>
                    <script>
                        function readImage(input) {
                        if(input.files && input.files[0]) {
                            const reader = new FileReader()
                            reader.onload = e => {
                                const previewImage = document.getElementById("preview-image")
                                previewImage.src = e.target.result
                            }
                            reader.readAsDataURL(input.files[0])
                            }
                            }
                            const inputImage = document.getElementById("input-image")
                            inputImage.addEventListener("change", e => {
                                readImage(e.target)
                            })
                    </script>


				<!-- JOIN BTN-->
				<div class="btn_area">
					<input type="submit" button type="button" id="btnJoin" value="회원가입">


				</div>

			</form>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
<script type="text/javascript">
	$('#input_nick').focusout(function () {
		
		var nick = $('#input_nick').val();
		
		$.ajax({
			url : "NickCheckService",
			type : "post",
			data : {nick : nick},
			dataType : 'json',
			
			success : function (result) {
				if(result == 0){
					$("#checkNick").html('사용할 수 없는 닉네임입니다.');
					$("#checkNick").attr('color', 'red');
				}else{
					$("#checkNick").html('사용할 수 있는 닉네임입니다.');
					$("#checkNick").attr('color', 'green');
				}
			},
			error : function () {
				alert("서버 요청 실패");
			}
		})
	})
	$('#input_id').focusout(function () {
		
		var id = $('#input_id').val();
		
		$.ajax({
			url : "IdCheckService",
			type : "post",
			data : {id : id},
			dataType : 'json',
			
			success : function (result) {
				if(result == 0){
					$("#checkId").html('사용할 수 없는 닉네임입니다.');
					$("#checkId").attr('color', 'red');
				}else{
					$("#checkId").html('사용할 수 있는 닉네임입니다.');
					$("#checkId").attr('color', 'green');
				}
			},
			error : function () {
				alert("서버 요청 실패");
			}
		})
	})
	
</script>



</body>
</html>