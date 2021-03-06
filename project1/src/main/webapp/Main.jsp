<%@page import="java.io.PrintWriter"%>
<%@page import="Model.LoginDTO"%>
<%@page import="Model.MemberupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">

body{
     background: #ffffff;
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 50%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 100%;
    padding: 2%;
    font-weight: 600;
    color: #fff;
    background: #5865F2;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}

ul {list-style: none;}
li {list-style: none;}
a {text-decoration: none;}
.h_cont {display: flex; justify-content: space-around; padding-left: 150px; padding-top:0;}
.h_random {margin: 25px 0;}
.h_random li {display: inline-block; margin: 20px 0 0 20px; }
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
.h_menubar li a:hover {color: #FF5B00;}
.h_menu {margin: 25px 0;}
.h_menu li {display: inline-block; margin: 30px 0 0 30px; }
.h_menu li a {font-size: 18px; color: black; font-weight: 500; transition: 0.2s;}
.h_menu li a:hover {color: #000;}
#header {
	text-align: center;
	width: 100%;
	border-bottom:1.5px solid #ECF0EE;
}

.col-md-2{
	width:300px;
        margin:auto;
}

.col-md-6{
	padding-bottom:15px;
}

input{
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}

.profile-img>div{
	line-height:0.6
}


</style>



</head>
<body>

<%
	
	LoginDTO dto = (LoginDTO)session.getAttribute("user");
    response.setContentType("text/html; charset=utf-8");
    PrintWriter writer = response.getWriter();
	
	if(dto == null){
		writer.print("<script>alert('????????? ??????????????? ??????????????????');location.href='http://localhost:8081/project1/view.jsp'</script>");
		writer.close();
	}
	
	
%>

<%if(dto !=null){ %>
<header id="header">
            <div class="h_cont">
                <ul class="h_random">
                    <li><a href="view.jsp" class="logo"></a></li>
                    <!--  li><a href="#">????????????</a></nav>-->
                </ul>
                <ul class="h_menubar">
                    <li><a href="CreatePartys.jsp">?????? ?????????</a></li>
                    <li><a href="SearchPartys.jsp">?????? ??????</a></li>
                    <li><a href="HistoyParty/index.jsp">?????? ??????</a></li>
                    <li><a href="Main.jsp">?????? ?????????</a></li>
                    <!-- li><a href="#">About us</a></li-->
                </ul>
                <ul class="h_menu">
                   <!-- <li><a href="login.jsp">login</a></li> --> 
                    <li><%= dto.getNick() %>??? ???????????????</li>
                    <li><a href="#">logout</a></li>
                </ul>
            </div>
        </header>
<!-- ???????????? -->

<c:set var="content" scope="session" value="<%= dto.getProfile()%>"/>
<div class="container emp-profile">
            <form method="post" action="MyPageServlet" enctype="multipart/form-data">
                <div class="row" >
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="image/<%= dto.getPhoto() %>"  id="preview-image" onerror="this.src='https://mblogthumb-phinf.pstatic.net/20150403_86/e2voo_14280514283502gas9_JPEG/kakako-00.jpg?type=w2';">
                            <div class="file btn btn-lg btn-primary">
                                ?????? ?????????
                                <input type="file" name = "file" id="input-image">
                                <input type="text" name="file2" style="display: none;" value="<%= dto.getPhoto() %>" id="input-image2">
                            </div>
                            <div class="file btn btn-lg btn-primary">
                            <span onclick="test()">??????</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" >
                        <div class="profile-head">
                                    <h5>
                                        <%= dto.getName() %>
                                    </h5>
                                    <h6>
                                        <%= dto.getNick() %>
                                    </h6>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">?????????</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>?????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getId() %> name = "id"  readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>????????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "password" value= <%= dto.getPw() %> name = "pw">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>??????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getName() %> name = "name" readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>?????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getNick() %> name = "nick" class = "input_nick"><br>
                                                <font id = "checkNick" size = "2"></font>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>?????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getEmail() %> name = "email">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>?????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getPhone() %> name = "phone">
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>????????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getBirth() %> name = "birth" readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>??????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type = "text" value= <%= dto.getGender() %> name = "gender" readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>????????????</label>
                                            </div>
                                            <div class="col-md-6">
                                                <textarea rows="3" cols="41" name = "profile"><c:out value="${content}"/></textarea>
                                                
                                            </div>
                                        </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                <br><br>
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="????????? ??????"/>
        </div>
            </form>           
        </div>
        <%} %>
        
</body>
</html>

<script type="text/javascript">

	$('.input_nick').focusout(function () {
		
		var nick = $('.input_nick').val();
		
		$.ajax({
			url : "NickCheckService",
			type : "post",
			data : {nick : nick},
			dataType : 'json',
			
			success : function (result) {
				if(result == 0){
					$("#checkNick").html('????????? ??? ?????? ??????????????????.');
					$("#checkNick").attr('color', 'red');
				}else{
					$("#checkNick").html('????????? ??? ?????? ??????????????????.');
					$("#checkNick").attr('color', 'green');
				}
			},
			error : function () {
				alert("?????? ?????? ??????");
			}
		})
	})

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
                            
	function test() {
		// $("#preview-image").attr("src","url(image/???????????????.jpg)");
		
		const img = document.getElementById("preview-image");
		img.setAttribute('src','image/???????????????.jpg');
		
		let img2 = document.getElementById("input-image2");
		img2.value="???????????????.jpg";
		
	
	}
</script>