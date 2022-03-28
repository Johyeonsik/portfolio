<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="page">
	<h1>메세지관리</h1>
	<table>
		<tr class="title">
			<td width="100">아이디</td>
			<td width="200">이름</td>
			<td width="100">포인트</td>
			<td width="200">보낸메세지</td>
			<td width="200">받은메세지</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td>${vo.uid }</td>
				<td>${vo.uname }</td>
				<td>${vo.point }</td>
				<td><button onClick="location.href='send?uid=${vo.uid}'">보낸메세지</button>[${vo.sendcnt}]</td>
				<td><button onClick="location.href='receive?uid=${vo.uid}'">받은메세지</button>[${vo.rececnt}]</td>
			</tr>
		</c:forEach>
	</table>
</div>