<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>게시판 관리</title>
	<link rel = "stylesheet" href="/resources/home.css">
	<script src="/resources/pagination.js"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			<img src="/resources/back.jpg" width=960 height="200px"/>
		</div>
		<div id="menu">
			<span><a href="/">홈</a></span>
			<span><a href="/user/list">메세지관리</a></span>
		</div>
		<div id="content">
			<jsp:include page="${pageName}"></jsp:include>
		</div>
		<div id="footer">
			<h3>Copyrights 2022 인천일보아카데미 조현식 All Rights Reserved</h3>
		</div>
		
	</div>
</body>
</html>
