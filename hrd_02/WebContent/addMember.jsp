<%@page import="dao.gradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	gradeDAO dao = new gradeDAO();
	int max = dao.MaxNO();
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
	<section id="add">
		<h1>회원등록</h1>
		<form method="post" action="addMemberCtrl.jsp" onsubmit="return checkValue()">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="membernum" id="membernum" value="<%=max%>"></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="member" id="mmeber" value=""></td>
				</tr>
				<tr>
					<th>국어 점수</th>
					<td><input type="text" name="lang" id="lang" value=""></td>
				</tr>
				<tr>
					<th>수학 점수</th>
					<td><input type="text" name="math" id="math" value=""></td>
				</tr>
				<tr>
					<th>영어 점수</th>
					<td><input type="text" name="eng" id="eng" value=""></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">등록</button>
						<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer id="footer">
		<%@include file="homeshare/footer.jsp" %>
	</footer>
</body>
</html>