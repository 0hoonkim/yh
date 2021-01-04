<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
 String img = request.getParameter("img");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
								<easy-img  class="">
                                    <img alt="" class="" src="<%=img %>" >
                                </easy-img>
</body>
</html>