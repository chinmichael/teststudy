<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "DBPKG.*" %>
<%@ page import = "java.util.*" %>

<%	ShopDAO dao = ShopDAO.getInstance();
	Vector<SellVO> list = dao.printSell();
	%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page = "/header.jsp" />
<title>Insert title here</title>
</head>
<body>

<h2 style = "text-align : center;">회원매출조회</h2>

<table border = "1" class = "list" style = "margin-left : 33%;">

	<tr>
	<th>회원번호</th><th>회원성명</th><th style = "width : 150pt;">고객등급</th><th style = "width : 150pt;">매출</th>
	</tr>
	<% for(int i = 0; i < list.size(); i++) {
		SellVO data = list.get(i);

		String grade = "";
		
		if(data.getGrade().equals("A")) {
			grade = "VIP";
		} else if (data.getGrade().equals("B")) {
			grade = "일반";
		} else {
			grade = "직원";
		}
		
		%>
		<tr>
		<th><%= data.getCustno() %></a></th>
		<th><%= data.getCustname() %></th>
		<th><%= grade %></th>
		<th><%= data.getSale() %></th>
		</tr>
	<%} %>
		

</table>



</body>
</html>