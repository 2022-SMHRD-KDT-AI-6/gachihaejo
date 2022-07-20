<%@page import="Model.MainDAO"%>
<%@page import="Model.MainDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>document</title>
    <link rel="stylesheet" href="view.css">
    <link rel="stylesheet" href="/common.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<%
	MainDAO dao = new MainDAO();
	ArrayList<MainDTO> list = dao.select();
	
%> 
    <header class="header">
        <div class="header-inner">
            <div class="gnb-wrap">
                <a href="" class="logo"></a>
                <div class="search-sticky">
                    <!-- DB 검색하기 (미완성)-->
                    <button class="search-sticky-btn" href="#">
                        <span>검색 시작하기</span>
                        <i class="fas fa-search search-sticky-img"></i>
                    </button>
                </div>
                <ul class="my">
                    <li><a href=""></a></li>

                    <li class="profile">
                    
               <!--  <i class="fas fa-bars"></i>                               
                     <i class="far fa-user-circle"></i> -->
                   
                    </li>
                  
                    <li>
                        <img src="image/dark-mode.png" class="dark-mode" id="icon" alt="다크모드">
                    </li>
                </ul>
            </div>
            <div class="search-bar">
                <div class="search-menu">
                    <label for="location">위치</label>
                    <input id="location" type="text" placeholder="어디에서 즐기고싶으세요?">
                </div>
                <div  class="search-menu">
                    <label for="checkin">날짜</label>
                    <input id="checkin" type="date" placeholder="날짜 입력">
                </div>
                <div class="search-menu">
                    <label for="checkout">시간</label>
                    <input id="checkout" type="text" placeholder="시간 입력">
                </div>
                <div class="search-menu">
                    <label for="number">인원</label>
                    <input id="number" type="text" placeholder="사람 입력">
                </div>
                <div class="search-btn">
                    <i class="fas fa-search"></i>
                </div>
            </div>
        </div>
    </header>
<main>
<%
    String LoginId = (String)session.getAttribute("USER_ID");
    boolean login = LoginId == null ? false : true;
%>
    <section class="main main-img">
        <p class="main-txt">혼자 취미생활을 즐기기 힘들때! 저희가 도와드립니다.</p>
        <a href="" class="main-search">
        
			<%if(login){%>
		<span class="main-search-txt">로그아웃</span>
		
			<%session.removeAttribute("USER_ID"); %>
		
			<%}else{%>
 		<span class="main-search-txt">로그인 / 회원가입</span>
			<%}%>
           
        </a>
    </section>

    <section class="spot section">
        <h2 class="sub-title">원하는 지역에서, 찾아보세요</h2>
        
        <div class="spot-item" onclick="changmenu()">
                <span class="spot-inner">
                    <img src="image/spot7.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">서울</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
        </div>
        <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot3.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">경기</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
        </div>
            
            <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot4.png" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">부산</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
            <div  class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot8.png" class="spot-img" alt="">
                                        <span class="spot-txt">
                        <span class="spot-name">대구</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
            <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot5.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">인천</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
            <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot6.png" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">광주</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
            <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">울산</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
            <div class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot2.png" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">제주</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </div>
        </section>





    <section>
        <div class="hobbyteam section">
            <h2 class="sub-title">지금 모집중인 파티!
            <button class="prev"><</button>
            <button class="next">></button>
        </h2>



            <div class="mainview">
            <div class="swiper">
              <div class="swiper-wrapper">



				<% for(int i =0; i<list.size(); i++){%>
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                        <ul>
                                <li>
                                <%if(list.get(i).getParty_max_cnt()>=15){ %>
                                    <span class="hobby_text_end">마감</span>
                                   <%}else if(list.get(i).getParty_max_cnt()>=12){ %>
                                    <span class="hobby_text_end">마감임박!</span>
                                    <%}else{  %>
                                      <span class="hobby_text_ing">모집중</span>                            	
                                    <%}%>
                                </li>
                            <li>
                            <span class="sub-txt"> <%=list.get(i).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(i).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                <%} %>

               <%--  <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                   <%if(list.get(1).getParty_max_cnt()>=15){  %>
                                    <span class="hobby_text_end">마감</span>
                                   <%}else if(list.get(1).getParty_max_cnt()>=12){ %>
                                    <span class="hobby_text_end">마감임박!</span>
                                    <%}else{  %>
                                      <span class="hobby_text_ing">모집중</span>                            	
                                    <%}%>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(1).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(1).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/aat.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_end">마감임박!</span>
                                </li>
                            <ul>
                            <li>
                            <span class="sub-txt">3파티제목: 파티제목을 엄청 길게쓰면 어떻게 될까요???</span>
                            </li>
                            <li>
                            <span class="sub-area">위치: 위치도 만약에 엄청나게 길면 어떻게 될까요~~?길게길게길게더길게</span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/좋아.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                                <li>
                            <span class="sub-txt"><%=list.get(2).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(2).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/바넬.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                                <li>
                            <span class="sub-txt"><%=list.get(3).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(3).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
               
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(4).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(4).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(5).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(5).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" ></a>
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(6).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(6).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(7).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(7).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div> --%>
              
            
            </div>
        </div>
          </div>
        </div>
    </section>
 




        <section class="hobbyteam section">
            <h2 class="sub-title">이번주의 가장 <strong>인기있는</strong> 파티!</h2>
               <div class="hotmainview">
            <div class="hotswiper">
              <div class="swiper-wrapper">

	
				<% for(int i =0; i<list.size(); i++){%>
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                        <ul>
                                <li>
                                <%if(list.get(i).getParty_max_cnt()>=15){ %>
                                    <span class="hobby_text_end">마감</span>
                                   <%}else if(list.get(i).getParty_max_cnt()>=12){ %>
                                    <span class="hobby_text_end">마감임박!</span>
                                    <%}else{  %>
                                      <span class="hobby_text_ing">모집중</span>                            	
                                    <%}%>
                                </li>
                            <li>
                            <span class="sub-txt"> <%=list.get(i).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(i).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                <%} %>
