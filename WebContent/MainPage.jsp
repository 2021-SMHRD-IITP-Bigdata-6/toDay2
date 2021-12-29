<%@page import="com.today.DAO.mainLifeDAO"%>
<%@page import="com.today.DTO.mainLifeDTO"%>
<%@page import="com.today.DAO.memberDAO"%>
<%@page import="com.today.DAO.moveDAO"%>
<%@page import="com.today.DTO.mainPageDTO"%>
<%@page import="com.today.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description"
	content="A free html template with Sketch design made with Bootstrap">
<meta name="keywords"
	content="free html template, bootstrap, ui kit, sass" />
<meta name="author" content="Codrops" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon generated by http://realfavicongenerator.net/ -->
<link rel="apple-touch-icon" sizes="57x57"
	href="img/favicon/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="img/favicon/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/favicon/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/favicon/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/favicon/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/favicon/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="img/favicon/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/favicon/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="img/favicon/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="img/favicon/favicon-32x32.png"
	sizes="32x32">
<link rel="icon" type="image/png" href="img/favicon/favicon-194x194.png"
	sizes="194x194">
<link rel="icon" type="image/png" href="img/favicon/favicon-96x96.png"
	sizes="96x96">
<link rel="icon" type="image/png"
	href="img/favicon/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="img/favicon/favicon-16x16.png"
	sizes="16x16">
<link rel="manifest" href="img/favicon/manifest.json">
<link rel="mask-icon" href="img/favicon/safari-pinned-tab.svg"
	color="#5bbad5">
<link rel="shortcut icon" href="img/favicon/favicon.ico">
<meta name="msapplication-TileColor" content="#66e0e5">
<meta name="msapplication-TileImage"
	content="img/favicon/mstile-144x144.png">
<meta name="msapplication-config"
	content="img/favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<!-- end favicon links -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/normalize.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/flickity.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.9/css/jquery.mb.YTPlayer.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>
	var player = [ "Snow.mp4", "RainMore.mp4", "RainLess.mp4", "Lightning.mp4", "CloudMore.mp4", "CloudLess.mp4", "Sun.mp4", "Grey.mp4"];
		
	function playit() {
		var t = ["Snow.mp4", "RainMore.mp4", "RainLess.mp4", "Lightning.mp4", "CloudMore.mp4", "CloudLess.mp4", "Sun.mp4", "Grey.mp4"];
		var myNodelist = document.getElementsByTagName('source');
		var i;
		for (i = 0; i < myNodelist.length; i++) {
			myNodelist[i].src = t[i];
		
		}
		console.log(t);
	}
	
	
</script>
</head>

