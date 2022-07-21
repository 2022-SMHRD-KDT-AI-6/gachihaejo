<%@page import="Model.LoginDTO"%>
<%@page import="Model.history_SP_niceDTO"%>
<%@page import="Model.history_CP_niceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.history_CP_niceDAO"%>
<%@page import="Model.history_SP_niceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>같이해조</title>
</head>
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
<style>
.logo {
    display: inline-block;
    width: 150px;
    height: 50px;
    background: url(../image/Testimg/welogo.png) no-repeat;
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
	history_SP_niceDAO sp_dao = new history_SP_niceDAO();
	history_CP_niceDAO dao = new history_CP_niceDAO();
			// 로그인 한 사람이 파티 기록을 누르면 세가지 버튼이 있어야함.
			// 1.만든파티 2.신청한 파티 3.이전 파티기록 
			// 각 버튼 클릭시 해당 테이블 생성
		LoginDTO user = (LoginDTO)session.getAttribute("user");
		String user_id = user.getId();
		String user_nick = user.getNick();

		 	ArrayList<history_CP_niceDTO> list = dao.CP_select(user_id);
		 	ArrayList<history_SP_niceDTO> sp_list = sp_dao.SP_select(user_id);
		 	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<header id="header">
            <div class="h_cont">
                <ul style = list-style:none; class="h_random">
                    <li><a href="../view.jsp" class="logo"></a></li>
                </ul>
                <ul class="h_menubar">
                    <li><a href="../CreatePartys.jsp">파티 만들기</a></li>
                    <li><a href="../SearchPartys.jsp">파티 찾기</a></li>
                    <li><a href="../Main.jsp">마이페이지</a></li>
                </ul>
                <ul class="h_menu">
                    <li><%=user_nick%>님 안녕하세요</li>
                    <li><a href="../LogoutService">logout</a></li>
                </ul>
            </div>
    </header>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">
					<button class = 'btn btn-outline-primary' id="history_CP">만든 파티</button>
					<button class = 'btn btn-outline-primary' id="history_SP">신청한 파티</button>
					<button class = 'btn btn-outline-primary' id="history">이전 파티 기록</button></h2>
				</div>
			</div>
			
			<div id="box"></div>
			
			
			<script>
			$(function() { //펑션 시작
				// 만든파티 버튼 클릭시 목록 생성
				$("#history_CP").on("click", function() {
					var base = "";
					
					$("#box").empty();
					base += "<div class='row'>";
					base += "<div class='col-md-12'>";
					base += "<div class='table-wrap'>";
					base += "<table class='table table-striped' id = 'CP_party'>";
					base += "<thead>";
					base += "<tr>"; 
					base += "<th>제목</th>";		      
					base += "<th>주소</th>";
					base += "<th>인원</th>";
					base += "<th>날짜</th>";
					base += "<th></th>";
					base += "</tr>";
					base += "</thead>";
					base += "<tbody>";
					
					<% for(int i = 0; i < list.size(); i++){%>
						base += "<tr>";
						base += "<th scope='row'> <a href = 'HistoryParty_cp_list?party_seq=<%=list.get(i).getParty_seq()%>'> <%= list.get(i).getParty_title()%> </a></th>";
						base += "<td> <%= list.get(i).getParty_addr() %> </td>";
						base += "<td> <%= list.get(i).getParty_max_cnt() %> </td>";
						base += "<td> <%= list.get(i).getParty_end_date() %> </td>";
						base += "<td><button class = 'btn btn-outline-primary' id = 'delete_<%=i%>'>취 소</button></td>";
					<%}%>
					
					base += "</tbody>"; 
					base += "</table>";
					base += "</div>";
					base += "</div>";
					base += "</div>";
					$("#box").append(base);
				})
				
			// 신청한 파티 클릭시 목록 생성
			$("#history_SP").on("click", function() {
				var base = "";
				
				$("#box").empty();
				base += "<div class='row'>";
				base += "<div class='col-md-12'>";
				base += "<div class='table-wrap'>";
				base += "<table class='table table-striped' id = 'CP_party'>";
				base += "<thead>";
				base += "<tr>"; 
				base += "<th>파티번호</th>";		      
				base += "<th>제목</th>";
				base += "<th>신청날짜</th>";
				base += "<th>참가여부</th>";
				base += "<th>참가여부</th>";
				base += "</tr>";
				base += "</thead>";
				base += "<tbody>";
				
				<% for(int i = 0; i < sp_list.size(); i++){%>
					<% 
					int party_seq = sp_list.get(i).getParty_seq();
					String title = sp_dao.title_select(party_seq);
					%>
					base += "<tr>";
					base += "<th scope='row'><a href = 'HistoryParty_cp_list?party_seq=<%=list.get(i).getParty_seq()%>'> <%= list.get(i).getParty_title() %> </a></th>";
					base += "<td> <%= list.get(i).getParty_addr() %> </td>";
					base += "<td> <%= list.get(i).getParty_max_cnt() %> </td>";
					base += "<td> <%= list.get(i).getParty_end_date() %> </td>";
					base += "<td><button class = 'btn btn-outline-primary' id = 'delete_<%=i%>'>취 소</button></td>";
					base += "</tr>";
						
				<%}%>
				
				base += "</tbody>" 
				base += "</table>";
				base += "</div>";
				base += "</div>";
				base += "</div>";
				$("#box").append(base);
			})
				
		}) //펑션 끝
		<% for(int i = 0; i < list.size(); i++) {%>
		$(document).on('click', '#delete_<%=i%>',function(){
						var party_seq = <%= list.get(i).getParty_seq() %>;
						
						$.ajax({
							url : '../Histoy_cp_delete',
							type : 'get',
							data : {party_seq : party_seq},
							success : function(result){
								alert("파티삭제 완료");
								location.reload();
							},
							error : function(){
				                alert("파티삭제 실패");
							}
							})
						})
		<%}%>
		
		<% for(int i = 0; i < sp_list.size(); i++) {%>
		$(document).on('click', '#party_cancel_<%=i%>',function(){
						var party_seq = <%= sp_list.get(i).getParty_seq() %>;
						
						$.ajax({
							url : '../RequestCancelService',
							type : 'get',
							data : {party_seq : party_seq},
							success : function(row){
								location.reload();
								if(row > 0){
									alert("파티삭제 완료");
								}else{
									alert("파티삭제 실패");
								}
							},
							error : function(){
				                alert("오류");
							}
							})
						})
		<%}%>
				</script>
			</div>
		</section>
			
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
	</body>
</html>