<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, ch14.FindPwdBean"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<jsp:useBean id="dbMkr" class = "ch10.cd" />

<%
   request.setCharacterEncoding("UTF-8");
   String email = request.getParameter("email");
   String id = request.getParameter("id");

   String msg = "이메일 또는 아이디가 다릅니다";
   String mpwd = "";
   String pwd = "";
   
   Vector<FindPwdBean> plist = null;
   plist = mMgr.findPwd(id,email);
      
   if(plist.size() > 0){
   FindPwdBean bean = plist.get(0);
   pwd = bean.getPwd(); 

   mpwd = dbMkr.getPass();
   mMgr.updateBoardPwd(id, mpwd);

   msg = "등록된 이메일로 임시 비밀번호가 발송되었습니다." +
   "임시 비밀번호로 로그인 해주세요."; 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body id="">
   <div class="mailingForm" style="visibility: hidden;">
      <form action="SendMail01.jsp" method="post" name="mailForm">
          <table >
              <tr><th colspan="2">JSP 메일 보내기</th></tr>
              <tr><td>from</td><td><input type="text" name="from" value="sjyj1827@gmail.com" /></td></tr>
              <tr><td>to</td><td><input type="text" name="to" value="<%=email %>" /></td></tr>
              <tr><td>subject</td><td><input type="text" name="subject" value="<제주얼랏>임시비밀번호 입니다."/></td></tr>
              <tr>
                 <td>content</td>
                    <td>
                      <textarea name="content" style="width:170px; height:200px;">
                      안녕하세요 <%=id%>회원님. 회원님의 임시 비밀번호는 [<%=mpwd %>]입니다.
                      로그인을 완료하신뒤 비밀번호를 변경해 주세요.      
                      </textarea>
                  </td>
              </tr>
              <tr><td colspan="2" style="text-align:right;"></td></tr>
           </table>
       </form>
   </div>

<script>
   alert("<%=msg%>"); 
    document.mailForm.submit();
</script>

</body>
<%}else{ %>
<script>
alert("<%=msg%>"); 
window.location.href="login.jsp";
</script>
<%} %>
</html>