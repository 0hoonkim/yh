<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     
<%
     request.setCharacterEncoding("EUC-KR");
     String id = (String)session.getAttribute("idKey");
     
     String log_status;
        if(id != null) {
           log_status="로그아웃";
        }else {
           log_status="로그인";
        }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

/* 헤더 */
#header {
  width: 100%;
  height: 60px;
  position: fixed;
  background-color: #fff;
  padding-top: 12px;
  top: 0;
  z-index: 9999;
}

#header > div {
  vertical-align: middle;
}

.hd_b1 {
  display: inline-block;
  margin-left: 30px;
}

.hd_b2 {
  display: inline-block;
  float: right;
  margin-right: 20px;
}

.hd_b1 > div {
  vertical-align: middle;
}

.hd_b2 > div {
  vertical-align: middle;
}

.hd_c1, .hd_c2 {
  display: inline-block;
}

.hd_c2 {
  margin-left: 20px;
}

.hd_c1 svg {
  width: 24px;
  height: 24px;
}

.hd_c2 p {
  font-size: 23px;
  font-weight: bold;
}

.hd_c3, .hd_c4, .hd_c4-1 {
  display: inline-block;
}

.hd_c3 {
  margin-right: 20px;
}

.hd_c3 svg {
  width: 24px;
  height: 24px;
}

.hd_c4 img {
  border-radius: 50px;
}

.hd_c4-1 {
margin: 1px 20px 0 0;
}

.hd_c4-1 span {
font-weight: bold;
}

/* ------------------------------------ */


</style>
</head>
<body>
<div class="hd_b1">
            
            <!-- 버거메뉴 -->
            <!-- <div class="hd_c1">
                <svg focusable="false" viewBox="0 0 24 24">
                    <path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path>
                </svg>
            </div> -->

            <!-- <div class="gb_yc gb_Cc gb_Fa" aria-label="Close" role="button" tabindex="0">
                <svg viewBox="0 0 24 24">
                    <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                </svg>
            </div> -->

            <!-- 사이트로고 -->
            <div class="hd_c2">
                <a class="" href="../index_2.jsp">
                    <p>JEJUALOT</p>
                </a>
            </div>
        </div>

        <div class="hd_b2">
            <!-- 헤더 오른쪽 로그인 -->
           
           <% if(id == null) {
                 %>
            <div class="hd_c4">
                <a class="" href="../signup/login.jsp">
                    <!-- <img class="" src="https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s32-c-mo" srcset="https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s32-c-mo 1x, https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s64-c-mo 2x " alt="" aria-hidden="true" data-noaft=""> -->
                    <%=log_status%>
                </a>
            </div>
            
            <% }else {%>
            <div class="hd_c4-1">
            	<p><span><%=id %></span>님 로그인 되었습니다.</p>
            </div>
            <div class="hd_c4">
                <a class="" href="../signup/logout.jsp">
                    <!-- <img class="" src="https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s32-c-mo" srcset="https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s32-c-mo 1x, https://lh3.googleusercontent.com/ogw/ADGmqu-VCEuI2yv0sSZS3OOMMnzH2FZd8hxmH7_aisAu=s64-c-mo 2x " alt="" aria-hidden="true" data-noaft=""> -->
                   <%=log_status%>
                </a>
            </div>
            
            <% }%>
            <!-- 헤더 오른쪽 개인정보 이미지 -->
            
            <div class="hd_c3">
                <a class="" href="#">
               <% if(id != null) {
                 %>
                 
                 
                   <svg id="레이어_1" data-name="레이어 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 550 550"><defs><style>.cls-1{fill:#fff;}.cls-2{fill:#626567;}.cls-2,.cls-3{stroke:#626567;stroke-miterlimit:10;stroke-width:33px;}.cls-3{fill:none;}</style></defs><circle class="cls-1" cx="246.5" cy="246.5" r="230"/><circle class="cls-2" cx="246.5" cy="190.5" r="75.94"/><circle class="cls-3" cx="246.5" cy="246.5" r="230"/><circle class="cls-3" cx="246.5" cy="246.5" r="230"/><path class="cls-2" d="M93.09,410.91s38.67-69.05,111-69.05c0,0,59.07,22.66,116,0,0,0,57.76-2.21,111,69.05C431,410.91,270.22,582.36,93.09,410.91Z" transform="translate(-15.55 -10.61)"/></svg>
                   
                 
              <% }else {%>
                <svg id="레이어_1" data-name="레이어 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 550 550"><defs><style>.cls-1,.cls-2{fill:none;stroke-miterlimit:10;stroke-width:33px;}.cls-1{stroke:#626567;}.cls-2{stroke:#626567;}</style></defs><circle class="cls-1" cx="246.5" cy="190.5" r="75.94"/><circle class="cls-2" cx="246.5" cy="246.5" r="230"/><circle class="cls-2" cx="246.5" cy="246.5" r="230"/><path class="cls-1" d="M93.09,410.91s38.67-69.05,111-69.05c0,0,59.07,22.66,116,0,0,0,57.76-2.21,111,69.05C431,410.91,270.22,582.36,93.09,410.91Z" transform="translate(-15.55 -10.61)"/></svg>
                   
              <% }%>
                   
                    <!-- <svg id="레이어_1" data-name="레이어 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 550 550"><defs><style>.cls-1{fill:#fff;}.cls-2{fill:#626567;}.cls-2,.cls-3{stroke:#626567;stroke-miterlimit:10;stroke-width:33px;}.cls-3{fill:none;}</style></defs><circle class="cls-1" cx="246.5" cy="246.5" r="230"/><circle class="cls-2" cx="246.5" cy="190.5" r="75.94"/><circle class="cls-3" cx="246.5" cy="246.5" r="230"/><circle class="cls-3" cx="246.5" cy="246.5" r="230"/><path class="cls-2" d="M93.09,410.91s38.67-69.05,111-69.05c0,0,59.07,22.66,116,0,0,0,57.76-2.21,111,69.05C431,410.91,270.22,582.36,93.09,410.91Z" transform="translate(-15.55 -10.61)"/></svg> -->
                </a>
            </div>
        </div>
</body>
</html>