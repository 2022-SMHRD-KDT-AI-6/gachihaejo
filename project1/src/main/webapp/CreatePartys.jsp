<%@page import="Model.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	// http://localhost:8081/test1/SearchPartyService
	// /test1 : 폴더이름 ( webapp이 어디 있는지)
	String cpath = request.getContextPath();
	// 파티만들기 페이지입니다.
%>
<%
	LoginDTO user = (LoginDTO)session.getAttribute("user");
	String user_id = user.getId();
	String user_nick = user.getNick();
%>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CreateParty/css/style.css"/>
    <link rel="stylesheet" href="<%=cpath %>/CreateParty/CreateParty.css" rel="stylesheet">
    <title>파티 만들기</title>
    
    <style>
        .input2 input[type="text"] {
			
            width: 90%;
            height: 48px;
            border: 1px solid #dddddd;
            border-radius: 40px;
            -webkit-box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.1);
            box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.1);
            padding: 0px 40px;
            font-weight: 600;
            font-size: 14px; 

        }
        .stays {
   		 margin-top: 0px;
		}
		
		ul {list-style: none;}
		li {list-style: none;}
		a {text-decoration: none;}
		.h_cont {display: flex; justify-content: space-around; padding-left: 150px; padding-top:0; border-bottom: black solid 1.5px;}
		.h_random {margin: 25px 0;}
		.h_random li {display: inline-block; margin: 20px 0 0 20px;  }
		.h_random li a {font-size: 18px; color: black; font-weight: 500; transition: 0.2s;}
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
		.h_menu li a:hover {color: #5865F2;}
		
		.h_cont {display: flex; justify-content: space-around; padding-left: 150px; padding-top:0; border-bottom: black solid 1.5px }
		
		a.menu{
			width: auto;
		}
    </style>
    
</head>
<body>
		<header id="header">
            <div class="h_cont">
                <ul class="h_random">
                    <li><a href="view.jsp" class="logo"></a></li>
                </ul>
                <ul class="h_menubar">
                   <li><a href="./CreatePartys.jsp" class="menu">파티 만들기</a></li>
                   <li><a href="./SearchPartys.jsp" class="menu">파티 찾기</a></li>
                   <li><a href="HistoyParty/index.jsp" class="menu">파티 관리</a></li>
                   <li><a href="./Main.jsp" class="menu">마이페이지</a></li>
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
                <a href="index.html">
                    <svg viewBox="0 0 16 16" role="presentation" aria-hidden="true" focusable="false"
                        style="height: 1em; width: 1em; display: block; fill: currentcolor;">
                        <path
                            d="m10.8 16c-.4 0-.7-.1-.9-.4l-6.8-6.7c-.5-.5-.5-1.3 0-1.8l6.8-6.7c.5-.5 1.2-.5 1.7 0s .5 1.2 0 1.7l-5.8 5.9 5.8 5.9c.5.5.5 1.2 0 1.7-.2.3-.5.4-.8.4">
                        </path>
                    </svg>
                    <span class="back_page">Map area</span>
                </a>
            </div>
            <div class="menu_mobile_right">
                <span>Add dates</span>
                <div class="seperator"></div>
                <svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                    focusable="false" style="display: block; height: 16px; width: 16px; fill: rgb(34, 34, 34);">
                    <path
                        d="M5 8c1.306 0 2.418.835 2.83 2H14v2H7.829A3.001 3.001 0 1 1 5 8zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm6-8a3 3 0 1 1-2.829 4H2V4h6.17A3.001 3.001 0 0 1 11 2zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z">
                    </path>
                </svg>
            </div>
        </div>
    </div>

    <div class="stays">
        <div class="container">
            <div class = "left" style = "float: left;">
                <div class="stays_header">
                
                <table >
                <tr>
                	<td>
                	<t><span class="sub_heading">함께하고 싶은 파티를 만들어 보아요</span>
                    <h2 class="heading">파티 만들기</h2>
           			</td>
           			<td>
           			<div class="input2">
            			<div>
							<form onsubmit="searchPlaces(); return false;">
								<input type="text" id="keyword" size="15">
					 			<button type="submit">검색</button>
							</form>
						</div>
           			</div>
                    </td>
                </tr>
                <tr>
	                <td>
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
	                </td>
                
	                <td rowspan="2">
		                <div>
			                <div id="menu_wrap" class="bg_white" style="overflow:scroll; width:350px; height:500px;">
								<div class="option">
									<div>
										
									</div>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
		                </div>
		            </td>
                </tr>
                
                <tr>
                	<td>
                		<div class="stays_list">
	                    <table>
	                    	<form name = "test" action="CreatePartyService">
	                    		<tr>
									<td style="align-items: center;">제목</td>
									<td><input class = "box" type="text" name="title" placeholder = "제목 및 취미활동을 입력해주세요" required></td>
								</tr>
								<tr>
									<td style="align-items: center;">내용</td>
									<td><textarea class = "box" style="resize: none" cols="53" rows="5" name="text" placeholder = "파티 활동에 있어 필요한 내용을 입력해주세요" required></textarea></td>
								</tr>
								
								<tr>
									<td style="align-items: center;">취미</td>
									<td>
										<select class = "box" name="hobby" required>
										<option>
										<option value="sports">스포츠
										<option value="game">게임
										<option value="cooking">요리
										<option value="music">음악
										<option value="art">미술
										<option value="movie">영화
										<option value="pet">반려동물

										<option value="craft">공예
										<option value="improve">자기계발
										<option value="travel">여행
										</select>
									</td>
								</tr>
								
								<tr>
									<td style="align-items: center;">주소</td>
									<td><input class = "box" type="text" name="testmap" id="address" size="30" required></td>
								</tr>
								
								<tr>
									<td style="align-items: center;">최대 인원수</td>
									<td><select class = "box" name="maxPeople" required>
									<option>
									<option value = 2>2명
									<option value = 3>3명
									<option value = 4>4명
									<option value = 5>5명
									<option value = 6>6명
									<option value = 7>7명
									<option value = 8>8명
									<option value = 9>9명
									<option value = 10>10명</select>
									</td>
								</tr>
								
								<tr>
									<td align="center">모집 마감 날짜</td>
									<td><input class = "box" type="date" name="endDate" size="15" required>
									<input class = "box" type = "time" name = "time" required></td>
								</tr>
								
								<tr align="center">
									<td colspan = 2><input class = "box" type = "submit" value = "파티 만들기">
									<input type = "hidden" name = "lat">
									<input type = "hidden" name = "lon">
							</form>
	                    </table>
	                </div>
                	</td>
                	
                </tr>
                
                
                </table>
            </div>
	
        </div>
        <div id="map" style="width:1000px; height:840px; float: right;"></div>
    </div>
    
    <div class="main">
        <div class="bottom_menu">
            <div class="menu_items">
                <div class="menu_item active">
                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                        focusable="false" style="display: block;
          fill: none;
          height: 24px;
          width: 24px;
          stroke: currentcolor;
          stroke-width: 4;
          overflow: visible;
        ">
                        <g fill="none">
                            <path
                                d="m13 24c6.0751322 0 11-4.9248678 11-11 0-6.07513225-4.9248678-11-11-11-6.07513225 0-11 4.92486775-11 11 0 6.0751322 4.92486775 11 11 11zm8-3 9 9">
                            </path>
                        </g>
                    </svg><span>Explore</span>
                </div>
                <div class="menu_item">
                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                        focusable="false" style="
          display: block;
          height: 24px;
          width: 24px;
          fill: currentcolor;
        ">
                        <path
                            d="m23.0204313 3.00582063c-2.0815427.07751293-4.0715877.92728952-5.5789504 2.43470494l-1.4414809 1.44047443-1.4404171-1.44031065c-1.5845115-1.58335003-3.6983863-2.44068935-5.8929929-2.44068935-2.19416638 0-4.30898823.85772467-5.89177678 2.44051322-1.58391215 1.58390109-2.44156322 3.69775756-2.44156322 5.89278678 0 4.9282095 2.48419629 8.8512108 8.03256412 13.439053l.70954716.5770638.74171734.584714.77413928.5930892c.131739.0995864.2648394.199552.3993065.2999118l.823244.607011.8562953.6171982.8895983.6281103.9231529.6397472 1.5170817 1.0308345 1.3291121-.9009656 1.0589072-.7287753.6612652-.4625621.7010987-.498181.8533598-.6198244c7.3971739-5.4452801 11.0629604-10.1222564 11.0629604-15.8064246 0-2.19559863-.8569151-4.30921968-2.4404957-5.89278925-1.5843319-1.58317036-3.6982062-2.44051075-5.8928043-2.44051075zm.3128687 1.99417937c1.6695137 0 3.2735403.65055751 4.4788526 1.85498605 1.2043504 1.20434208 1.8544474 2.80783678 1.8544474 4.47831395 0 4.2987547-2.6123854 8.1213061-8.009061 12.474023l-.7197183.570835c-.2451788.1913357-.495635.3837563-.7513829.5773445l-.7831323.5843503-.8149664.5918523-.6943428.4933793-.6495182.4543204-1.2444781.8545952-.3599806-.2464089c-.3060116-.2102151-.6062613-.4182535-.900798-.6242279l-.8665202-.6118437c-.1415799-.1009795-.2817437-.2014711-.4204976-.3014889l-.8156535-.594534c-.1331387-.0981789-.2648797-.1959122-.3952291-.2932139l-.7654464-.5787439-.7323414-.5690616c-5.8464087-4.609638-8.4102832-8.3182024-8.4102832-12.7811772 0-1.66972745.65069601-3.27350087 1.85577431-4.47857075 1.20389067-1.20389067 2.80861035-1.85472925 4.47756569-1.85472925 1.6695226 0 3.2735495.6505567 4.4788626 1.85498605l2.8542663 2.8556887 2.8559829-2.85594303c1.2038387-1.20388075 2.8086117-1.85473172 4.4775982-1.85473172z">
                        </path>
                    </svg><span>Wishlist</span>
                </div>
                <div class="menu_item">
                    <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation"
                        focusable="false" style="
          display: block;
          height: 24px;
          width: 24px;
          fill: currentcolor;
        ">
                        <path
                            d="m16 1c8.2842712 0 15 6.71572875 15 15 0 8.2842712-6.7157288 15-15 15-8.28427125 0-15-6.7157288-15-15 0-8.28427125 6.71572875-15 15-15zm0 8c-2.7614237 0-5 2.2385763-5 5 0 2.0143973 1.2022141 3.7998876 2.9996346 4.5835001l.0003231 2.0984999-.1499943.0278452c-2.8326474.5613112-5.31897338 2.2230336-6.93575953 4.5872979 2.34343054 2.291067 5.54974273 3.7028569 9.08579613 3.7028569 3.5355506 0 6.7414538-1.4113884 9.0850203-3.701476-1.6141801-2.3628535-4.0978119-4.0247647-6.929184-4.5867938l-.1558786-.0287302.001228-2.0991413c1.7288399-.7547474 2.9066959-2.4357565 2.9936498-4.355479l.0051645-.2283797c0-2.7614237-2.2385763-5-5-5zm0-6c-7.17970175 0-13 5.82029825-13 13 0 2.9045768.95257276 5.5866683 2.56235849 7.7509147 1.42074739-1.9134907 3.33951478-3.4002416 5.53860831-4.2955956l.3480332-.1363191-.0229565-.0189706c-1.43704227-1.2411241-2.34462949-3.045583-2.42083359-5.0285539l-.00520991-.2714755c0-3.8659932 3.1340068-7 7-7s7 3.1340068 7 7c0 1.9941317-.8415062 3.8279876-2.224566 5.1193683l-.225434.2006317.0447787.0163138c2.3268368.8792152 4.3570558 2.4138611 5.8430586 4.4127726 1.6098837-2.1632453 2.5621627-4.8449575 2.5621627-7.7490864 0-7.17970175-5.8202983-13-13-13z">
                        </path>
                    </svg><span>Log in</span>
                </div>
            </div>
        </div>
    </div>

    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9343c1068f34ec9bc4c98062686ea903&libraries=services"></script>
	<script src = "<%=cpath %>/CreateParty/CreateParty.js"></script>
</body>
</html>