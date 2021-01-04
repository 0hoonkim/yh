<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ch15.BoardBeanProduct, ch15.BoardBeanScript, ch15.BoardBeanReview,
ch15.BoardBeanFavCount"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ch15.BoardMgr" />

<%	
	  request.setCharacterEncoding("UTF-8");

      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  
	  int start=0; //디비의 select 시작번호
	  int end=10; //시작번호로 부터 가져올 select 갯수
	  
	  int listSize=0; 

	String keyWord = "", keyField = "";
	Vector<BoardBeanProduct> vlist = null;
	Vector<BoardBeanScript> slist =null;
	Vector<BoardBeanFavCount> flist = null;
%>

<%
	String login_status = (String)session.getAttribute("idKey");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- <title>Document</title> -->
	<title>Things to do</title>
	    <!-- <style>.gm-control-active>img{box-sizing:content-box;display:none;left:50%;pointer-events:none;position:absolute;top:50%;transform:translate(-50%,-50%)}.gm-control-active>img:nth-child(1){display:block}.gm-control-active:hover>img:nth-child(1),.gm-control-active:active>img:nth-child(1){display:none}.gm-control-active:hover>img:nth-child(2),.gm-control-active:active>img:nth-child(3){display:block}
	</style> -->
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
	<!-- <link href="index.css" rel="stylesheet" type="text/css"> -->
	<link href="sights_script.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script src="index.js" type="text/javascript"></script> -->
	<script src="index.js" type="text/javascript" ></script>
	
	
	<script src="./js/vendor/modernizr.custom.min.js"></script>
    <script src="./js/vendor/jquery-1.10.2.min.js"></script>
    <script src="./js/vendor/jquery-ui-1.10.3.custom.min.js"></script>
   	<script src="js/script.js"></script>
   	
   	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    
 
