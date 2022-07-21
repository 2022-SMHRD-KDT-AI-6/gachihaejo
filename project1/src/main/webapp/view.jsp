<%@page import="Model.LoginDTO"%>
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
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
 <link rel='stylesheet' href='assets/css/modaldemo.css'>
<link rel='stylesheet' href='assets/css/modalstyle.css'> 

 <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
 
 <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script> 

</head>


	
<body>

<%
	ArrayList<MainDTO> list = (ArrayList<MainDTO>)request.getAttribute("list");
	
	MainDAO dao = new MainDAO();
	if(list == null)
	{
		list = dao.selectAll();
	}
	
%> 
    <header class="header">
        <div class="header-inner">
            <div class="gnb-wrap">
                <a href="" class="logo"></a>
                <div class="search-sticky">
                    <!-- DB 검색하기 (미완성)-->
                    <div class="search-sticky-btn">
                       <div class="search-minimenu" onclick="location.href='CreatePartys.jsp'">
                    <label  for="location">파티 만들기</label>
                    <!-- <input id="location" type="text"> -->
                </div>
                <div  class="search-minimenu" onclick="location.href='SearchPartys.jsp'">
                    <label for="checkin">파티 찾기</label>
                    <!-- <input id="checkin" type="date" > -->
                </div>
               
                <div class="search-minimenu">
                    <label for="checkout">파티 관리</label>
                    <!-- <input id="checkout" type="text"> -->
                </div>
               
                <div class="search-minimenu" onclick="location.href='Main.jsp'">
                    <label for="number">마이페이지</label>
                   <!--  <input id="number" type="text"> -->
                        <!-- <i class="fas fa-search search-sticky-img"></i> -->
                    </div>
                    </div>
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
                <div class="search-menu" onclick="location.href='CreatePartys.jsp'">
                    <label  for="location">파티 만들기</label>
                    <!-- <input id="location" type="text"> -->
                </div>
                <div  class="search-menu" onclick="location.href='SearchPartys.jsp'">
                    <label for="checkin">파티 찾기</label>
                    <!-- <input id="checkin" type="date" > -->
                </div>
                <div class="search-menu">
                    <label for="checkout">파티 관리</label>
                    <!-- <input id="checkout" type="text"> -->
                </div>
                <div class="search-menu" onclick="location.href='Main.jsp'">
                    <label for="number">마이페이지</label>
                   <!--  <input id="number" type="text"> -->
                </div>
                
                
                
                
                
                
                
              <!--   <div class="search-btn">
                    <i class="fas fa-search"></i>
                </div> -->
            </div>
        </div>
    </header>
<main>
<%
	boolean login = false;
	LoginDTO dto = (LoginDTO)session.getAttribute("user");
    if(dto != null && dto.getId() != null){
    	login = true;
    	System.out.println("현재 사용자 = " +dto.getId());
    }
    else{
    	System.out.println("세션에 값 없음");
    }
    
