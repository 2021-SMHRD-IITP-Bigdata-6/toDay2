<%@page import="com.today.DTO.memberDTO"%>
<%@page import="com.today.DAO.boardDAO"%>
<%@page import="com.today.DAO.commDAO"%>
<%@page import="com.today.DTO.commDTO"%>
<%@page import="com.today.DTO.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>

<html class="no-js" lang="en-US">
<!--<![endif]-->

<head>
<script src="jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Synthetica HTML5/CSS3 Template</title>
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

<style>
//
댓글 관련 스타일
	.replymenu a {
	cursor: pointer;
	word-spacing: 10px;
	line-height: 20px;
}

.replymenu {
	display: none;
	word-spacing: 10px;
	line-height: 20px;
}

.replyhide{
	display: none;
	word-spacing: 10px;
	line-height: 20px;}

//댓글 관련 스타일 끝 // 좋아요 기능
	a.like_button {
	right: 60px;
	bottom: 1px;
	position: absolute;
}



  th, td {
    border: 1px solid #444444;
    padding: 10px;
    font-size: small;
  }

</style>
</head>

<body>
	<%
	boardDTO board_dto = (boardDTO) session.getAttribute("board_dto");
	commDTO comm_dto = (commDTO) session.getAttribute("comm_dto");
	memberDTO dto = (memberDTO) session.getAttribute("dto");	

	
	
	
	
	boardDAO board_dao = new boardDAO();
	ArrayList<boardDTO> arr = board_dao.board_all();


	
	commDAO comm_dao = new commDAO();
	ArrayList<commDTO> all = comm_dao.comm_selectall();
	int cnt =0;

	%>



	<div class="container-fluid">
		<div class="row">
			<div class="header-nav-wrapper">
				<div class="logo">
					<a href="/index.html"><img src="img/synthetica-logo.png"
						alt="Synthetica Freebie"></a>
				</div>
				<div class="primary-nav-wrapper">
					<nav>
						<ul class="primary-nav">
							<%if(dto == null) { %>
							<li><a href="login.html"> 로그인 </a></li>
							<li><a href="#team"> 회원가입 </a></li>
							<%} else{ %>
							<li><a href="LogoutService"> 로그아웃 </a></li>
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
							<%} %>
							<li class="search"><a href="#search" class="show-search"><li class="fa fa-search"></i></a></li>
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
	<section class="latest-articles has-padding alternate-bg" id="articles">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<h3 style="font-weight: bold">메인 게시판</h3>
				</div>
				<div class="col-md-8 col-sm-8 sort">
					<h5>Sort by</h5>
					<select name="article-sort" id="inputArticle-Sort" class="">
						<option value="">Experience Design</option>
						<option value="">Visual Design</option>
						<option value="">UI Patterns</option>
						<option value="">Product Design</option>
					</select>
				</div>
			</div>
			<section class="latest-articles has-padding alternate-bg"
				id="articles">
				<div class="container" >
					<%
						try {
						for (int i = 0; i < arr.size(); i++) {
					%>
					<!-- 1번 게시물 -->
					<input type="hidden" >
					<div>
						<div class="col-md-4">
							<article class="article-post">
							<h3 style="margin-top: 10%; margin-bottom: 5%; color: #7AE2DE; font-weight: bold;">#<%=arr.get(i).getM_article_region() %></h3>
								<a href="BoardViewService?M_article_seq=<%=arr.get(i).getM_article_seq() %>"> <img src="<%=arr.get(i).getM_article_img()%>"
									style="width: 100%; height: 100%;" 
									id="article-image has-overlay">

									<figure>
										<figcaption>
											<h2><%=arr.get(i).getM_article_subject()%></h2>
											
											<p class="getM_article_content"><%=arr.get(i).getM_article_content()%></p>
										</figcaption>
									</figure>
								</a>
								<div>
									<ul class="article-footer">
										<li style="position: absolute; right : 0%; color: #7AE2DE; font-weight: bold;" ><a href='BoardDelService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq() %>'>삭제</a></li>
										<li style="position: absolute; right : 10%; color: #7AE2DE; font-weight: bold;"><a href='BoardUpdateService?ARTICLE_SEQ=<%=arr.get(i).getM_article_seq() %>'>수정</a></li>
										<li style="position: absolute; right : 20%;">
											<div class="like-button-wrapper">
												<a class="like_button" onclick="func(<%=arr.get(i).getM_article_seq()%>,<%=arr.get(i).getM_article_likes() %>)" ><i
													class="like-counter fa fa-heart-o" ></i> <span class="like_count" ><%=arr.get(i).getM_article_likes() %></span>
												</a>
												
											</div>
										</li>
										<li class="replymenu" style="margin-left: 2px"><a
											href="#" onclick="return false;" style="font-size: 20px">Reply</a>
											<ul class="replyhide">
											<table style="width: 100%; table-layout : fixed; word-break:break-all; border: 1px solid #444444;">
											<tr>
												<td width="50%">댓글내용</td>
												<td width="20%">작성자</td>
												<td width="20%">일자</td>
											</tr>
											
											
											<% 
											cnt =0;									
											for (int j = 0 ; j < all.size(); j++){
												if(arr.get(i).getM_article_seq()==all.get(j).getComm_seq()) {
											%>
											<tr>
											<td width="50%"> <%=all.get(j).getComm_content() %> </td>
											<td width="20%"> <%=all.get(j).getMb_id() %> </td> 
											<td width="20%"> <%=all.get(j).getComm_date() %> </td> 
											</tr>  
											  <% cnt +=1; %>
											<%	}
											} %>	
											</table>
											</ul>
											</li>
									</ul>
									<ul>
										<li class="article-category"></li>
										<li class="article-comments"><span><i class="fa fa-comments"></i><%=cnt %> </span></li>
									</ul>
								</div>
							</article>
						</div>
					</div>
					<%
						}
					} catch (Exception e) {
					}
					%>
				</div>
			</section>

	<%
