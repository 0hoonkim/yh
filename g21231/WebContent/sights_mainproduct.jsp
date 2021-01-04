<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String place = request.getParameter("place");
 String intro = request.getParameter("intro");
 String img = request.getParameter("img");
 float avg = Float.parseFloat(request.getParameter("avg"));
 int count = Integer.parseInt(request.getParameter("count"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.fa-star {
  font-size: 12px !important;
  width: 15px;
  color: #ccc;
}

.checked {
  color: orange;
}
</style>
</head>
<body>
    <div class="pt_im">
        <easy-img class="">
            <!-- <div class="" style="padding-top:56.03%"></div> -->
            <img class="" alt="" src="<%=img%>">
        </easy-img>
    </div>
    <div class="pt_dt">
        <div class="">
            <div class="pt_tt">
                <%=place %>
            </div>
        </div>
        <div class="pt_rt">
            <span class="">
                <span class=""></span>
                <span class="">
                    <span class="star_rating"><%=avg %></span>
                    <div class="">
                        <span class="strtd" style="width: 50%" >
                        </span>
                    </div>
                    <span class=""> (<%=count %>)</span>
                </span>
            </span>
        </div>
        <div class="pt_ap">
            <%=intro %>
        </div>
    </div>
<!-- </div> -->
<div class="pt_sv">
    <div>
        <div>
            <div class="">
                <span class="">
                    <svg width="48" height="48" viewBox="0 0 48 48" class="">
                        <path d="M34 6H14c-2.21 0-3.98 1.79-3.98 4L10 42l14-6 14 6V10c0-2.21-1.79-4-4-4zm0 30l-10-4.35L14 36V10h20v26z"></path>
                    </svg>
                </span>
                <span style="display: none;" class="">
                    <svg width="48" height="48" viewBox="0 0 48 48" class="">
                        <path d="M34 6H14c-2.21 0-3.98 1.79-3.98 4L10 42l14-6 14 6V10c0-2.21-1.79-4-4-4z"></path>
                    </svg>
                </span>
            </div>
        </div>
    </div>
</div>
</body>
</html>