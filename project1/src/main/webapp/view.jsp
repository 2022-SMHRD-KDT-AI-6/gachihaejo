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
                    <!-- DB ???????????? (?????????)-->
                    <div class="search-sticky-btn">
                       <div class="search-minimenu" onclick="location.href='CreatePartys.jsp'">
                    <label  for="location">?????? ?????????</label>
                    <!-- <input id="location" type="text"> -->
                </div>
                <div  class="search-minimenu" onclick="location.href='SearchPartys.jsp'">
                    <label for="checkin">?????? ??????</label>
                    <!-- <input id="checkin" type="date" > -->
                </div>
               
                <div class="search-minimenu" onclick="location.href='HistoyParty/index.jsp'">
                    <label for="checkout" >?????? ??????</label>
                    <!-- <input id="checkout" type="text"> -->
                </div>
               
                <div class="search-minimenu" onclick="location.href='Main.jsp'">
                    <label for="number">???????????????</label>
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
                        <img src="image/dark-mode.png" class="dark-mode" id="icon" alt="????????????">
                    </li>
                </ul>
            </div>
            <div class="search-bar">
                <div class="search-menu" onclick="location.href='CreatePartys.jsp'">
                    <label  for="location">?????? ?????????</label>
                    <!-- <input id="location" type="text"> -->
                </div>
                <div  class="search-menu" onclick="location.href='SearchPartys.jsp'">
                    <label for="checkin">?????? ??????</label>
                    <!-- <input id="checkin" type="date" > -->
                </div>
                <div class="search-menu" onclick="location.href='HistoyParty/index.jsp'">
                    <label for="checkout">?????? ??????</label>
                    <!-- <input id="checkout" type="text"> -->
                </div>
                <div class="search-menu" onclick="location.href='Main.jsp'">
                    <label for="number">???????????????</label>
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
    	System.out.println("?????? ????????? = " +dto.getId());
    }
    else{
    	System.out.println("????????? ??? ??????");
    }
    
%>
    <section class="main main-img">
    	<%if(login){%>
    		<p class="main-txt"><%=dto.getNick()%> ??? ???????????????.<br>?????? ??????????????? ????????? ?????????! ????????? ??????????????????.</p>
    	<%}else{%>
        <p class="main-txt">?????? ??????????????? ????????? ?????????! ????????? ??????????????????.</p>
        <%} %>
        
        <%if(login){%>
         <a onclick="location.href='LogoutService'" class="main-search" data-toggle="modal">
			<span class="main-search-txt">????????????</span>
		
        </a>
        <%}else{%>
        <a href="#loginModal" class="main-search" data-toggle="modal">
		
 		<span class="main-search-txt">????????? / ????????????</span>
			
        </a>
        <%}%>
    </section>



<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">??</span>
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
              <input name="id" type="id" class="form-control" id="id"placeholder="?????????">
            </div>
            <div class="form-group">
              <input name="pw" type="password" class="form-control" id="password1" placeholder="????????????">
            </div>
           <!--   <button type="button" class="btn btn-info btn-block btn-round">?????????</button> -->
            <!--  a href="#" class="btn btn-default btn-block m-t-md"> ????????? </a>-->
            <div class="btn btn-default btn-block m-t-md">
             <a href="javascript:goLogin()" class="newbtn btn-default btn-block m-t-md">?????????</a> <br><br>
             
            <a href="join.jsp" class="newbtn btn-default btn-block m-t-md"> ????????????</a>
            </div>
          </form>

      </div>
    </div>
	</div>
  </div>
