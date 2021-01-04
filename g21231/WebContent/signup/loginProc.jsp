<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
    String id = "";
   String pwd = "";
   String prevsite = (String)session.getAttribute("prevsite");
   
   if(request.getParameter("id") != null)  
      id  = request.getParameter("id");
   if(request.getParameter("pwd") != null) 
      pwd  = request.getParameter("pwd");
   if(mMgr.loginMember(id, pwd)){
      session.setAttribute("idKey",id);
   
%>
   <script>
   
   var ps = "<%=prevsite%>";
    if(ps == "post.jsp") {
       location.href = "../qna.jsp";
    }else{
    
       location.href="../index_2.jsp";
    }
    
    
   </script>
<%   }else{ %>
   <script>
     alert("로그인 되지 않았습니다.");
      location.href="login.jsp";
   </script>
<%}%>