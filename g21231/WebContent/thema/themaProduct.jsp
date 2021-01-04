<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int num = Integer.parseInt(request.getParameter("num"));
 String img = request.getParameter("img");
 String title = request.getParameter("title");
 int count = Integer.parseInt(request.getParameter("count"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

                    <a href="../thema_sub/thema_sub.jsp?snum=<%=num%>">
                        
                            <!-- <div class="">
                                <div class="">
                                    <div class=""> -->
                                        <div class="pt_im">
                                            <easy-img class="">
                                                <!-- <div class="" style="padding-top:56.03%"></div> -->
                                                <img class="" alt="" src="<%=img%>">
                                            </easy-img>
                                        </div>
                                        <div class="pt_dt">
                                            <div class="">
                                                <div class="pt_tt">
                                                <%=title%>
                                                </div>
                                            </div>
                                            <div class="pt_rt">
                                                <span class="">
                                                    <span class=""></span>
                                                    <span class="">
                                                        <span class=""><i class="far fa-hand-point-up fa-lg"></i></i></span>
                                                        <div class="">
                                                            <span class="">
                                                                <%=count %>
                                                            </span>
                                                            <!-- <span class="" style="width: 88.30531199999999%">
                                                                <span class=""></span>
                                                                <span class=""></span>
                                                                <span class=""></span>
                                                                <span class=""></span>
                                                                <span class=""></span>
                                                            </span> -->
                                                        </div>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    <!-- </div> -->
                                   <%--  <form><input type="hidden" name="snum" value="<%=num%>"/></form> --%>
                                    
                                    
                                <!-- </div>
                            </div> -->
                            </a>
                       
                        
                        
</body>
</html>