%>
    <section class="main main-img">
    	<%if(login){%>
    		<p class="main-txt"><%=dto.getId()%> 님 환영합니다.<br>혼자 취미생활을 즐기기 힘들때! 저희가 도와드립니다.</p>
    	<%}else{%>
        <p class="main-txt">혼자 취미생활을 즐기기 힘들때! 저희가 도와드립니다.</p>
        <%} %>
        
        <%if(login){%>
         <a onclick="location.href='LogoutService'" class="main-search" data-toggle="modal">
			<span class="main-search-txt">로그아웃</span>
		
        </a>
        <%}else{%>
        <a href="#loginModal" class="main-search" data-toggle="modal">
		
 		<span class="main-search-txt">로그인 / 회원가입</span>
			
        </a>
        <%}%>
    </section>



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













    <section class="spot section">
        <h2 class="sub-title">원하는 지역에서, 찾아보세요</h2>
        
        	
        <a class="spot-item" href = "CityService?city=서울">
                <span class="spot-inner">
                    <img src="image/spot7.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">서울</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
        </a>
                
        
        <a href="#" class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot3.jpg" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">경기</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
        </a>
            
            <a class="spot-item" href = "CityService?city=부산">
                <span class="spot-inner">
                    <img src="image/spot4.png" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">부산</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
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
            <a class="spot-item" href = "CityService?city=광주">
                <span class="spot-inner">
                    <img src="image/spot6.png" class="spot-img" alt="">
                    <span class="spot-txt">
                        <span class="spot-name">광주</span>
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
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
                    
                    <% 
                    	String[] cateList = {"sports", "game", "cooking", "music", "art", "movie", "pet", "health", "craft", "improve", "travle"};
                    	String[] imgName = new String[list.size()];
                    	
                    	for(int j = 0; j < list.size(); j++){
                    		System.out.println("***********************************************");
                    		for(int k = 0; k < cateList.length; k++){
                    			if(list.get(j).getParty_type().equals( cateList[k]) ){
                        			imgName[j] =  cateList[k] + ".png";
                        			break;
                        		}
                    			else{
                    				
                    				System.out.println("리스트 카테고리 이름 = " + list.get(j).getParty_type());
                    				System.out.println("카테리스트 이름 = " + cateList[k]);
                    			}
                    		}
                    	}
                    %>
                    
                    	
                        <div class="mainview-img" ></div>
                            <img src="image/Testimg/<%=imgName[i]%>" class="mainview-img"> 
                            <div class="pro_text">
                        <ul>
                                <li>
                                <%int people = dao.cnt_people(list.get(i).getParty_seq()); %>
                                <%if(people >= list.get(i).getParty_max_cnt()){ %>
                                    <span class="hobby_text_end">마감</span>
                                <%}else{%>
                                	<span class="hobby_text_ing">모집중 <%=people%> / <%= list.get(i).getParty_max_cnt() %></span>                            	
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

                     
            </div>
        </div>
          </div>
        </div>
    </section>
 




        <section class="hobbyteam section">
            <h2 class="sub-title"> <strong>곧 </strong>마감되는 파티! 서두르세요</h2>
               <div class="hotmainview">
            <div class="hotswiper">
              <div class="swiper-wrapper">

	

				<% for(int i =0; i<list.size(); i++){%>
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                    <% 
                    	String[] cateList = {"sports", "game", "cooking", "music", "art", "movie", "pet", "craft", "improve", "travle"};
                    	String[] imgName = new String[list.size()];
                    	
                    	for(int j = 0; j < list.size(); j++){
                    		System.out.println("***********************************************");
                    		for(int k = 0; k < cateList.length; k++){
                    			if(list.get(j).getParty_type().equals( cateList[k]) ){
                        			imgName[j] =  cateList[k] + ".png";
                        			break;
                        		}
                    			else{
                    				
                    				System.out.println("리스트 카테고리 이름 = " + list.get(j).getParty_type());
                    				System.out.println("카테리스트 이름 = " + cateList[k]);
                    			}
                    		}
                    	}
                    %>
                    
                    	
                        <div class="mainview-img" ></div>
                            <img src="image/Testimg/<%=imgName[i]%>" class="mainview-img"> 
                            <div class="pro_text">
                            <ul>
                                <li>
                                <%int people = dao.cnt_people(list.get(i).getParty_seq()); %>
                                
                                <%if(people >= list.get(i).getParty_max_cnt()){ %>
                                
                                    <span class="hobby_text_end">마감</span>
                                
                                <%}else{%>
                                
                              <span class="hobby_text_ing"> 모집중 <%=people%> / <%= list.get(i).getParty_max_cnt() %></span>                            	
                                
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
                <li>전화 : 062-655-3506, 9</li>
                <li>FAX : 062-655-3510</li>
                
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


function goLogin(){
	var form = $('#loginForm');
    
    form.submit();
}
 
$('#loginModal').on('click',()=> {
	  $('#loginModal').modal('show');
	    $(function () {
	      $('[data-toggle="tooltip"]').tooltip()
	    })
	  });










  </script>
</body>
</html>