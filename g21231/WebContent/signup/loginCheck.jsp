<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");

    String id = "";
	String pwd = "";
	String place="";
	String comment = "";
	/* String prevsite = (String)session.getAttribute("prevsite"); */
	
	if(request.getParameter("id") != null)  
	   id  = request.getParameter("id");
	if(request.getParameter("pass") != null) 
	   pwd  = request.getParameter("pass");
	if(mMgr.loginMember(id, pwd)){
		/* session.setAttribute("idKey",id); */
		

		/* <script>
	window.location.href = "sights_script.jsp";
		</script> */
		request.setAttribute("id", id);
		request.setAttribute("pwd", pwd);
		comment = request.getParameter("comment");
		request.setAttribute("comment", comment);
		request.setAttribute("place", place);
		String rating = request.getParameter("rating");
		request.setAttribute("rating", rating);
		RequestDispatcher rd = request.getRequestDispatcher("boardReview");
		rd.forward(request, response);
		
		
	
	}else{ %>
	<script>
	<%
	session.setAttribute("errMsg", "비밀번호가 일치하지 않습니다!");
	comment = request.getParameter("comment");
	request.setAttribute("comment", comment);
	RequestDispatcher rd = request.getRequestDispatcher("reviewboard.jsp");
	rd.forward(request, response);
	%>
	/* window.location.href = "reviewboard.jsp"; */
	</script>
<%}%>
