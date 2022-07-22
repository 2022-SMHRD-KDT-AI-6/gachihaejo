<%@page import="Model.LoginDTO"%>
<%@page import="java.util.Scanner"%>
<%@page import="Model.SearchPartyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.SearchPartyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String cpath = request.getContextPath();
// 파티찾기 페이지입니다.
LoginDTO user = (LoginDTO)session.getAttribute("user");
String user_id = user.getId();
String user_nick = user.getNick();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>같이해조 || 파티 참석</title>
<link rel="stylesheet" href="<%=cpath%>/SearchParty/SearchParty.css">
<link rel="stylesheet" href="<%=cpath %>/CreateParty/CreateParty.css" rel="stylesheet">
<!-- 시군구 select -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=cpath%>/SearchParty/SearchRegion.js"></script>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="CreateParty/css/style.css" />
<title>Stays in Fethiye</title>
<style>
.input2 input[type="text"] {
	width: 250px;
	height: 48px;
	border: 1px solid #dddddd;
	border-radius: 40px;
	-webkit-box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.1);
	padding: 0px 40px;
	font-weight: 600;
	font-size: 14px;
}

a.menu{
			width: auto;
		}

.stays {
	margin-top: 0%;
}

ul {
	list-style: none;
	z-index:1;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

.h_cont {
	display: flex;
	justify-content: space-around;
	padding-left: 150px;
	padding-top: 0;
	border-bottom: black solid 1.5px;
	z-index:2;
}

.h_random {
	margin: 25px 0;
}

.h_random li {
	display: inline-block;
	margin: 20px 0 0 20px;
}

.h_random li a {
	font-size: 18px;
	color: black;
	font-weight: 500;
	transition: 0.2s;
}

.h_random li a:hover {
	color: #5865F2;
}

.logo {
	display: inline-block;
	width: 150px;
	height: 50px;
	background: url(./image/Testimg/welogo.png) no-repeat;
	background-size: contain;
}

.h_menubar {
	margin: 25px 0;
}

.h_menubar li {
	display: inline-block;
	margin: 20px 0 0 20px;
}

.h_menubar li a {
	font-size: 24px;
	color: black;
	font-weight: 500;
	transition: 0.2s;
}

.h_menubar li a:hover {
	color: #FF5B00;
}

.h_menu {
	margin: 25px 0;
}

.h_menu li {
	display: inline-block;
	margin: 30px 0 0 30px;
}

.h_menu li a {
	font-size: 18px;
	color: black;
	font-weight: 500;
	transition: 0.2s;
}

.h_menu li a:hover {
	color: #5865F2;
}

.h_cont {
	display: flex;
	justify-content: space-around;
	padding-left: 150px;
	padding-top: 0;
	border-bottom: black solid 1.5px
}

#header {
 position: fixed;
  left: 0;
  right: 0;
	text-align: center;
	width: 100%;
	border-bottom: 1.5px solid #ECF0EE;
	
}
</style>
<%
ArrayList<SearchPartyDTO> list = (ArrayList<SearchPartyDTO>) request.getAttribute("list");
SearchPartyDAO dao = new SearchPartyDAO();
%>
</head>

