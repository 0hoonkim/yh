<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
	  
	  String prevsite = (String)session.getAttribute("prevsite");
%>
<html>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="login.css">


<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}

		document.loginFrm.submit();
	}
</script>

</head>
<body>
	<form name="loginFrm" method="post" action="loginProc.jsp">
	    <div class="box">
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
	      <h2>로그인</h2>
	      <br>
	         <input type="hidden" value ="<%=prevsite%>"/>
	        <div class="inputBox">
	          <input name="id" required onkeyup="this.setAttribute('value', this.value);"  value="">
	          <label>ID</label>
	        </div>
	        <div class="inputBox">
	          <!-- <input type="text" name="text" required onkeyup="this.setAttribute('value', this.value);" value=""> -->
	          <input type="password" name="pwd" required value="">
	          <label>PASSWARD</label>
	        </div>
	        <div class="forgetPassword">
	          <span>패스워드를 잊으셨나요?</span>
	        </div>
	        <div class="alert">
	          <span>아직 JEJUALOT의 회원이 아니신가요? 지금 바로 회원가입 해보세요</span>
	        </div>
	        <div class="bottomLine">
	          <div class="createAccount"><a href="member.jsp">회원가입</a></div>
	          <input type="button" id="lgbt" value="로그인" onclick="loginCheck()">&nbsp;
	          <input type="hidden" name="hide" value="<%=prevsite%>">
	        </div>
        
      </form>
    </div>
</body>
</html>