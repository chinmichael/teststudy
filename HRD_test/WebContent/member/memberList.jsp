<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "DBPKG.*" %>
<%@ page import = "java.util.*" %>

<%	ShopDAO dao = ShopDAO.getInstance();
	Vector<MemberVO> list = dao.printList();
	%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page = "/header.jsp" />
<title>Insert title here</title>
</head>
<body>

<h2 style = "text-align : center;">회원목록 조회 수정</h2>

<table border = "1" class = "list" style = "margin-left : 21%;">

	<tr>
	<th>회원번호</th><th>회원성명</th><th>전화번호</th><th style = "width : 300pt;">주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
	</tr>
	<% for(int i = 0; i < list.size(); i++) {
		MemberVO data = list.get(i);
		
		int custno = data.getCustno();
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
		<th><a href = "http://localhost:8181/HRD_test/member/changeForm.jsp?custno=<%=custno %>" target = "_self">
		<%= custno %></a></th>
		<th><%= data.getCustname() %></th>
		<th><%= data.getPhone() %></th>
		<th><%= data.getAddress() %></th>
		<th><%= data.getJoindate() %></th>
		<th><%= grade %></th>
		<th><%= data.getCity() %></th>
		</tr>
	<%} %>
		

</table>

</body>
</html>