<%@page import="dao.gradeDAO"%>
<%@page import="vo.gradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String membernum = request.getParameter("membernum");
	String member = request.getParameter("member");
	int lang = Integer.parseInt(request.getParameter("lang"));
	int math = Integer.parseInt(request.getParameter("math"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	
	gradeVO vo = new gradeVO();
	vo.setMembernum(membernum);
	vo.setMember(member);
	vo.setLang(lang);
	vo.setMath(math);
	vo.setEng(eng);
	
	gradeDAO dao = new gradeDAO();
	int cnt = dao.addMember(vo);
	
	if(cnt > 0){
		response.sendRedirect("gradeLook.jsp");
	}else{
		response.sendRedirect("gradeLook.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>