</head>
<body id="">
        
    <header class="" id="header">
     <jsp:include page="sights_header.jsp"></jsp:include>
    </header>

    <!-- <div class="wrapper"> -->
       <!-- 왼쪽사이드바 프레임 -->
       <div id="sb">
        <nav class="">

            <!-- 왼쪽사이드바 로고5개 중 1번 여행 -->
            <div>
                <a class="sb_it sb_i1" href="trip/trip.jsp">
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
                <a class="sb_it sb_i2" href="sights_script.jsp">
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
                <a class="sb_it sb_i3" href="food/food.jsp">
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
                <a class="sb_it sb_i4" href="safetrip/safetrip.jsp">
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
                <a class="sb_it sb_i5" href="qna.jsp">
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

            <!-- 검색창+세이브드 프레임 -->
            <div class="ct_ss">
  

                <!-- saved파트 -->
                <a href="https://g2project.github.io/main/save_page/save_page.html" class="ct_at"><div class="ct_dv ct_sv">
                    <button class="">
                        <!-- 세이브드 둥근 테두리 실제 -->
                                <span>
                                    <!-- 세이브드 로고 -->
                                    <svg class="" viewBox="0 0 30 30">
                                        <path d="M15 7v12.97l-4.21-1.81-.79-.34-.79.34L5 19.97V7h10m0-2H5c-1.1 0-2 .9-2 2v16l7-3 7 3V7c0-1.1-.9-2-2-2zm4 15h2V3c0-1.1-.9-2-2-2H6v2h13v17z"></path>
                                        <!-- <path d="M0 0h24v24H0V0z" fill="none"></path> -->
                                    </svg>
                                </span>
                                <!-- 세이브드 텍스트 -->
                                <span class="">
                                    Saved
                                </span>
                    </button>
                </div>
                </a>
            </div>


    
            <!-- 가운데 검색창 아래 배너 -->
            <div class="ct_bn">                       
                <img class="R1Ybne YH2pd" alt="" src="https://github.com/g2project/main/blob/main/sights/images/h_1.JPG?raw=true">
                <!-- 큰제목 배너틀 안쪽 Seoul 틀 -->
                <span class="">
                    <h1 class="">제주시</h1>
                    <p class="">민속 박물관, 난타 극장, 해수 사우나가 있는 대한민국 제주도의 행정 수도</p>
                </span>
            </div>

            <!-- 가운데 배너 아래 Top sights -->
            <div class="ct_p1">
                <!-- Top sights -->
                <div class="">
                    <h1 class="">
                        제주 주요 명소 
                    </h1>
                </div>
                <h5 class="">
                    Based on traveller visits and local insights
                </h5>
            </div>
            
            
            <!-- Top sights 상품 -->
            <div class="ts_wp">
            <input id="login_status" type="hidden" name="login_status" value="<%=login_status %>" /> 
                <%
				  vlist = bMgr.getBoardListProduct(keyField, keyWord, start, end);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
				  if (vlist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
				    for (int i = 0;i<numPerPage; i++) {
					if (i == listSize) break;
					BoardBeanProduct bean = vlist.get(i);
					int num = bean.getNum();
					String place = bean.getPlace();
					String img = bean.getImg();
					String intro = bean.getIntro();
					
					float avg = 0f;
					int count = 0;
					flist = bMgr.getBoardListFavCount(place);
					if (!flist.isEmpty()) {
					BoardBeanFavCount fBean = flist.get(0);
					avg = fBean.getAvg();
					count = fBean.getCount();
					}
					
					String id = "prdt" + num;
				%>
					<div class="ts_pt bx_hs pt_qs_al" id="<%=id%>" onclick='create_script("<%=place%>")'>
						<jsp:include page="sights_mainproduct.jsp">
							<jsp:param value="<%=place %>" name="place"/>
							<jsp:param value="<%=intro %>" name="intro"/>
							<jsp:param value="<%=img %>" name="img"/>
							<jsp:param value="<%=avg %>" name="avg"/>
							<jsp:param value="<%=count %>" name="count"/>
						</jsp:include>
				 </div>
			<%		
	  				}//for
 				}//if
 			%>
 			
 			
                
				<!-- 스크립트 -->
				<%
				  slist = bMgr.getBoardListScript(keyField, keyWord, start, end);
				  listSize = slist.size();//브라우저 화면에 보여질 게시물갯수
				  if (slist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
				    for (int i = 0;i<numPerPage; i++) {
					if (i == listSize) break;
					BoardBeanScript bean = slist.get(i);
					int num = bean.getNum();
					String img1 = bean.getImg1();
					String img2 = bean.getImg2();
					String img3 = bean.getImg3();
					String img4 = bean.getImg4();
					String img5 = bean.getImg5();
					String img6 = bean.getImg6();
					String img7 = bean.getImg7();
					String img8 = bean.getImg8();
					String img9 = bean.getImg9();
					String splace = bean.getPlace();
					String scontent = bean.getContent();

					String id = "dtl_scpt_prdt" + num;
				%>
					<div id=<%=id %> class ="scpt_inactive scrtpg" style="">
						<jsp:include page="sights_script_script.jsp">
							<jsp:param value="<%=img1 %>" name="img1"/>
							<jsp:param value="<%=img2 %>" name="img2"/>
							<jsp:param value="<%=img3 %>" name="img3"/>
							<jsp:param value="<%=img4 %>" name="img4"/>
							<jsp:param value="<%=img5 %>" name="img5"/>
							<jsp:param value="<%=img6 %>" name="img6"/>
							<jsp:param value="<%=img7 %>" name="img7"/>
							<jsp:param value="<%=img8 %>" name="img8"/>
							<jsp:param value="<%=img9 %>" name="img9"/>
							<jsp:param value="<%=splace %>" name="place"/>
							<jsp:param value="<%=scontent %>" name="content"/>
						</jsp:include>
				 </div>
			<%		
	  				}//for
 				}//if
 			%>
                <!-- <div id="dtl_scpt" class ="scpt_inactive" style="">

                    
                </div> -->


            </div>
            
       

        

            <hr>

            <!-- 푸터 프레임 -->
            <footer class="ft_wp">
                <div class="ft_lf">
                    <p>(63122) 제주특별자치도 제주시 선덕로 23(연동) JEJUALOT </p>
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
    

        <!-- 지도 프레임 -->
        <div id="mp_wp">
            <!-- <div> -->
                <div id="map">
                    <!-- 지도정보 표시 부분-->map information
                </div>
            <!-- </div> -->
        </div>
    <!-- </div> -->


    sights_script.jsp 파일에서 아랫쪽 스크립트 부분 전체 변경

