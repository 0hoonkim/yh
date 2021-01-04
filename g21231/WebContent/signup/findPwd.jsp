<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = request.getParameter("id");
	  String prevsite = (String)session.getAttribute("prevsite");
%>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" href="login.css">
<script type="text/javascript">
	function CheckIe() {
		if (document.findidFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.findidFrm.id.focus();
			return;
		}
		if (document.findidFrm.email.value == "") {
			alert("이메일을 입력해 주세요.");
			document.findidFrm.email.focus();
			return;
		}
		document.findidFrm.submit();
	}
</script>
</head>
<body>
	<form name="findidFrm" method="post" action="findPwdProc.jsp">
	    <div class="box" align="center">
	    <a href="../index_2.jsp" style="text-decoration:none";>
	      <div class="logo">
	        <span style="color: #4285F4">J</span>
	        <span style="color: #EA4335">E</span>
	        <span style="color: #FBBC05">J</span>
	        <span style="color: #34A853">U</span>
	        <span style="color: #4285F4">A</span>
	        <span style="color: #EA4335">L</span>
	        <span style="color: #FBBC05">O</span>
	        <span style="color: #34A853">T</span>
	      </div>
	      </a>
	      <h2>비밀번호 찾기</h2>
	      <p>아이디와 이메일을 입력하세요</p>
	      
	      <br>
	         <input type="hidden" value ="<%=prevsite%>"/>
	        <div class="inputBox">
	          <input name="id" required onkeyup="this.setAttribute('value', this.value);"  value="">
	          <label>아이디</label>
	        </div>
	        <div class="inputBox">
	          <!-- <input type="text" name="text" required onkeyup="this.setAttribute('value', this.value);" value=""> -->
	          <input name="email" required value="">
	          <label>이메일</label>
	        </div>

	    
	        <div class="bottomLine">
	       
	          <input type="button" id="lgbt" value="확인" onclick="CheckIe()">&nbsp;
	        
	        </div>
        
      </form>
    </div>
</body>