//				try {
//				for (int i = 0; i < arr.size(); i++) {
//					for (int j = 0 ; j < all.size(); j++){
//						if(arr.get(i).getM_article_seq()==all.get(j).getComm_seq()) {
//							System.out.println(all.get(j).getComm_content());
//						}
//					}
//
//
//			}
//			} catch (Exception e) {
//
//			}
			%>	

			<!-- END SECTION: Articles -->
			<!-- SECTION: Freebies -->
							<a href="#" class="btn secondary view-more">View more</a>
						</div>
					</div>
				</div>
			</section>
			<!-- END SECTION: Freebies -->
			<!-- SECTION: Footer -->
			<footer class="has-padding footer-bg">
				<div class="container">
					<div class="row">
						<div class="col-md-4 footer-branding">
							<img class="footer-branding-logo" src="img/synthetica-logo.png"
								alt="Synthetica freebie html5 css3 template logo">
							<p>
								A free website template created exclusively for <a
									href="http://tympanus.net/codrops/"><em>Codrops</em></a>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 footer-nav">
							<ul class="footer-primary-nav">
								<li><a href="#intro">The Collective</a></li>
								<li><a href="#team">The Crew</a></li>
								<li><a href="#articles">Articles</a></li>
								<li><a href="#freebies">Freebies</a></li>
								<li><a href="#">Subscribe</a></li>
							</ul>
							<ul class="footer-share">
								<li><a href="http://tympanus.net/codrops/licensing/">Licence</a></li>
								<li><a href="#" class="share-trigger"><i
										class="fa fa-share"></i>Share</a></li>
							</ul>
							<div class="share-dropdown">
								<ul>
									<li><a href="#" class="share-twitter"><i
											class="fa fa-twitter"></i></a></li>
									<li><a href="#" class="share-facebook"><i
											class="fa fa-facebook"></i></a></li>
									<li><a href="#" class="share-linkedin"><i
											class="fa fa-linkedin"></i></a></li>
								</ul>
							</div>
							<ul class="footer-secondary-nav text-center">
								<li><p>
										A free website template created exclusively for <a
											href="http://tympanus.net/codrops/"><em>Codrops</em></a>
									</p></li>
							</ul>
							<ul class="footer-secondary-nav text-center mt-0">
								<li><p>
										A free website template distributed <a
											href="https://themewagon.com/"><em>Themwagon</em></a>
									</p></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
			<!-- END SECTION: Footer -->
			<!-- JS CDNs -->

			<script
				src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
			<script
				src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
			<script src="http://vjs.zencdn.net/5.4.6/video.min.js"></script>
			<!-- jQuery local fallback -->
			<script>
				window.jQuery
						|| document
								.write('<script src="js/min/jquery-1.11.2.min.js"><\/script>')
			</script>
			<!-- JS Locals -->
			<script src="js/min/bootstrap.min.js"></script>
			<script src="js/min/modernizr-2.8.3-respond-1.4.2.min.js"></script>
			<script src="js/min/retina.min.js"></script>
			<script src="js/min/jquery.waypoints.min.js"></script>
			<script src="js/min/flickity.pkgd.min.js"></script>
			<script src="js/min/scripts-min.js"></script>
			<!-- Google Analytics: change UA-XXXXX-X to be your site's ID and uncomment -->
			<!--
	<script>
	(function(b, o, i, l, e, r) {
		b.GoogleAnalyticsObject = l;
		b[l] || (b[l] =
			function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
		b[l].l = +new Date;
		e = o.createElement(i);
		r = o.getElementsByTagName(i)[0];
		e.src = '//www.google-analytics.com/analytics.js';
		r.parentNode.insertBefore(e, r)
	}(window, document, 'script', 'ga'));
	ga('create', 'UA-XXXXX-X', 'auto');
	ga('send', 'pageview');
	</script>
	-->
			<!-- 댓글 기능 시작 -->

			<!-- 댓글 기능 종료 -->
			<script>
				function func(a, b) {
					console.log(a);
					console.log(b);
					var c = $(".like_button").parent().find(".like-counter");
					if(c.hasClass("fa-heart")) {
						var counter = "x";  
					} else if(c.hasClass("fa-heart-o")){
						var counter = "o";
					}
					var article_seq = a; //게시물 번호
					var like_count = b;
					
					var param = {"article_seq" : article_seq,"like_count" : like_count, "counter" : counter };
					$.ajax({
						type : "post", //데이터를 보낼 방식
						url : "LikeService", //데이터를 보낼 url
						data : param, //보낼 데이터

						success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
						
						}
					});
				}
			
				// 댓글 펼치기 기능
				$(document).ready(function() {
					$(".replymenu>a").click(function() {
						var submenu = $(this).next("ul");

						// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
						if (submenu.is(":visible")) {
							submenu.slideUp();
						} else {
							submenu.slideDown();
						}
					}).mouseover(function() {
						$(this).next("ul").slideDown();
					});

					// 댓글 초기화후 다시 불러오는 작업
					
	
				});
				
				
				// 좋아요 +1 기능  기초 구현
				$(".like_button").on("click", function(){
			        var a = $(this).parent().find(".like-counter");
					var t = $(this).parent().find(".like_count");
					console.log(t.html());
					if(a.hasClass("fa-heart-o")){
						console.log("좋아요 +1")
						// span태그 숫자 변경
				        t.html(1 * t.html() + 1);
						$(a).removeClass("fa-heart-o"),
				        $(a).addClass("fa-heart")
				        
				        console.log(t.html());
		
				        //db 관련 정보들



					}else if(a.hasClass("fa-heart")){
						console.log("좋아요 -1")
						t.html(1 * t.html() - 1);
						$(a).removeClass("fa-heart"),
				        $(a).addClass("fa-heart-o")
				        console.log(t.html());
					}
					
					
				});
				

	
	

			</script>
</body>

</html>
