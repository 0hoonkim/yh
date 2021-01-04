<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch14.imgBean"%>

<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" /> 



<%
	request.setCharacterEncoding("UTF-8");
	String login_id = (String)session.getAttribute("idKey");
 	String id = (String)session.getAttribute("idKey");
 	
 	 int listSize=0; //현재 읽어온 게시물의 수
     int numPerPage=6; // 페이지당 레코드 수 

 	Vector<imgBean> vlist = null;
    String keyWord = "", keyField = "";

       /* if(id==null){    */      
%>
  <%-- <script>
   alert("로그인이 필요한 서비스입니다.");
   opener.location.href='signup/login.jsp';
   window.close();
  </script>
<%} %>
    --%>
<%


String splace = (String)request.getParameter("splace");
String reg = (String)session.getAttribute("reg");
String errMsg = (String)session.getAttribute("errMsg");
String comment = "";

if (errMsg != null) {
	comment = (String)request.getAttribute("comment");
} else {
	errMsg = "비밀번호를 입력해 주세요";
}

if(reg != null) {
   session.removeAttribute("reg");
   %>
   <script>
      top.window.close();
   </script>
   <%
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
        /* 초기화 코드 initialization code */
    @charset "utf-8";

    body,ol,ul,h1,h2,h3,h4,h5,h6,p,th,td,dl,dd,form,fieldset,legend,input,textarea,select{margin:0;padding:0} 
    /* body {font: 12px "Roboto", "Arial Narrow", HELVETICA; background: #fff; -webkit-text-size-adjust: 100%;}  */
    em{font-style:normal} 
    img{border:0;vertical-align:middle} 
    table{border-collapse:collapse;border-spacing:0} 
    p{word-wrap:break-word}
    * {box-sizing: border-box;}
    * { outline: none;}
    * {font-family: 'Noto Sans';}
    /* ------------------------------------ */

    body {
        background-color: #eee;
    }

    #wrapper {
        width: 90%;
        height: 80%;
        padding: 30px;
        border: 1px solid #ccc;
        background-color: #fafafa;
        margin: 0 auto;
        margin-top: 20px;
    }

    #container {
        background-color: #fff;
        padding: 20px 30px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .linebreaker {
        height: 20px;
    }

    .checked {
        color: orange;
    }

    .title {
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 25px;
    }
    
    .title span {
    	font-size: 12px;
    	color: red;
    }

    img {
        width: 40px;
        height: 40px;
    }

    input[name="id"] {
        border: none;
        font-size: 20px;
        font-weight: 600;
    }

    input[name="pass"] {
        padding-left: 10px;
        font-size: 14px;
        width: 100%;
        height: 30px;
        border: 1px solid #eee;
    }

    textarea {
        padding: 10px;
        font-size: 14px;
        width: 100%;
        height: 100px;
        resize: none;
        border: 1px solid #eee;
    }

    .wt_tb tr:first-child td {
        width: 60px;
    }

    .wt_tt tr td:nth-of-type(2){
        padding-left: 40px;
    }
    
    .wt_tt tr td:nth-of-type(2) input {
        border: none;
    }


    .wt_tb tr:nth-of-type(9) td {
        background-color: red;
    }

    .wt_bt {
        text-align: center;
    }

    .wt_bb input {
        width: 70px;
        height: 30px;
        border: 1px solid #ccc;
        border-radius: 2px;
        background-color: #eee;
    }

    .wt_bb input:hover {
        cursor: pointer;
        background-color: #E5E4E2;
    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>
    <div id="wrapper">
        <div class="title">
        
            리뷰를 남겨주세요 : <input name="place1" value="<%=splace %>">
            
            <%
            session.removeAttribute("errMsg");
            %>
        </div>
        <div id="container">
        <!-- <form name="reviewFrm" method="post" action="boardReview" enctype="multipart/form-data" > -->
        <form name="reviewFrm" method="post" action="loginCheck.jsp" >
            <table class="wt_wp">
                <tr>
                    <td >
                    <table class="wt_tb">
                    <%
                    
                    System.out.print(id);
              vlist = mMgr.checkimg(id);
                    
                    
                    
                    
              listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
              System.out.print(listSize);
              
              
              
              if (vlist.isEmpty()) {
               out.println("등록된 게시물이 없습니다.");
              } else {
                for (int i = 0;i<numPerPage; i++) {
               if (i == listSize) break;
               imgBean bean = vlist.get(i);
               String img = bean.getImg();

         %>
                        <tr>
                            <td>
                                <easy-img  class="">
                                    <img alt="" class="" src="<%=img %>" >
                                </easy-img>
                                
                            </td>
                                                             <%      
                 }//for
             }//if
          %>
                            	
                            <td ><input name="id" value="<%=login_id %>">
                            	<input type="hidden" name="img" value="abcdefg123"/>
                                <input type="hidden" name="place" value="<%=splace %>"/>
                            </td>
                        </tr>
                        
                        
                        <tr class="linebreaker"></tr>
                        <tr>
                            <!-- <td>비밀번호</td> -->
                            <td colspan="2"><input type="password" name="pass" placeholder="<%=errMsg%>"></td>
                        </tr>
                        <tr class="linebreaker"></tr>
                        <tr>
                            <!-- <td>분류</td> -->
                            <td colspan="2"><textarea name="comment" maxlength="50" ><%=comment%></textarea></td>
                        </tr>
                        <tr class="linebreaker"></tr>
                        <tr>
                            <table class="wt_tt">
                                <tr>
                                    <td>
                                        <div class="rating-container">
                                            <div class="fa fa-star star"></div>
                                            <div class="fa fa-star star"></div>
                                            <div class="fa fa-star star"></div>
                                            <div class="fa fa-star star"></div>
                                            <div class="fa fa-star star"></div>
                                        </div>
                                        <input class="rsRating" type="hidden" name="rating" value=""/>
                                    </td>
                                    <td>
                                        <!-- <input type="text" name="date" class="today"/> -->
                                        <div class="today"></div>
                                    </td>
                                </tr>
                            </table>
                        </tr>
                        <tr class="linebreaker"></tr>
                        <tr class="wt_bt">
                            <td colspan="2" class="wt_bb">
                                <input type="submit" value="등록" / >
                                <input type="reset" value="다시쓰기" />
                                <input type="button" value="닫기" onclick="javascript:top.window.close()"/>
                            </td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    <script>
        $(function(){
            $('.rating-container .star').click(function(){
                $('.rating-container .star').removeClass('checked');
                $(this).prevAll('.star').addBack().addClass('checked');

                $('.rsRating').val($('.checked').length);
            })

            var date=new Date();
            // $(".today").click(function(){
                var val=date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
                $(".today").html(val);
            // });
            
            
              

       });

        
        
		
        /* function closeIf(){
        	alert("The form was submitted");
        	setTimeout(top.window.close(),2000);
        	} */
        	
        	
        
    /*     
       function closeSelf(){
         

            if(true){
               alert("conditions satisfied, submiting the form.");
               document.forms['reviewFrm'].submit();
               window.open("about:blank", "_self").close();
               top.window.close();
            }else{
               alert("conditions not satisfied, returning to form");    
            }
        } */

    </script>
</body>

</html>