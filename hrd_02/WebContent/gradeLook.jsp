<%@page import="vo.gradeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.gradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	gradeDAO dao = new gradeDAO();
	ArrayList<gradeVO> grade = dao.gradeLook();
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
	<section id="look">
	<h2>성적 조회/수정</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>국어점수</th>
				<th>수학점수</th>
				<th>영어점수</th>
				<th>기능</th>
			</tr>
<%
	for(gradeVO vo : grade){
%>
			<tr>
				<td><%=vo.getMembernum() %></td>
				<td><%=vo.getMember() %></td>
				<td><%=vo.getLang() %>점</td>
				<td><%=vo.getMath() %>점</td>
				<td><%=vo.getEng() %>점</td>
				<td colspan="2" align="center">
					<button>수정</button>
					<button>삭제</button>
				</td>
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