<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
 	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID �ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center">
	<br /><b><%=id%></b>
	<%
		if(result) {
			out.println("�� �̹� �����ϴ� ID�Դϴ�.<p/>");
		}else {
			out.println("�� ��� ���� �մϴ�.<p/>");
		}
	%>
	
	<a class="close" href="#" onClick="self.close()">�ݱ�</a>
	
	</div>
</body>
</html>