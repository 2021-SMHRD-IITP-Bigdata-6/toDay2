<%@page import="com.today.DTO.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.today.DAO.commDAO"%>
<%@page import="com.today.DTO.commDTO"%>
<%@page import="com.today.DTO.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
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


//
댓글 관련 스타일 끝 // 좋아요 기능
	a.like_button {
	right: 60px;
	bottom: 1px;
	position: absolute;
}

.content-box {
	box-sizing: border-box;
	width: 100%;
	border: solid #5B6DCD 1px;
	padding: 1px;
	background-color: white;
}

.contents_style {
	all: unset;
	line-height: 1.9;
	color: $alpha;
	font-weight: 300;
	margin-bottom: 20px;
	padding: 5px;
	letter-spacing: 0.3px;
}

.contents_style:after {
	all: unset;
}

h4:after {
	display: block;
	width: 100%;
	height: 2px;
	margin-top: 15px;
	content: '';
	background-color: #7AE2DE;
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
		memberDTO dto = (memberDTO) session.getAttribute("dto");
		commDTO comm_dto = (commDTO) session.getAttribute("comm_dto"); 

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
						<%if(dto != null) { %>
							<li><%=dto.getMb_id() %> </li>
							<li><%=dto.getMb_nickname() %> </li>
							<li><%=dto.getMb_region() %> </li>
							<%} %>
	
							
							
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
							<li class="subscribe"><a href="#get-started">Subscribe</a></li>
							<li class="search"><a href="#search" class="show-search"><i
									class="fa fa-search"></i></a></li>
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
				<div class="col-md-4 col-sm-1">
					<h3 style="font-weight: bold"><%=board_dto.getM_article_subject()%></h3>
				</div>
				<div class="col-md-4 col-sm-1" style="float: right;">
					<h4 style="float: right"><%=board_dto.getMb_id()%>회원님 <b>#<%=board_dto.getM_article_region()%></b>
					</h4>

				</div>
				<div class="col-md-8 col-sm-8 sort">
					<h4 style="float: right">
						(<%=board_dto.getM_board_type()%>)
					</h4>
					<h4 style="float: right" ><%=board_dto.getM_article_seq()%>번
						게시글
					</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 no-padding">
					<figure>
						<figcaption class="overlay">
							<div class="like-share-wrapper"></div>
						</figcaption>
						<img src="<%=board_dto.getM_article_img()%>"
							style="width: 100%; height: 100%;" id="m_article_preview">
						<div></div>
					</figure>
				</div>

				<div class="col-md-4">
					<article class="article-post">
						<div class="content-box" style="padding: 10px">
							<ul>
								<li><h4 class="contents_style"><%=board_dto.getM_article_content()%></h4></li>
							</ul>
							<hr>
							<div class="like-button-wrapper" >
								<a href="#" class="like_button" ><i
									class="like-counter fa fa-heart-o" ></i> <span><%=board_dto.getM_article_likes()%>0</span>
								</a >
							</div>
							<ul style="margin-top: 10px">
								<li>			
									<table style="width: 100%; table-layout : fixed; word-break:break-all; border: 1px solid #444444;">
										<thead>
											<tr >
												<td width="50%">댓글내용</td>
												<td width="20%">작성자</td>
												<td width="20%">일자</td>
												<td width="10%">삭제</td>
											</tr>
										</thead>

										<tbody id='tbody'>
											<%
									commDAO comm_dao = new commDAO();
									ArrayList<commDTO> arr = comm_dao.comm_all(board_dto.getM_article_seq());
									
									 for (int i = 0 ; i <arr.size(); i++)  {%>
											<tr>
												<td><%=arr.get(i).getComm_content() %></td>
												<td><%=arr.get(i).getMb_id() %></td>
												<td><%=arr.get(i).getComm_date() %></td>
												<td><a href='CommDelService?COMM_SEQ=<%=arr.get(i).getM_article_seq() %>'> 삭제 </a></td>
											</tr>
											<% }%>
										</tbody>
									</table>
								</li>
							</ul>
							
							<ul class="article-footer">
								<li class="replymenu">
								<a href="#" onclick="return false;"	style="font-size: 20px">Reply</a>
									<ul class="replyhide" style="margin-top: 10px">
										<li><div >
												<!-- 세션에 저장되어있는 userid가 null이 아닐때 -->
												<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->
												<!--  <c:if test="${sessionScope.userid != null }">-->
												<textarea class="content-box" id="replytext"
													placeholder="댓글을 작성하세요" rows="5" cols="50"></textarea>
												<br>
												<!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
												<!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
												<!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
												<button type="button" id="btnReply" >댓글쓰기</button>
												<!-- </c:if>-->
											</div></li>
									</ul></li>
								<li></li>
							</ul>
							
						</div>

					</article>
				</div>


			</div>
		</div>
	</section>
	<!-- END SECTION: Articles -->
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


		//댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문)
		$("#btnReply").click(function() {
			var comm_content = $("#replytext").val(); //댓글 내용
			var article_seq = "${board_dto.getM_article_seq()}"; //게시물 번호
			var mb_id = "${board_dto.getMb_id()}";  //작성자 아이디
			var param = { "comm_content" : comm_content, "article_seq" : article_seq, "mb_id" : mb_id };
			//var param="replytext="+replytext+"&bno="+bno;
			$.ajax({
				type : "post", //데이터를 보낼 방식
				url : "ReplyService", //데이터를 보낼 url
				data : param, //보낼 데이터

				success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
					location.reload();
					alert("댓글이 등록되었습니다.");
				}
			});
		});
		

	</script>

</body>

</html>