<body>
	<input type="hidden" id="party_seq" name="party_seq">
	<input type="hidden" id="user_id" name="user_id" value=<%=user_id %>>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9343c1068f34ec9bc4c98062686ea903&libraries=services"></script>
	<header id="header" style = "z-index:10000;">
		<div class="h_cont" style = "background-color : white">
			<ul class="h_random">
				<li><a href="view.jsp" class="logo"></a></li>
			</ul>
			<ul class="h_menubar">
				<li><a href="./CreatePartys.jsp" class="menu">파티 만들기</a></li>
				<li><a href="./SearchPartys.jsp" class="menu">파티 찾기</a></li>
				<li><a href="HistoyParty/index.jsp" class="menu">파티 관리</a></li>
				<li><a href="Main.jsp" class="menu">마이페이지</a></li>
			</ul>
			<ul class="h_menu">
				<li><%= user_nick %>님 안녕하세요</li>
				<li><a href="LogoutService">logout</a></li>
			</ul>
		</div>
	</header>
	<div class="menu_mobile">
		<div class="container">
			<div class="menu_mobile_left">
				<a href="index.html"> <svg viewBox="0 0 16 16"
						role="presentation" aria-hidden="true" focusable="false"
						style="height: 1em; width: 1em; display: block; fill: currentcolor;">
                        <path
							d="m10.8 16c-.4 0-.7-.1-.9-.4l-6.8-6.7c-.5-.5-.5-1.3 0-1.8l6.8-6.7c.5-.5 1.2-.5 1.7 0s .5 1.2 0 1.7l-5.8 5.9 5.8 5.9c.5.5.5 1.2 0 1.7-.2.3-.5.4-.8.4">
                        </path>
                    </svg> <span class="back_page">Map area</span>
				</a>
			</div>
			<div class="menu_mobile_right">
				<span>Add dates</span>
				<div class="seperator"></div>
				<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"
					aria-hidden="true" role="presentation" focusable="false"
					style="display: block; height: 16px; width: 16px; fill: rgb(34, 34, 34);">
                    <path
						d="M5 8c1.306 0 2.418.835 2.83 2H14v2H7.829A3.001 3.001 0 1 1 5 8zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm6-8a3 3 0 1 1-2.829 4H2V4h6.17A3.001 3.001 0 0 1 11 2zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z">
                    </path>
                </svg>
			</div>
		</div>
	</div>

	<div class="stays">
		<div class="container">
			<div class="left" style="margin-top: 100px; height: 500px">
				<div class="stays_header">
					<span class="sub_heading"> 함께하고 싶은 파티를 찾아 보아요 </span>
					
							<div style="float: left;">
								<h2 class="heading">파티 찾기</h2>
							</div>
							<div>
						<form action="SearchPartyService">
							<div class="input2" style="margin-left: 530px;">
								<input type="text" id="keyword" size="15" name="hobby">
								<button type="submit">취미검색</button>
								<select name="addressRegion" id="addressRegion1"></select> <select
									name="addressDo" id="addressDo1"></select> <select
									name="addressSiGunGu" id="addressSiGunGu1"></select>
							</div>
							
							</form>
							<table>
	              			<tr>
	              			<td colspan = "2">
	              			<div>
	              			<img class = "imgstyle" src="image/<%= user.getPhoto() %>">
	              			</div>
	              			</td>
	              			<td>
	              			<span style = "padding-left: 30px;">
	              		
	              			<strong><%=user_nick%></strong>
	              			</span>
	              			</td>
	              		</table>
					</div>
					
					
					<div class="one_filter">Filters</div>
				</div>
				
				<div class="stays_list">
					<ul id="placesList">

					</ul>
				</div>
				<div></div>
			</div>
			<div class="right" id="map"
				style="width: 1000px; height: 1000px;"></div>
		</div>
	</div>
	<div class="main">
		<div class="bottom_menu">
			<div class="menu_items">
				<div class="menu_item active">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; fill: none; height: 24px; width: 24px; stroke: currentcolor; stroke-width: 4; overflow: visible;">
                        <g fill="none">
                            <path
							d="m13 24c6.0751322 0 11-4.9248678 11-11 0-6.07513225-4.9248678-11-11-11-6.07513225 0-11 4.92486775-11 11 0 6.0751322 4.92486775 11 11 11zm8-3 9 9">
                            </path>
                        </g>
                    </svg>
					<span>Explore</span>
				</div>
				<div class="menu_item">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path
							d="m23.0204313 3.00582063c-2.0815427.07751293-4.0715877.92728952-5.5789504 2.43470494l-1.4414809 1.44047443-1.4404171-1.44031065c-1.5845115-1.58335003-3.6983863-2.44068935-5.8929929-2.44068935-2.19416638 0-4.30898823.85772467-5.89177678 2.44051322-1.58391215 1.58390109-2.44156322 3.69775756-2.44156322 5.89278678 0 4.9282095 2.48419629 8.8512108 8.03256412 13.439053l.70954716.5770638.74171734.584714.77413928.5930892c.131739.0995864.2648394.199552.3993065.2999118l.823244.607011.8562953.6171982.8895983.6281103.9231529.6397472 1.5170817 1.0308345 1.3291121-.9009656 1.0589072-.7287753.6612652-.4625621.7010987-.498181.8533598-.6198244c7.3971739-5.4452801 11.0629604-10.1222564 11.0629604-15.8064246 0-2.19559863-.8569151-4.30921968-2.4404957-5.89278925-1.5843319-1.58317036-3.6982062-2.44051075-5.8928043-2.44051075zm.3128687 1.99417937c1.6695137 0 3.2735403.65055751 4.4788526 1.85498605 1.2043504 1.20434208 1.8544474 2.80783678 1.8544474 4.47831395 0 4.2987547-2.6123854 8.1213061-8.009061 12.474023l-.7197183.570835c-.2451788.1913357-.495635.3837563-.7513829.5773445l-.7831323.5843503-.8149664.5918523-.6943428.4933793-.6495182.4543204-1.2444781.8545952-.3599806-.2464089c-.3060116-.2102151-.6062613-.4182535-.900798-.6242279l-.8665202-.6118437c-.1415799-.1009795-.2817437-.2014711-.4204976-.3014889l-.8156535-.594534c-.1331387-.0981789-.2648797-.1959122-.3952291-.2932139l-.7654464-.5787439-.7323414-.5690616c-5.8464087-4.609638-8.4102832-8.3182024-8.4102832-12.7811772 0-1.66972745.65069601-3.27350087 1.85577431-4.47857075 1.20389067-1.20389067 2.80861035-1.85472925 4.47756569-1.85472925 1.6695226 0 3.2735495.6505567 4.4788626 1.85498605l2.8542663 2.8556887 2.8559829-2.85594303c1.2038387-1.20388075 2.8086117-1.85473172 4.4775982-1.85473172z">
                        </path>
                    </svg>
					<span>Wishlist</span>
				</div>
				<div class="menu_item">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                        <path
							d="m16 1c8.2842712 0 15 6.71572875 15 15 0 8.2842712-6.7157288 15-15 15-8.28427125 0-15-6.7157288-15-15 0-8.28427125 6.71572875-15 15-15zm0 8c-2.7614237 0-5 2.2385763-5 5 0 2.0143973 1.2022141 3.7998876 2.9996346 4.5835001l.0003231 2.0984999-.1499943.0278452c-2.8326474.5613112-5.31897338 2.2230336-6.93575953 4.5872979 2.34343054 2.291067 5.54974273 3.7028569 9.08579613 3.7028569 3.5355506 0 6.7414538-1.4113884 9.0850203-3.701476-1.6141801-2.3628535-4.0978119-4.0247647-6.929184-4.5867938l-.1558786-.0287302.001228-2.0991413c1.7288399-.7547474 2.9066959-2.4357565 2.9936498-4.355479l.0051645-.2283797c0-2.7614237-2.2385763-5-5-5zm0-6c-7.17970175 0-13 5.82029825-13 13 0 2.9045768.95257276 5.5866683 2.56235849 7.7509147 1.42074739-1.9134907 3.33951478-3.4002416 5.53860831-4.2955956l.3480332-.1363191-.0229565-.0189706c-1.43704227-1.2411241-2.34462949-3.045583-2.42083359-5.0285539l-.00520991-.2714755c0-3.8659932 3.1340068-7 7-7s7 3.1340068 7 7c0 1.9941317-.8415062 3.8279876-2.224566 5.1193683l-.225434.2006317.0447787.0163138c2.3268368.8792152 4.3570558 2.4138611 5.8430586 4.4127726 1.6098837-2.1632453 2.5621627-4.8449575 2.5621627-7.7490864 0-7.17970175-5.8202983-13-13-13z">
                        </path>
                    </svg>
					<span>Log in</span>
				</div>
			</div>
		</div>
	</div>


	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.1595454, 126.8526012), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

    //지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    myGPS();
    
  //주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    var bounds = new kakao.maps.LatLngBounds();
    var markers = [];
    var placeList = [];

    	<%if (list != null && list.size() != 0) {%>
    		 var listEl = document.getElementById('placesList'), 
    				    menuEl = document.getElementById('menu_wrap'),
    				    fragment = document.createDocumentFragment(), 
    				    bounds = new kakao.maps.LatLngBounds(), 
    				    listStr = '';
    		
    		<%for (int i = 0; i < list.size(); i++) {%>
    			var i = <%=i%>
    			
    			var places = {
    					
    					
    					
    					party_seq : <%=list.get(i).getParty_seq()%>,
    					party_title : "<%=list.get(i).getParty_title()%>",
    					party_type : "<%=list.get(i).getParty_type()%>",
    					party_content : "<%=list.get(i).getParty_content()%>",
    					party_addr : "<%=list.get(i).getParty_addr()%>",
    					party_max_cnt : "<%=list.get(i).getParty_max_cnt()%>",
    					party_end_date : "<%=list.get(i).getParty_end_date()%>",
    					reg_date : "<%=list.get(i).getReg_date()%>",
    					user_id : "<%=list.get(i).getUser_id()%>",
    					party_latitude : "<%=list.get(i).getParty_latitude()%>",
    					party_longitude : "<%=list.get(i).getParty_longitude()%>",
    					cnt_people : <%=dao.cnt_people(list.get(i).getParty_seq())%>,
    					photo : "<%= dao.photo(list.get(i).getUser_id())%>"
    					<%System.out.println("유저의 사진 = " + dao.photo(list.get(i).getUser_id()) );%>
    			};
    			
    			
    			placeList.push(places);
    			
    			//new kakao.maps.LatLng(places[0], places[1])
    			var placePosition = new kakao.maps.LatLng(places.party_latitude, places.party_longitude),
    			marker1 = addMarker(placePosition, i), 
    			itemEl = getListItem(i, places);
    			
    			(function(marker1, title, placePosition, places) {
    				
    	            kakao.maps.event.addListener(marker1, 'click', function() {
    	                console.log("마커오버");
    	               
    	            });


    	            itemEl.onclick =  function () {
    	            	var moveLatLon = placePosition;
    	            	
    	            	// 지도 중심을 이동 시킵니다
    	            	map.setLevel(5);
    	            	map.panTo(moveLatLon);
    	            	
    	            	var party_seq =  document.getElementById("party_seq");
    	            	
    	            	
    	            	party_seq.value = places.party_seq;
    	
    	            };

    	        })(marker1, places.party_title, placePosition, places);
    			
    			fragment.appendChild(itemEl);
    			bounds.extend(placePosition);
    		<%}%>
    		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    	    listEl.appendChild(fragment);
    	    // menuEl.scrollTop = 0;
    	    
    	 	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    	    map.setBounds(bounds);
    	   
    	<%}%>
    	
    	function myGPS() {
    		if (navigator.geolocation) {
    		    
    		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    		    navigator.geolocation.getCurrentPosition(function(position) {
    		        
    		        var lat = position.coords.latitude, // 위도
    		            lon = position.coords.longitude; // 경도
    		        
    		        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    		        map.setCenter(locPosition);
    		      });
    		    
    		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    		    
    		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
    		        message = 'geolocation을 사용할수 없어요..'
    		        
    		    displayMarker(locPosition, message);
    		}	 
    	}
    	
    	
    	function addMarker(position, idx) {
    		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
       	markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    	}
    
    function getListItem(index, places) {
		var img2 = "data:image/jpeg;base64,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";
		var el = document.createElement('li'), 
		
	    itemStr = '<a>';
	    itemStr +=        '<div class="stays_item">'
	    itemStr+=        '<img src="image/' + places.photo + '"alt=/>'
	    itemStr+=       '<div class="details">'
	    	itemStr+=          '<span class="house_heading"></span>'
	    itemStr+=          '<h3>' + places.party_title + '</h3>'
	    itemStr+=           '<span>' + places.party_addr + '</span>'
	    
	    itemStr+=           '<div class="seperator"></div>'
	    itemStr+=           '<div class="sub_details">'
	    itemStr+=       '<div>'
	    itemStr+=           '<span>' + places.party_content +'</span>'
	    itemStr+=      '</div>'
	    itemStr+=       '<div>'
	    itemStr+=           '<span> 약속 시간 : ' + places.party_end_date + '</span>'
	    itemStr+=           '<span> 모집 인원 :' + places.cnt_people + ' / ' + places.party_max_cnt + ' 명</span>'
	    itemStr+=       '</div>'
	    itemStr+=   '</div>'
	    itemStr+=   '<div class="house_footer">'
	    itemStr+=       '<div class="house_left">'
	    itemStr+=           '<svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height: 14px; width: 14px; fill: currentcolor">'
	    itemStr+=            '<path d="M972 380c9 28 2 50-20 67L725 619l87 280c11 39-18 75-54 75-12 0-23-4-33-12L499 790 273 962a58 58 0 0 1-78-12 50 50 0 0 1-8-51l86-278L46 447c-21-17-28-39-19-67 8-24 29-40 52-40h280l87-279c7-23 28-39 52-39 25 0 47 17 54 41l87 277h280c24 0 45 16 53 40z">'
	    itemStr+=               '</path>'
	    itemStr+=           '</svg>'
	    itemStr+=           '<span>' + places.user_id + '</span>'
		itemStr+=      ' </div>'
	    itemStr+=               ' <div class="house_right">'
	    itemStr+= 			'<button class = "rq_btn">신청하기</button>'
	    itemStr+=      ' </div>'
	    itemStr+=   '</div>'
	    itemStr+= '<div class="sub_price">'
	    itemStr+=       '<span>257 ₺</span> / night'
	    itemStr+=   '</div>'
	    itemStr+=	'</div>'
	    itemStr+=  ' </div>'
	    itemStr+='</a>'
		console.log();
		console.log();
	                
	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}
    
    $(document).on('click', '.rq_btn',function(){
    	var user_id = document.getElementById('user_id').value;
		var party_seq = document.getElementById('party_seq').value;
		
		$.ajax({
			url : 'RequestPartyService',
			type : 'get',
			data : {
				party_seq : party_seq,
			      user_id : user_id
			        },
			success : function(result){
				if(parseInt(result) > 0){
					alert("파티신청 완료!");
					location.reload();
				}else{
					alert("이미 신청한 파티입니다!");	
				}
			},
			error : function(){
				                
			}
		}) })
    
    </script>
</body>

</html>