<%-- 
		
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                        <ul>
                                <li>
                                    <span class="hobby_text_end">마감임박!</span>
                                </li>
                            <li>
                            <span class="sub-txt"><%=list.get(8).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(8).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_end">마감임박!</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(9).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(9).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/aat.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_end">마감임박!</span>
                                </li>
                            <ul>
                            <li>
                            <span class="sub-txt">3파티제목: 파티제목을 엄청 길게쓰면 어떻게 될까요???</span>
                            </li>
                            <li>
                            <span class="sub-area">위치: 위치도 만약에 엄청나게 길면 어떻게 될까요~~?길게길게길게더길게</span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/좋아.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                                <li>
                            <span class="sub-txt"><%=list.get(10).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(10).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/바넬.jpg" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                                <li>
                            <span class="sub-txt"><%=list.get(0).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(0).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
               
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(0).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(0).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(0).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(0).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/be_happy.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(0).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(0).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
                
                
                
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                        <a href="#" class="mainview-img" >
                            <img src="image/Testimg/base.png" class="mainview-img"> 
                            <div class="pro_text">
                                <li>
                                    <span class="hobby_text_ing">모집중</span>
                                </li>
                                <ul>
                            <li>
                            <span class="sub-txt"><%=list.get(0).getParty_title()%></span>
                            </li>
                            <li>
                            <span class="sub-area"><%=list.get(0).getParty_addr()%></span>
                            </li>
                            
                        </ul>
                        </div>  
                 
                    </div>
                    </div>
                </div>
               --%>
            
            </div>
        </div>
          </div>
        </div>
     </section>  
        
</main>




    <footer id="footer">
        <div class="use_terms">
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">팀소개</a></li>
                <li><a href="#"><Strong>개인정보처리방침</Strong></a></li>
                <li><a href="#">채용안내</a></li>
            </ul>

            <ul>
                <li><a>MADE PROJECT BY</a></li>
                <li><strong>&nbsp;&nbsp;정 민&nbsp;</strong></li>
                <li>&nbsp;&nbsp;최혜리&nbsp;</li>
                <li>&nbsp;&nbsp;김은영&nbsp;</li>
                <li>&nbsp;&nbsp;박건우&nbsp;</li>
                <li>&nbsp;&nbsp;최석재&nbsp;</li>
            </ul>
        </div>
        <div class="adress">
            <ul>
                <li>스마트인재개발원</li>
                <li>광주광역시 남구 송하동 373-3</li>
                <li>전화 : 062-000-0000</li>
                <li>FAX : 0502-000-0000</li>
                
            </ul>
            <ul>
                <li>E-mail : contact-us@smhrd.com</li>
                <li>
                    <a href="#">사업자정보확인</a>
                </li>
            </ul>
        </div>

        <div class="copyright">
            <span>&copy; 같이해조 Corporation All Rights Reserved.</span>
        </div>

        <div class="mini_logo_box">
            <div class="mini_logo"></div>
        </div>

    </footer>




<script>
    document.getElementById("icon").onclick = function () {
        document.body.classList.toggle("dark-theme");
            if(document.body.classList.contains("dark-theme")) {
                icon.src = "image/day-mode.png"
            }else{
                icon.src = "image/dark-mode.png"
            }
        };

       

    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 110) {
            $(".header").addClass("sticky");
        } else {
            $(".header").removeClass("sticky");
        }
    });
    

    /* 'a' 태그 클릭시 검은색으로 */
$(document).ready(function(){
  $('.spot-name').hover(function(){
    $(this).css('color','black');
  }
  ,function(){
    $(this).css('color','#000');
  }
  );

  $(".spot-item").click(function() {
	
    $(".spot-item").toggleClass({ //이렇게도 쓸 수 있으며 제일 낫다
        "color":"red",
        "border":"1px solid gray"
    });	
});
});






new Swiper('.mainview .swiper', {
  // direction: 'horizontal', 기본값이므로 명시하지 않아도 괜찮음
  slidesPerView: 5, //한 번에 보여줄 슬라이드 개수
  spaceBetween: 80, //슬라이드 사이 여백
  centeredSlides: true, //1번 슬라이드가 가운데 보이기
  loop: true,
  autoplay: {
    delay: 2000
  },
  pagination: {
    el: '.mainview .swiper-pagination', //페이지 번호 요소 선택자
    clickable: true //사용자의 페이지 번호 요소 제어
  },
  navigation: {
    prevEl: '.prev',
    nextEl: '.next'
  }
});



new Swiper('.hotmainview .hotswiper', {
  // direction: 'horizontal', 기본값이므로 명시하지 않아도 괜찮음
  slidesPerView: 5, //한 번에 보여줄 슬라이드 개수
  spaceBetween: 80, //슬라이드 사이 여백
  centeredSlides: true, //1번 슬라이드가 가운데 보이기
  loop: true,
  autoplay: {
    delay: 4200
  },
  pagination: {
    el: '.hotmainview .hotswiper-pagination', //페이지 번호 요소 선택자
    clickable: true //사용자의 페이지 번호 요소 제어
  },
  navigation: {
    prevEl: '.hotprev',
    nextEl: '.hotnext'
  }
});




  </script>
</body>
</html>