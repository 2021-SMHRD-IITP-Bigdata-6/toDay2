<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#menu {
		-moz-transition: -moz-transform 0.35s ease, opacity 0.35s ease, visibility 0.35s;
		-webkit-transition: -webkit-transform 0.35s ease, opacity 0.35s ease, visibility 0.35s;
		-ms-transition: -ms-transform 0.35s ease, opacity 0.35s ease, visibility 0.35s;
		transition: transform 0.35s ease, opacity 0.35s ease, visibility 0.35s;
		-moz-align-items: center;
		-webkit-align-items: center;
		-ms-align-items: center;
		align-items: center;
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-justify-content: center;
		-webkit-justify-content: center;
		-ms-justify-content: center;
		justify-content: center;
		-moz-pointer-events: none;
		-webkit-pointer-events: none;
		-ms-pointer-events: none;
		pointer-events: none;
		background: rgba(36, 41, 67, 0.9);
		box-shadow: none;
		height: 100%;
		left: 0;
		opacity: 0;
		overflow: hidden;
		padding: 3em 2em;
		position: fixed;
		top: 0;
		visibility: hidden;
		width: 100%;
		z-index: 10002;
	}

		#menu .inner {
			-moz-transition: -moz-transform 0.35s ease-out, opacity 0.35s ease, visibility 0.35s;
			-webkit-transition: -webkit-transform 0.35s ease-out, opacity 0.35s ease, visibility 0.35s;
			-ms-transition: -ms-transform 0.35s ease-out, opacity 0.35s ease, visibility 0.35s;
			transition: transform 0.35s ease-out, opacity 0.35s ease, visibility 0.35s;
			-moz-transform: rotateX(20deg);
			-webkit-transform: rotateX(20deg);
			-ms-transform: rotateX(20deg);
			transform: rotateX(20deg);
			-webkit-overflow-scrolling: touch;
			max-width: 100%;
			max-height: 100vh;
			opacity: 0;
			overflow: auto;
			text-align: center;
			visibility: hidden;
			width: 18em;
		}

			#menu .inner > :first-child {
				margin-top: 2em;
			}

			#menu .inner > :last-child {
				margin-bottom: 3em;
			}

		#menu ul {
			margin: 0 0 1em 0;
		}

			#menu ul.links {
				list-style: none;
				padding: 0;
			}

				#menu ul.links > li {
					padding: 0;
				}

					#menu ul.links > li > a:not(.button) {
						border: 0;
						border-top: solid 1px rgba(212, 212, 255, 0.1);
						display: block;
						font-size: 0.8em;
						font-weight: 600;
						letter-spacing: 0.25em;
						line-height: 4em;
						text-decoration: none;
						text-transform: uppercase;
					}

					#menu ul.links > li > .button {
						display: block;
						margin: 0.5em 0 0 0;
					}

					#menu ul.links > li:first-child > a:not(.button) {
						border-top: 0 !important;
					}

		#menu .close {
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			-webkit-tap-highlight-color: transparent;
			border: 0;
			cursor: pointer;
			display: block;
			height: 4em;
			line-height: 4em;
			overflow: hidden;
			padding-right: 1.25em;
			position: absolute;
			right: 0;
			text-align: right;
			text-indent: 8em;
			top: 0;
			vertical-align: middle;
			white-space: nowrap;
			width: 8em;
		}

			#menu .close:before, #menu .close:after {
				-moz-transition: opacity 0.2s ease-in-out;
				-webkit-transition: opacity 0.2s ease-in-out;
				-ms-transition: opacity 0.2s ease-in-out;
				transition: opacity 0.2s ease-in-out;
				background-position: center;
				background-repeat: no-repeat;
				content: '';
				display: block;
				height: 4em;
				position: absolute;
				right: 0;
				top: 0;
				width: 4em;
			}

			#menu .close:before {
				background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='20px' height='20px' viewBox='0 0 20 20' zoomAndPan='disable'%3E%3Cstyle%3Eline %7B stroke: %23ffffff%3B stroke-width: 2%3B %7D%3C/style%3E%3Cline x1='0' y1='0' x2='20' y2='20' /%3E%3Cline x1='20' y1='0' x2='0' y2='20' /%3E%3C/svg%3E");
			}

			#menu .close:after {
				background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='20px' height='20px' viewBox='0 0 20 20' zoomAndPan='disable'%3E%3Cstyle%3Eline %7B stroke: %239bf1ff%3B stroke-width: 2%3B %7D%3C/style%3E%3Cline x1='0' y1='0' x2='20' y2='20' /%3E%3Cline x1='20' y1='0' x2='0' y2='20' /%3E%3C/svg%3E");
				opacity: 0;
			}

			#menu .close:hover:after, #menu .close:active:after {
				opacity: 1;
			}

	body.is-ie #menu {
		background: rgba(42, 47, 74, 0.975);
	}

	body.is-menu-visible #wrapper {
		-moz-filter: blur(0.5em);
		-webkit-filter: blur(0.5em);
		-ms-filter: blur(0.5em);
		filter: blur(0.5em);
	}

	body.is-menu-visible #menu {
		-moz-pointer-events: auto;
		-webkit-pointer-events: auto;
		-ms-pointer-events: auto;
		pointer-events: auto;
		opacity: 1;
		visibility: visible;
	}

		body.is-menu-visible #menu .inner {
			-moz-transform: none;
			-webkit-transform: none;
			-ms-transform: none;
			transform: none;
			opacity: 1;
			visibility: visible;
		}
    
</style>
</head>
<body>
	<header id="header" class="alt">
		<a href="index.html" class="logo"><strong>방문자 수</strong> <span></span></a>
		<nav>
			<a href="#menu">로그인</a>
			<!-- 로그인한 이메일이 'admin' 이였을 때 아래 회원전체검색 메뉴가 출력되게 하시오. -->
			<a href="selectMember.jsp">회원전체검색</a> <a href="update.jsp">회원정보수정</a>
			<a href="LogoutCon.do">로그아웃</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="LoginCon.do" method="post">
				<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action="joinCon.do" method="post">
				<li><input id="join_email" type="text" name="email"
					placeholder="Email을 입력하세요">
					<button type="button" id="check" onClick="emailCheck()">중복체크</button>
					<p id="result"></p></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name="tel" placeholder="전화번호를 입력하세요"></li>
				<li><input type="text" name="address" placeholder="집주소를 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
	</nav>
</body>
</html>