</div>













    <section class="spot section">
        <h2 class="sub-title">????????? ????????????, ???????????????</h2>
        
        	
        <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot7.jpg" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
                
        </a>
                
        
        <a href="#" class="spot-item">
                <span class="spot-inner">
                    <img src="image/spot3.jpg" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
        </a>
            
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot4.png" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot8.png" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                                        <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot5.jpg" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot6.png" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot.jpg" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
            <a class="spot-item" href = "CityService?city=??????">
                <span class="spot-inner">
                    <img src="image/spot2.png" class="spot-img" alt="">
                        <span class="spot-name">??????</span>
                    <span class="spot-txt">
                        <span class="spot-distance"></span>
                    </span>
                </span>
            </a>
        </section>





    <section>
        <div class="hobbyteam section">
            <h2 class="sub-title">?????? ???????????? ??????!
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
                    	String[] cateList = {"sports", "game", "cooking", "music", "art", "movie", "pet", "health", "craft", "improve", "travel"};
                    	String[] imgName = new String[list.size()];
                    	for(int j = 0; j < list.size(); j++){
                    		if(list.get(j).getParty_type().equals("travel")){
                    		}
                    		for(int k = 0; k < cateList.length; k++){
                    			if(list.get(j).getParty_type().equals( cateList[k]) ){
                    				if(list.get(j).getParty_type().equals("travel")){
                    				}
                        			imgName[j] =  cateList[k] + ".png";
                        			break;
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
                                    <span class="hobby_text_end">??????</span>
                                <%}else{%>
                                	<span class="hobby_text_ing">????????? <%=people%> / <%= list.get(i).getParty_max_cnt() %></span>                            	
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
            <h2 class="sub-title"> <strong>??? </strong>???????????? ??????! ???????????????</h2>
               <div class="hotmainview">
            <div class="hotswiper">
              <div class="swiper-wrapper">

	

				<% for(int i =0; i<list.size(); i++){%>
                <div class="swiper-slide">
                    <div id="PartyRecruitList">
                    <div class="hobby-item">
                    
                    <% 
                    	String[] cateList = {"sports", "game", "cooking", "music", "art", "movie", "pet", "craft", "improve", "travel"};
                    	String[] imgName = new String[list.size()];
                    	
                    	for(int j = 0; j < list.size(); j++){
                    		
                    		for(int k = 0; k < cateList.length; k++){
                    			if(list.get(j).getParty_type().equals( cateList[k]) ){
                        			imgName[j] =  cateList[k] + ".png";
                        			break;
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
                                
                                    <span class="hobby_text_end">??????</span>
                                
                                <%}else{%>
                                
                              <span class="hobby_text_ing"> ????????? <%=people%> / <%= list.get(i).getParty_max_cnt() %></span>                            	
                                
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
                <li><a href="#">???</a></li>
                <li><a href="#">?????????</a></li>
                <li><a href="#"><Strong>????????????????????????</Strong></a></li>
                <li><a href="#">????????????</a></li>
            </ul>

            <ul>
                <li><a>MADE PROJECT BY</a></li>
                <li><strong>&nbsp;&nbsp;??? ???&nbsp;</strong></li>
                <li>&nbsp;&nbsp;?????????&nbsp;</li>
                <li>&nbsp;&nbsp;?????????&nbsp;</li>
                <li>&nbsp;&nbsp;?????????&nbsp;</li>
                <li>&nbsp;&nbsp;?????????&nbsp;</li>
            </ul>
        </div>
        <div class="adress">
            <ul>
                <li>????????????????????????</li>
                <li>??????????????? ?????? ????????? 373-3</li>
                <li>?????? : 062-655-3506, 9</li>
                <li>FAX : 062-655-3510</li>
                
            </ul>
            <ul>
                <li>E-mail : contact-us@smhrd.com</li>
                <li>
                    <a href="#">?????????????????????</a>
                </li>
            </ul>
        </div>

        <div class="copyright">
            <span>&copy; ???????????? Corporation All Rights Reserved.</span>
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
    

    /* 'a' ?????? ????????? ??????????????? */
$(document).ready(function(){
  $('.spot-name').hover(function(){
    $(this).css('color','black');
  }
  ,function(){
    $(this).css('color','#000');
  }
  );

  $(".spot-item").click(function() {
	
    $(".spot-item").toggleClass({ //???????????? ??? ??? ????????? ?????? ??????
        "color":"red",
        "border":"1px solid gray"
    });	
});
});






new Swiper('.mainview .swiper', {
  // direction: 'horizontal', ?????????????????? ???????????? ????????? ?????????
  slidesPerView: 5, //??? ?????? ????????? ???????????? ??????
  spaceBetween: 80, //???????????? ?????? ??????
  centeredSlides: true, //1??? ??????????????? ????????? ?????????
  loop: true,
  autoplay: {
    delay: 2000
  },
  pagination: {
    el: '.mainview .swiper-pagination', //????????? ?????? ?????? ?????????
    clickable: true //???????????? ????????? ?????? ?????? ??????
  },
  navigation: {
    prevEl: '.prev',
    nextEl: '.next'
  }
});



new Swiper('.hotmainview .hotswiper', {
  // direction: 'horizontal', ?????????????????? ???????????? ????????? ?????????
  slidesPerView: 5, //??? ?????? ????????? ???????????? ??????
  spaceBetween: 80, //???????????? ?????? ??????
  centeredSlides: true, //1??? ??????????????? ????????? ?????????
  loop: true,
  autoplay: {
    delay: 4200
  },
  pagination: {
    el: '.hotmainview .hotswiper-pagination', //????????? ?????? ?????? ?????????
    clickable: true //???????????? ????????? ?????? ?????? ??????
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