<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ch15.BoardBeanThemaSub"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ch15.BoardMgr" />
<%   
     request.setCharacterEncoding("UTF-8");
     String snum = request.getParameter("snum");
      int totalRecord=0; //전체레코드수
     int numPerPage=10; // 페이지당 레코드 수 
     
     int start=0; //디비의 select 시작번호
     int end=10; //시작번호로 부터 가져올 select 갯수
     
     int listSize=0; //현재 읽어온 게시물의 수

   String keyWord = "", keyField = "";
   Vector<BoardBeanThemaSub> vlist = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <title>Document</title> -->
    <title>Things to do</title>

        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="thema_sub.css" rel="stylesheet" type="text/css">
        <!--<link href="https://g2project.github.io/main/index.css" rel="stylesheet" type="text/css">-->

        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- <script src="index.js" type="text/javascript"></script> -->
        <!-- <script src="https://g2project.github.io/main/index.js" type="text/javascript"></script> -->
</head>
<body id="">
        
    <!-- 헤더시작 -->
    <header class="" id="header">
     <jsp:include page="../sights_header2.jsp"></jsp:include>
    </header>

    <!-- <div class="wrapper"> -->
       <!-- 왼쪽사이드바 프레임 -->
       <div id="sb">
        <nav class="">

            <!-- 왼쪽사이드바 로고5개 중 1번 여행 -->
            <div>
                <a class="sb_it sb_i1" href="../trip/trip.jsp">
                    <button class="sb_btn" >
                        <div class=""></div>
                        <span class="">
                            <!-- 왼쪽사이드바 로고5개 중 1번 여행 아이콘 -->
                            <svg viewBox="0 0 24 24" class="sb_svg">
                                <path d="M13.97 5.34c.01-.11.03-.22.03-.34 0-1.1-.9-2-2-2s-2 .9-2 2c0 .12.02.23.03.34A5.997 5.997 0 0 0 6 11v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2v-8c0-2.62-1.69-4.85-4.03-5.66zM12 4c.55 0 1 .45 1 1 0 .03-.01.06-.02.09-.32-.06-.64-.09-.98-.09s-.66.03-.98.09C11.01 5.06 11 5.03 11 5c0-.55.45-1 1-1zm3 14H9v-1.5h6V18zm-2.06-6.06L12 14l-.94-2.06L9 11l2.06-.94L12 8l.94 2.06L15 11l-2.06.94z"></path>
                            </svg>
                            <!-- 왼쪽사이드바 로고5개 중 1번 여행 아이콘 밑 제목 Trips -->
                        </span>
                        <div class="">
                            <span>
                                여행
                                <div class=""></div>
                            </span>
                        </div>
                    </button>
                </a>
            </div>

            <!-- 왼쪽사이드바 로고5개 중 2번 Things to do -->
            <div>
                <a class="sb_it sb_i2" href="../sights_script.jsp">
                    <button class="sb_btn">
                        <div class=""></div>
                        <!-- 왼쪽사이드바 로고5개 중 2번 Things to do 아이콘 -->
                        <svg viewBox="0 0 612 612" class="sb_svg">
                            <circle cx="256" cy="277.333" r="106.667"/>
                            <path d="M469.333,106.667h-67.656c-8.552,0-16.583-3.333-22.635-9.375l-39-39c-10.073-10.073-23.469-15.625-37.719-15.625     h-92.646c-14.25,0-27.646,5.552-37.719,15.625l-39,39c-6.052,6.042-14.083,9.375-22.635,9.375H42.667     C19.135,106.667,0,125.802,0,149.333v277.333c0,23.531,19.135,42.667,42.667,42.667h426.667     c23.531,0,42.667-19.135,42.667-42.667V149.333C512,125.802,492.865,106.667,469.333,106.667z M256,405.333     c-70.583,0-128-57.417-128-128s57.417-128,128-128s128,57.417,128,128S326.583,405.333,256,405.333z M426.667,213.333     c-11.76,0-21.333-9.573-21.333-21.333s9.573-21.333,21.333-21.333S448,180.24,448,192S438.427,213.333,426.667,213.333z"/>
                        </svg>
                        <!-- 왼쪽사이드바 로고5개 중 2번 아이콘 밑 제목 Things to do -->
                        <div class="">
                            <span>
                                명소
                                <div class=""></div>
                            </span>
                        </div>
                    </button>
                </a>
            </div>
            
            <!-- 왼쪽사이드바 로고5개 중 3번 Flight -->
            <div>
                <a class="sb_it sb_i3" href="../food/food.jsp">
                    <button class="sb_btn">
                        <div class=""></div>
                        <svg viewBox="0 0 30 30" class="sb_svg">
                            <path d="M3.674,24.876c0,0-0.024,0.604,0.566,0.604c0.734,0,6.811-0.008,6.811-0.008l0.01-5.581   c0,0-0.096-0.92,0.797-0.92h2.826c1.056,0,0.991,0.92,0.991,0.92l-0.012,5.563c0,0,5.762,0,6.667,0   c0.749,0,0.715-0.752,0.715-0.752V14.413l-9.396-8.358l-9.975,8.358C3.674,14.413,3.674,24.876,3.674,24.876z"/>
                            <path d="M0,13.635c0,0,0.847,1.561,2.694,0l11.038-9.338l10.349,9.28c2.138,1.542,2.939,0,2.939,0   L13.732,1.54L0,13.635z"/>
                            <polygon points="23.83,4.275 21.168,4.275 21.179,7.503 23.83,9.752  "/>
                        </svg>
                        <div class="">
                            <span jsname="iSelEd">
                                음식
                                <div class=""></div>
                            </span>
                        </div>
                    </button>
                </a>
            </div>

            <!-- 왼쪽사이드바 로고5개 중 4번 Flights -->
            <div>
                <a class="sb_it sb_i4" href="../safetrip/safetrip.jsp">
                    <button class="sb_btn">


                        <div class=""></div>
                        <!-- 왼쪽사이드바 로고5개 중 3번 Flights 아이콘 -->
                        <svg viewBox="0 0 512 512" class="sb_svg">
                            <path d="M373.032,223.322h-24.21V34.133h16.212c9.425,0,17.067-7.641,17.067-17.067S374.46,0,365.034,0H146.966
                            c-9.425,0-17.067,7.641-17.067,17.067s7.641,17.067,17.067,17.067h16.212v189.189h-24.21c-21.958,0-39.822,17.864-39.822,39.822
                            v177.812c0,21.958,17.864,39.822,39.822,39.822h10.812v14.155c0,9.425,7.641,17.067,17.067,17.067s17.067-7.641,17.067-17.067
                            v-14.155h144.172v14.155c0,9.425,7.641,17.067,17.067,17.067s17.067-7.641,17.067-17.067v-14.155h10.812
                            c21.958,0,39.822-17.864,39.822-39.822V263.144C412.854,241.186,394.99,223.322,373.032,223.322z M197.311,34.133h117.378v189.189
                            H197.311V34.133z M331.756,400.548H180.244c-9.425,0-17.067-7.641-17.067-17.067s7.641-17.067,17.067-17.067h151.511
                            c9.425,0,17.067,7.641,17.067,17.067S341.181,400.548,331.756,400.548z M331.756,337.686H180.244
                            c-9.425,0-17.067-7.641-17.067-17.067s7.641-17.067,17.067-17.067h151.511c9.425,0,17.067,7.641,17.067,17.067
                            S341.181,337.686,331.756,337.686z"/>
                        </svg>
                        <!-- 왼쪽사이드바 로고5개 중 3번 아이콘 밑 제목 Flights -->
                        <div class="">
                            <span>
                                여행가이드
                                <div class=""></div>
                            </span>
                        </div>
                    </button>
                </a>
            </div>

            <!-- 왼쪽사이드바 로고5개 중 5번 Hotels -->
            <div>
                <a class="sb_it sb_i5" href="../qna.jsp">
                    <button class="sb_btn">
                        <div class=""></div>
                        <!-- 왼쪽사이드바 로고5개 중 4번 아이콘 -->
                        <svg viewBox="0 0 24 24" class="sb_svg">
                            <path d="M12.0224 13.9993C11.3753 15.0098 11.0001 16.2111 11.0001 17.5C11.0001 19.1303 11.6003 20.6205 12.5919 21.7615C11.7963 
                            21.9216 10.9314 22.0011 10.0001 22.0011C6.57915 22.0011 4.05619 20.9289 2.51403 18.7646C2.18207 18.2987 2.00366 17.7409 2.00366 
                            17.1688V16.2488C2.00366 15.0068 3.01052 13.9999 4.25254 13.9999L12.0224 13.9993ZM17.5001 12C20.5377 12 23.0001 14.4624 23.0001 
                            17.5C23.0001 20.5376 20.5377 23 17.5001 23C14.4626 23 12.0001 20.5376 12.0001 17.5C12.0001 14.4624 14.4626 12 17.5001 12ZM17.5001 
                            19.751C17.1552 19.751 16.8756 20.0306 16.8756 20.3755C16.8756 20.7204 17.1552 21 17.5001 21C17.845 21 18.1246 20.7204 18.1246 
                            20.3755C18.1246 20.0306 17.845 19.751 17.5001 19.751ZM17.5002 13.8741C16.4522 13.8741 15.6359 14.6915 15.6468 15.8284C15.6494 
                            16.1045 15.8754 16.3262 16.1516 16.3236C16.4277 16.3209 16.6494 16.0949 16.6467 15.8188C16.6412 15.2398 17.0064 14.8741 17.5002 
                            14.8741C17.9725 14.8741 18.3536 15.266 18.3536 15.8236C18.3536 16.0158 18.2983 16.1659 18.1296 16.3851L18.0356 16.501L17.9366 
                            16.6142L17.6712 16.9043L17.5348 17.0615C17.1515 17.5182 17.0002 17.854 17.0002 18.3716C17.0002 18.6477 17.224 18.8716 17.5002 
                            18.8716C17.7763 18.8716 18.0002 18.6477 18.0002 18.3716C18.0002 18.1684 18.0587 18.0126 18.239 17.7813L18.3239 17.6772L18.4249 
                            17.5618L18.6906 17.2713L18.8252 17.1162C19.2035 16.6654 19.3536 16.333 19.3536 15.8236C19.3536 14.7199 18.5312 13.8741 17.5002 
                            13.8741ZM10.0001 2.00464C12.7615 2.00464 15.0001 4.24321 15.0001 7.00464C15.0001 9.76606 12.7615 12.0046 10.0001 12.0046C7.2387 
                            12.0046 5.00012 9.76606 5.00012 7.00464C5.00012 4.24321 7.2387 2.00464 10.0001 2.00464Z"/>
                        </svg>
                        <!-- 왼쪽사이드바 로고5개 중 3번 아이콘 밑 제목 Flights -->
                        <div class="">
                            <span>
                                Q&A
                                <div class=""></div>
                            </span>
                        </div>
                    </button>
                </a>
            </div>

             
        </nav>
    </div>
    <!-- 왼쪽사이드바 로고 5개 끝 -->

        <!-- 가운데 전체 프레임 -->
        <div id="center">

            <!-- 지도 프레임 -->
            <div id="mp_wp">
                <!-- <div> -->
                    <!-- <div id="map">
                        지도정보 표시 부분
                    </div> -->
                <!-- </div> -->
            </div>

            <!-- 맨 위 메인 -->
            <div class="main_1">
                <!-- 메인 배너 시작 -->
                <div class="main">
                        <img src="https://github.com/g2project/main/blob/main/thema/image/jeju2.PNG?raw=true" width="1200" height="300">
                    <span class="travel">
                        <h1>제주도에 가면</h1>
                    </span>
                </div>
                <!-- 메인 배너 끝 -->

                <!--메인 네비 시작-->
                <div class="nv">
                    <span class="nv_s">
                        <span class="h_1" style="color: #c9c9c9;">
                            <i class="fas fa-home fa-2x"></i>
                        </span>
                        <div class="p_1">
                            <p><a href="https://g2project.github.io/main/trip/trip.html" id="navi">제주도에가면</a>
                                 &nbsp 〉&nbsp <a href="https://g2project.github.io/main/thema/thema_list_1.html">테마여행</a>
                                  &nbsp 〉&nbsp 
                                  <a href="#"><span style="font-weight: bold;">제주의 즐겁고 달콤한 겨울 박물관들</span></a></p>
                        </div>
                    </span>
                </div>
                <!--메인 네비 끝-->
            </div>
            <!-- 맨 위 메인 끝-->

            <!-- Suggested day plans -->

            <%
           vlist = bMgr.getBoardThemaSub(keyField, keyWord, start, end);
           listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
           if (vlist.isEmpty()) {
            out.println("등록된 게시물이 없습니다.");
           } else {
             /* for (int i = 0;i<numPerPage; i++) {
            if (i == listSize) break; */
            BoardBeanThemaSub bean = vlist.get(Integer.parseInt(snum)-1);
            String title = bean.getTitle();
            String img_1 = bean.getImg_1();
            String img_2 = bean.getImg_2();
            String img_3 = bean.getImg_3();
            String place_1 = bean.getPlace_1();
            String place_2 = bean.getPlace_2();
            String place_3 = bean.getPlace_3();
            String content_1 = bean.getContent_1();
            String content_2 = bean.getContent_2();
            String content_3 = bean.getContent_3();
            String content_4 = bean.getContent_4();
            String content_5 = bean.getContent_5();
            String content_6 = bean.getContent_6();
            String content_7 = bean.getContent_7();
            String map_lat_1 = bean.getMap_lat_1();
            String map_lon_1 = bean.getMap_lon_1();
            String map_lat_2 = bean.getMap_lat_2();
            String map_lon_2 = bean.getMap_lon_2();
            String map_lat_3 = bean.getMap_lat_3();
            String map_lon_3 = bean.getMap_lon_3();
               
            %>
               
            <jsp:include page="thema_sub_sub.jsp">
               <jsp:param value="<%=title %>" name="title"/>
               <jsp:param value="<%=img_1 %>" name="img_1"/>
               <jsp:param value="<%=img_2 %>" name="img_2"/>
               <jsp:param value="<%=img_3 %>" name="img_3"/>
               <jsp:param value="<%=place_1 %>" name="place_1"/>
               <jsp:param value="<%=place_2 %>" name="place_2"/>
               <jsp:param value="<%=place_3 %>" name="place_3"/>
               <jsp:param value="<%=content_1 %>" name="content_1"/>
               <jsp:param value="<%=content_2 %>" name="content_2"/>
               <jsp:param value="<%=content_3 %>" name="content_3"/>
               <jsp:param value="<%=content_4 %>" name="content_4"/>
               <jsp:param value="<%=content_5 %>" name="content_5"/>
               <jsp:param value="<%=content_6 %>" name="content_6"/>
               <jsp:param value="<%=content_7 %>" name="content_7"/>
               <jsp:param value="<%=map_lat_1 %>" name="map_lat_1"/>
               <jsp:param value="<%=map_lon_1 %>" name="map_lon_1"/>
               <jsp:param value="<%=map_lat_2 %>" name="map_lat_2"/>
               <jsp:param value="<%=map_lon_2 %>" name="map_lon_2"/>
               <jsp:param value="<%=map_lat_3 %>" name="map_lat_3"/>
               <jsp:param value="<%=map_lon_3 %>" name="map_lon_3"/>
            </jsp:include>

         <%      
                 //}//for
             }//if
          %>
          

            <hr>
            
            <div class="mailingsub">
            <div>
                <button class="" onclick="mailingsub()">
                    <span class="" type="">
                        <svg width="50" height="50" viewBox="0 0 1300 1300">
                            <path d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path>
                        </svg>
                    </span>
                    <span class="">메일링</span>
                </button>
            </div>
        </div>
        <div class="mailingForm" style="visibility:hidden">
          <form action="mailingsub.jsp" method="post" name="mailForm">
              <table >
                  <tr><th colspan="2">JSP 메일 보내기</th></tr>
                  <tr><td>from</td><td><input type="text" name="from" value="yjjy13@naver.com" /></td></tr>
                  <tr><td>to</td><td><input type="text" name="to" value="jjuujjoo0717@gmail.comm" /></td></tr>
                  <tr><td>subject</td><td><input type="text" name="subject" value="<제주얼랏>New Letter"/></td></tr>
                  <tr>
                     <td>content</td>
                     <td>
                    <textarea name="content" style="width:170px; height:200px;">
                      <jsp:include page="included.jsp" />       
                    </textarea>
                </td>
            </tr>
                  <!-- <tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr> -->
                  <tr><td colspan="2" style="text-align:right;"></td></tr>
              </table>
          </form>
      </div>  
      
      
      
      <div class="up_bt">
      	<a href = "#navi">
            <div>
                <button class="" onclick="">
                    <span class="" type="">
                        <svg width="50" height="50" viewBox="0 0 1300 1300">
                            <path d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path>
                        </svg>
                    </span>
                    <span class="">맨위로</span>
                </button>
            </div>
           </a>
        </div>
        
            

            <!-- 푸터 프레임 -->
            <footer class="ft_wp">
                <div class="ft_lf">
                    <p>(63122) 제주특별자치도 제주시 선덕로 23(연동) TopSights </p>
                    <p>관광문의 : 제주관광공사 Tel : 064-740-6000~1FAX : 064-740-6090 사업자등록번호 : 123-45-67899</p>
                    <p>관광불편신고 : 제주안내 120콜센터(국번없이 120번)</p><br>
                    <p>Copyright©Jeju Tourism Organization, All rights reserved.</p><br>
                    <p>홈페이지에 게시된 이메일 주소가 자동수집되는 것을 거부하며, 위반시 정보통신망법에 의해 처벌될 수 있습니다.</p>
                </div>
                
                
                <!-- 푸터 내부 둘째줄 -->
                <div class="ft_ls">
                    <p class="">Content written by Google unless otherwise noted</p>
                </div>
            </footer>
        </div>  
                            
        
    <!-- </div> -->


    <script>
    var s1 = document.getElementsByClassName("latlng")[0].value;
    var v1 = document.getElementsByClassName("latlng")[1].value;
    var s2 = document.getElementsByClassName("latlng")[2].value;
    var v2 = document.getElementsByClassName("latlng")[3].value;
    var s3 = document.getElementsByClassName("latlng")[4].value;
    var v3 = document.getElementsByClassName("latlng")[5].value;
    
    const locations = [
    { lat: s1, lng: v1 },
    { lat: s2, lng: v2 },
    { lat: s3, lng: v3 }
    ];
   
    const flightPlanCoordinates = [
    { lat: parseFloat(s1), lng: parseFloat(v1) },
    { lat: parseFloat(s2), lng: parseFloat(v2) },
    { lat: parseFloat(s3), lng: parseFloat(v3) }
    ];
    
    const place = ["place_1", "place_2", "place_3"];
    
    let map;

    function initMap() {

        var styleArray = [
            {
                featureType: 'all',
                stylers:[
                    {saturation: -80}
                ]
            },
            {
                featureType: 'foad.arterial',
                elementType: 'gemetry',
                stylers:[
                    {hue: '#00ffee'},
                    {saturation: -50}
                ]
            },
            {
                featureType: 'poi.business',
                elementType: 'labels',
                stylers:[
                    {visibility: 'off'}
                ]
            }
        ];

    var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    // center: new google.maps.LatLng( 37.568813, 126.987211)
    center: new google.maps.LatLng( 33.364102200770986, 126.5288231516102),
    mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    const labels = "123456789";
    let labelIndex = 0;

    /* for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
        label: labels[labelIndex++ % labels.length],
        map: map
    });

    } */
    
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 10,
        center: new google.maps.LatLng( 33.364102200770986, 126.5288231516102),
        mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker = {};
        var i;

            marker[0] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[0].lat, locations[0].lng),
                map: map
            });
            marker[1] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[1].lat, locations[1].lng),
                map: map
            });
            marker[2] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[2].lat, locations[2].lng),
                map: map
            });

           
            document.getElementById(place[0]).addEventListener('click', function(){
                    marker[0].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[0].setAnimation(null);}, 1000);
                })
                document.getElementById(place[1]).addEventListener('click', function(){
                    marker[1].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[1].setAnimation(null);}, 1000);
                })
                document.getElementById(place[2]).addEventListener('click', function(){
                    marker[2].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[2].setAnimation(null);}, 1000);
                })

                

            for (var i=0; i<3;i++){
                google.maps.event.addListener(marker[i], 'click', function() {
                
                var z = map.getZoom()
                map.panTo(this.getPosition());
                if(z<14) {
                    map.setZoom(14);
                } else {
                    var cnt = new google.maps.LatLng(33.364102200770986, 126.5288231516102);
                    map.panTo(cnt);
                    map.setZoom(10);
                }

            });
            }

    const flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        geodesic: true,
        strokeColor: "#EE2C2C",
        strokeOpacity: 0.3,
        strokeWeight: 4,
    });
    flightPath.setMap(map);

    }
    
    function mailingsub() {
        if(confirm("메일링 서비스를 신청하시겠습니까?")) {
           document.mailForm.submit();
           alert("현재 페이지를 등록된 메일로 전송하였습니다.");
        }
     }

    // const locations = [
    // { pln: '명동성당', lat: 37.563390, lng: 126.987425 },
    // { pln: '남산N타워',lat: 37.551442, lng: 126.988162 },
    // { pln: '경복궁',lat: 37.579983, lng: 126.977073 },
    // { pln: '종묘',lat: 37.575341, lng: 126.994196 },
    // { pln: '남대문',lat: 37.563381, lng: 126.987339 },
    // { pln: '청계천',lat: 37.569246, lng: 126.978691 },
    // { pln: '강남역',lat: 37.498146, lng: 127.027680 },
    // { pln: '롯데월드',lat: 37.511450, lng: 127.098269 },
    // { pln: '북촌한옥마을',lat: 37.582569, lng: 126.983621 },
    // { pln: '인사동쌈지길', lat: 37.574471, lng: 126.984956 },
    // { pln: '봉은사', lat: 37.515014, lng: 127.057312 },
    // ];
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIpqxghuqNb8gdkUV2yupr6PLdcvOEG_k&callback=initMap"></script>

</body>
</html>