<script>
         const locations = [
        { lat: 33.459701230051195, lng: 126.94258570515686 },
        { lat: 33.364102200770986, lng: 126.5288231516102 },
        { lat: 33.24866501318412, lng: 126.5544168742216 },
        { lat: 33.52865591048805, lng: 126.7715453710129 },
        { lat: 33.245013592985025, lng: 126.57180319799289 },
        { lat: 33.25083825452755, lng: 126.41679405566462 },
        { lat: 33.50615675423497, lng: 126.95301790628598 },
        { lat: 33.39269755088221, lng: 126.23818292203633 },
        { lat: 33.252793099478914, lng: 126.62353439984386 },
        ];

        const prdt = ["prdt1", "prdt2", "prdt3", "prdt4", "prdt5", "prdt6","prdt7", "prdt8", "prdt9"];

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
        center: new google.maps.LatLng( 33.364102200770986, 126.5288231516102),
        mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker = {};
        var i;

        // for (i = 0; i < locations.length; i++) {  
        //     marker = new google.maps.Marker({
        //         position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
        //         map: map
        //     });

            // google.maps.event.addListener(marker, 'click', (function(marker, i) {
            //     return function() {
            //     infowindow.setContent(locations[i].place);
            //     infowindow.open(map, marker);
            //     }
            // })(marker, i));
            // }

            // google.maps.event.addListener(marker, 'click', function() {
            //     map.panTo(this.getPosition());
            //     map.setZoom(14);
            // });

            
            // }

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
            marker[3] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[3].lat, locations[3].lng),
                map: map
            });
            marker[4] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[4].lat, locations[4].lng),
                map: map
            });
            marker[5] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[5].lat, locations[5].lng),
                map: map
            });
            marker[6] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[6].lat, locations[6].lng),
                map: map
            });
            marker[7] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[7].lat, locations[7].lng),
                map: map
            });
            marker[8] = new google.maps.Marker({
                position: new google.maps.LatLng(locations[8].lat, locations[8].lng),
                map: map
            });

           
            document.getElementById(prdt[0]).addEventListener('click', function(){
                    // map.panTo({ lat: locations[0].lat, lng: locations[0].lng });
                    // map.setZoom(14);
                    marker[0].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[0].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[1]).addEventListener('click', function(){
                    marker[1].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[1].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[2]).addEventListener('click', function(){
                    marker[2].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[2].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[3]).addEventListener('click', function(){
                    marker[3].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[3].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[4]).addEventListener('click', function(){
                    marker[4].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[4].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[5]).addEventListener('click', function(){
                    marker[5].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[5].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[6]).addEventListener('click', function(){
                    marker[6].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[6].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[7]).addEventListener('click', function(){
                    marker[7].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[7].setAnimation(null);}, 1000);
                })
                document.getElementById(prdt[8]).addEventListener('click', function(){
                    marker[8].setAnimation(google.maps.Animation.BOUNCE);
                    setTimeout(function(){marker[8].setAnimation(null);}, 1000);
                })

console.log(map.getZoom());
            for (var i=0; i<9;i++){
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

       

        
        
		function myWindow()
        {         
         var login_status = document.getElementById("login_status").value;
         
         if(login_status != "null") { //  <-----------여기만 변경됨
            var w = 480;
               var h = 540;
               var l = (screen.width/2) - (w/2);
               var t = (screen.height/2) - (h/2);
               var placename = document.getElementById("placename").value;
               var url = "reviewboard.jsp?splace=" + placename; 
              /*  var myWindow = window.open("reviewboard.jsp", "mywindow", "status=1, scrollbars=1, location=1, resizable=no, left="+ l + ", top="+ t + ", width=" + w+ ",height=" +h+'"'); */
               var myWindow = window.open(url, "mywindow", "status=1, scrollbars=1, location=1, resizable=no, left="+ l + ", top="+ t + ", width=" + w+ ",height=" +h+'"');
         } else {
            if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.")) {
               window.location.href = "signup/login.jsp";
            }
         }
        }
        
        
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIpqxghuqNb8gdkUV2yupr6PLdcvOEG_k&callback=initMap"></script>
	<script type="text/javascript" src="sights_script.js"></script>
 	<script type="text/javascript">
   		var t = document.getElementsByClassName("star_rating");
   		var s = document.getElementsByClassName("strtd");
   		
   		
   		for (var i=0; i < s.length; i++) {
   			/* var s = parseInt(t[i].innerHTML); */
	   		var q = "";
			for(var j=0; j<parseInt(t[i].innerHTML); j++) {
				q += '<span class="fa fa-star checked"></span>';
			}
			for(var j=0; j<5-parseInt(t[i].innerHTML); j++) {
				q += '<span class="fa fa-star"></span>';
			}
			
			s[i].innerHTML = q;
   		}
   </script>


</body>
</html>