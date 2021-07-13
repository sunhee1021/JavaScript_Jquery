<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//이 페이지가 서버에서 실행된다
//action="Ex08_login.jsp" -> 서버가 가지고 있는 Ex08_login.jsp 이 페이지를 실행하겠다는 의미
	
//요청주소 : 192.168.0.128:8090/WebClient/Ex08_login.jsp?txtuserid=..&txtpwd=... 해서 가는거임

	String id = request.getParameter("txtuserid"); //admin
	String pwd = request.getParameter("txtpwd"); // 12345
	
	//그 다음 작업(DB insert, select) , 파일처리를 하든 그건 개발자 마음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버 확인 (Client 다시 전달)<br>
	<%=id %> <!-- %= 서버의 내용을 Client에게 전달에서 write하겠다는 의미 --> <hr>
	<%=pwd %>
</body>
</html>