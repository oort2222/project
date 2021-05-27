<%@page import="vo.resultVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.gradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	gradeDAO dao = new gradeDAO();
	ArrayList<resultVO> result = dao.result();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
		<%@include file="homeshare/header.jsp" %>
	</header>
	<div id="menu">
		<%@include file="homeshare/menu.jsp" %>
	</div>
	<section id="rank">
		<h1>평균 및 등급조회</h1>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>평균</td>
				<td>등급</td>
			</tr>
<%
	for(resultVO vo : result){
		int res = vo.getResult();
		String grade = "";
		if(res >= 90){
			grade = "A";
		}else if(res >= 80){
			grade = "B";
		}else if(res >= 70){
			grade = "C";
		}else if(res >= 60){
			grade = "D";
		}else if(res >= 50){
			grade = "E";
		}else if(res >= 40){
			grade = "F";
		}
%>			
			<tr>
				<td><%=vo.getMembernum() %></td>
				<td><%=vo.getMember() %></td>
				<td><%=vo.getResult() %></td>
				<td><%=grade %></td>
			</tr>
<%
	}
%>
		</table>
	</section>
	<footer id="footer">
		<%@include file="homeshare/footer.jsp" %>
	</footer>
</body>
</html>