<body>

	<%
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		mainPageDTO move_dto = (mainPageDTO)session.getAttribute("move_dto");
		moveDAO move_dao = new moveDAO();
		
		mainLifeDAO life_dao = new mainLifeDAO();
		mainLifeDTO life_dto = null;

	%>

	<div class="container-fluid">
		<div class="row">
			<div class="header-nav-wrapper">
				<div class="logo">
					<a href="/index.html"><font size="20px">TODAY? </font></a>
				</div>
				<div class="primary-nav-wrapper">
					<nav>
						<ul class="primary-nav">

							<%
								if (dto != null) {
							%>
							<li><%=dto.getMb_id()%></li>
							<li><%=dto.getMb_nickname()%></li>
							<li id=Mb_region> <%=dto.getMb_region()%></li>
							<%
								}
							%>

							<%
								if (dto == null) {
							%>
							<li><a href="login.html"> 로그인 </a></li>
							<li><a href="team"> 회원가입 </a></li>
							<%} else{ %>
							<li><a href="LogoutService"> 로그아웃 </a></li>
							<li><a href="update.jsp?mb_id=<%=dto.getMb_id() %>"> 정보수정 </a></li>
							<%} %>
							
							
							<li><a href="t_community.jsp"> 공유 게시판 </a></li>
							<li><a href="#articles"> 미션 게시판 </a></li>
							<li><a href="#freebies"> 지도로 보기 </a></li>
						</ul>
					</nav>

					<div class="secondary-nav-wrapper">
						<ul class="secondary-nav">
							<%if(dto == null) { %>
							<li class="subscribe"><a href="">글작성시 로그인이 필요합니다.</a></li>
							<%} else{ %>
							<li class="subscribe"><a href="t_write.jsp">글작성하기</a></li>
							<%
								}
							%>
							<li class="search"><a href="#search" class="show-search"></a>
						</ul>
					</div>
					<div class="search-wrapper">
						<ul class="search">
							<li><input type="text" id="search-input"
								placeholder="Start typing then hit enter to search"></li>
							<li><a href="#" class="hide-search"><i
									class="fa fa-close"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="navicon">
					<a class="nav-toggle" href="#"><span></span></a>
				</div>
			</div>
		</div>
	</div>
    <!-- DB연동하여 지역,기온,날씨 정보 가져오기 -->
			<div>
			<%
				if (dto != null) {
				%>
			<h3 style="color: grey;">
				날씨 :
				<%=move_dao.Move(dto.getMb_region()).getW_status()%></h3>
			<h3 style="color: grey;">
				기온 :
				<%=move_dao.Move(dto.getMb_region()).getW_temp()%></h3>
			<h3 style="color: grey;">
				지역 :
				<%=move_dao.Move(dto.getMb_region()).getW_local()%></h3>
			<%
					}
				%>
		</div>
		<!-- DB연동하여 세부 날씨 정보 가져오기 -->
		<div>
			<%if (dto != null) {%>
			<h3 style="color: black;"> 날씨 :
				<%=move_dao.Move(dto.getMb_region()).getW_status()%></h3>
			<h3 style="color: black;"> 기온 :
				<%=move_dao.Move(dto.getMb_region()).getW_temp()%></h3>
			<h3 style="color: black;"> 지역 :
				<%=move_dao.Move(dto.getMb_region()).getW_local()%></h3>
			<h3 style="color: black;"> 체감 온도 :
				<%=move_dao.Move(dto.getMb_region()).getW_body_temp()%></h3>
			<h3 style="color: black;"> 미세먼지 :
				<%=move_dao.Move(dto.getMb_region()).getW_humidity()%></h3>
			<h3 style="color: black;"> 풍향 :
				<%=move_dao.Move(dto.getMb_region()).getW_wind()%></h3>
			<% } %>
		</div>
		<div>
			<%if(dto != null){ %>
				<h3>빨래지수: <%=life_dao.life_dto(dto.getMb_region()).getw_wash() %></h3>
				<h3>외출지수: <%=life_dao.life_dto(dto.getMb_region()).getW_out() %></h3>
				<h3>운동지수: <%=life_dao.life_dto(dto.getMb_region()).getW_exercise() %></h3>
				<h3>세차지수: <%=life_dao.life_dto(dto.getMb_region()).getW_washcar() %></h3>
				<h3>강우지수: <%=life_dao.life_dto(dto.getMb_region()).getW_rain() %></h3>
				<h3>잠지수: <%=life_dao.life_dto(dto.getMb_region()).getW_sleep() %></h3>
				<h3>감기지수: <%=life_dao.life_dto(dto.getMb_region()).getW_cold() %></h3>
				<h3>불지수: <%=life_dao.life_dto(dto.getMb_region()).getW_fire() %></h3>
			<%} %>
		</div>		 
		
		
	<header class="hero">
		<div class="carousel js-flickity">
			<video id="video" width="100%" autoplay="1" loop="1" controls="0"
				muted="1" style="margin-top: 0px; margin-left: 0px; position: absolute; z-index:1">
				<source src="mp4/Snow.mp4" type="video/mp4" id="video1">
				<!-- <source src="mp4/Rain.mp4" type="video/mp4" id="video2">			
				<source src="mp4/Lightning.mp4" type="video/mp4" id="video3">
				<source src="mp4/weat-field.mp4" type="video/mp4" id="video4"> -->
			</video>
			

			<button onclick="Weather()">hi</button>
			<script>
			// 날씨 정보 이후.. 사용하기
		/*	var snow = player[0];
			var rain = player[1];
			var light = player[2];
			var wind = player[3];*/
			
		/*	if("snow".equals("눈")){
				<source src="mp4/Snow.mp4" type="video/mp4" id="video1">
			}else if("rain".equals("흐리고")){
				<source src="mp4/Rain.mp4" type="video/mp4" id="video2">
			}else if("rain".equals("흐리고")){
				<source src="mp4/Lightning.mp4" type="video/mp4" id="video3">	
			}else{
				<source src="mp4/weat-field.mp4" type="video/mp4" id="video4">
			}*/
			</script>
		</div>
		<input type="text" name="move_region">
		<button type="submit" value="submit">버튼</button>
		<div class='mouse-container'>
			<a href="#intro">
				<div class='mouse'>
					<span class='scroll-down'></span>
				</div>
			</a>
		</div>



	</header>


	<script type="text/javascript">
	
		// 동적 화면 sql 실행
		// 로그인된 사람 지역
		

		
		// w_status 값 가져오기
		

		

		
		
		// staus값 가져와서 날씨와 비교 후 영상 보여주기

			
			//console.log(1);
			//$("#video1").attr("src", "mp4/Lightning.mp4");
			//document.getElementById('video').load();
			
	
		</script>
</body>
</html>
