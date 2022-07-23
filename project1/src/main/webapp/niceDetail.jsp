<%@page import="Model.history_CP_niceDTO"%>
<%@page import="Model.history_SP_niceDAO"%>
<%@page import="Model.LoginDTO"%>
<%@page import="Model.history_SP_niceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>같이해조 || 파티관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="HistoyParty/css/style.css">
</head>
<style>
.logo {
    display: inline-block;
    width: 150px;
    height: 50px;
    background: url(image/Testimg/welogo.png) no-repeat;
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
	.h_cont {display: flex; justify-content: space-around; padding-left: 150px; padding-top:0;}
	.h_random {margin: 25
	.h_random li {displapx 0;}y: inline-block; margin: 20px 0 0 20px; }
	.h_random li a {font-size: 24px; color: black; font-weight: 500; transition: 0.2s;}
	.h_random li a:hover {color: #5865F2;}
</style>
<body>
<% 
System.out.println("파티기록 만든파티 상세조회 페이지입니다.");
ArrayList<history_SP_niceDTO> list = (ArrayList<history_SP_niceDTO>)request.getAttribute("cp_list");
LoginDTO user = (LoginDTO)session.getAttribute("user");
String user_id = user.getId();
String user_nick = user.getNick();
history_SP_niceDAO dao = new history_SP_niceDAO();

%>
<header id="header">
            <div class="h_cont">
                <ul style = list-style:none; class="h_random">
                    <li><a href="view.jsp" class="logo"></a></li>
                </ul>
                <ul class="h_menubar">
                    <li><a href="CreatePartys.jsp">파티 만들기</a></li>
                    <li><a href="SearchPartys.jsp">파티 찾기</a></li>
                    <li><a href="HistoyParty/index.jsp">파티 관리</a></li>
                    <li><a href="Main.jsp">마이페이지</a></li>
                </ul>
                <ul class="h_menu">
                    <li><%=user_nick%>님 안녕하세요</li>
                    <li><a href="LogoutService">logout</a></li>
                </ul>
            </div>
    </header>
    <section class="ftco-section">
		<div class="container">
	    <div class="row">
					<div class="col-md-12">
						<div class="table-wrap">
							<table class="table table-striped">
							  <thead>
							    <tr>
							      <th>파티번호</th>
							      <th>파티제목</th>
							      <th>유저 아이디</th>
							      <th>참가 신청일</th>
							      <th>모집마감일</th>
							      <th>상태</th>
							      <th></th>
							    </tr>
							  </thead>
							  <tbody>
							  <%for(int i = 0; i < list.size(); i++){
								  history_CP_niceDTO list2 = dao.re_cp_select(list.get(i).getParty_seq()); // 신청한 파티에서 뽑아온 파티시퀀스를 통해 파티시퀀스에 맞는 파티들의 정보를 가지고 오는 DAO
								  String YN = "";
							  if(list.get(i).getAttendance_yn().equals("Y")){
							  	 YN = "수락";
							  }else if(list.get(i).getAttendance_yn().equals("N")){
							  	 YN = "거절";
							  }else{YN = "대기";}%>
							    <tr>
							      <th scope="row"><%= list.get(i).getParty_seq() %></th>
							      <td><%= list2.getParty_title() %></td>
							      <td><%= list.get(i).getUser_id() %></td>
							      <td><%= list.get(i).getReg_date() %></td>
							      <td><%= list2.getParty_end_date() %></td>
							      <td><%= YN %></td>
							      <td>
								  	<button class = 'btn btn-info' id = "ok<%=i%>">수 락</button>	
								  	<button class = 'btn btn-warning' id = "no<%=i%>">거 절</button>
								  </td>
							    </tr>
							    <%}%>
							  </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
<script>
<% for(int i = 0; i < list.size(); i++) {%>
$(document).on('click', '#ok<%=i%>',function(){
				var party_seq = <%= list.get(i).getParty_seq() %>;
				var user_id = "<%= list.get(i).getUser_id() %>";
				console.log(user_id)
				console.log(party_seq)
				$.ajax({
					url : 'AcceptPartyService',
					type : 'get',
					data : {
						party_seq : party_seq,
						user_id : user_id
						},
					success : function(row){
						if(row > 0){
							alert("수락 성공");
							location.reload();
						}else{
							alert("수락 실패");
						}
					},
					error : function(){
		                alert("error");
					}
					})
				})
<%}%>
<% for(int i = 0; i < list.size(); i++) {%>
$(document).on('click', '#no<%=i%>',function(){
				var party_seq = <%= list.get(i).getParty_seq() %>;
				var user_id = "<%= list.get(i).getUser_id() %>";
				console.log(user_id)
				console.log(party_seq)
				$.ajax({
					url : 'RefusePartyService',
					type : 'get',
					data : {
						party_seq : party_seq,
						user_id : user_id
						},
					success : function(row){
						if(row > 0){
							alert("거절 성공");
							location.reload();
						}else{
							alert("거절 실패");
						}
					},
					error : function(){
		                alert("error");
					}
					})
				})
<%}%>
</script>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>