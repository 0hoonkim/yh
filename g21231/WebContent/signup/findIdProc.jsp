<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Vector, ch14.FindIdBean"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />

<%
   request.setCharacterEncoding("euc-kr");
   String email = request.getParameter("email");
   String name = request.getParameter("name");
   String url = "login.jsp";
   String msg = "이메일 또는 이름이 다릅니다";
   
   Vector<FindIdBean> flist = null;
   
   flist = mMgr.findId(email,name);
  
   System.out.print(flist.size());
   
   FindIdBean bean = flist.get(0);
   
   String id = bean.getId(); 
   
   if(id != null){
   msg = "아이디는" + id + "입니다";

   } 
%>

<script>
   alert("<%=msg%>"); 
   location.href="<%=url%>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>