<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type = "text/css">

html {

    position: relative;

    min-height: 100%;

    margin: 0;

    background-color : #D8CEF6;

}

a {
	color : white;
	font-weight : bold;
	text-decoration: none;
}

header {
	top : 0;
	width : 100%;
	left: 0;
	padding: 10px 0;
	background-color : #5882FA;
	text-align : center;
}

nav {
	width : 100%;
	left: 0;
	height : 30px;
	line-height : 30px;
	background-color : #8258FA;
	font-size : 12pt;
}

body {
	min-height: 100%;
}

footer {
	line-height : 0px;
	background-color : #5882FA;
	color: white;
	
	position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 3px 0;

	text-align: center;
}

</style>

<header>
<h1 style = "color : white;">쇼핑몰 회원관리 ver1.0</h1>
</header>

<nav>
&nbsp;&nbsp;&nbsp;<a href = "http://localhost:8181/HRD_test/member/registForm.jsp" target = "_self">회원 등록</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href = "http://localhost:8181/HRD_test/member/memberList.jsp" target = "_self">회원 목록 조회 수정</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href = "http://localhost:8181/HRD_test/member/memberSell.jsp" target = "_self">회원 매출 조회</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href = "http://localhost:8181/HRD_test/home.jsp" target = "_self"> 홈으로 </a>
</nav>

<footer>
<h4 style = "color : white; font-weight : normal;">HRDKOREA Copyright 2016 All rights reserved HRD</h4>
</footer>
