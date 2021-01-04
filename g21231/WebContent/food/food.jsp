<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>subtrip</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <link href="food.css" rel="stylesheet" type="text/css">
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>  
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/9197beab6d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="food2.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    
</head>
<body>

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
        <div class="container">
            <div class="content">

                <!-- 맨 위 메인 -->
                <div class="main_1">
                    <!-- 메인 배너 시작 -->
                    <div class="main">
                            <img src="https://github.com/g2project/main/blob/main/food/img/h_1.PNG?raw=true" width="1200" height="300">
                        <span class="travel">
                            <h1>제주향토음식</h1>
                        </span>
                    </div>
                    <!-- 메인 배너 끝 -->

                    <!--메인 네비 시작-->
                    <div class="nv">
                        <span class="nv_s">
                            <span class="h_1" style="color: #c9c9c9;">
                                <i class="fas fa-plane fa-2x"></i>
                            </span>
                            <div class="pp_1">
                                <p>여행의 즐거움 중 빼놓을 수 없는 것은 단연 음식이다. 제주도는 흑돼지, 말요리 그리고 해산물 등 다양한 음식문화를 접할 수 있다. 오직 제주에서만 접할 수 있는 제주도의 전통 음식을 알아보자.
                                </p>
                            </div>
                        </span>
                    </div>
                    <!--메인 네비 끝-->
                </div>
                <!-- 맨 위 메인 끝-->


                <!-- 탭메뉴 -->
                


                <!-- 센터 시작 -->
                <div class="center">
                    <!-- 컨텐츠 시작 -->
                    
                    <div class="swiper-container">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('1');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_01.png?raw=true"/>
                                    <div class="title">
                                        <p>흑돼지</p>
                                    </div>
                                </a>
                                
                            </div>
                            
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('2');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_02.png?raw=true"/>
                                    <div class="title">
                                        <p>꿩요리</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('3');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_03.png?raw=true"/>
                                    <div class="title">
                                        <p>말요리</p>
                                        
                                    </div>
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('4');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_04.png?raw=true"/>
                                    <div class="title">
                                        <p>고기국수</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('5');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_05.png?raw=true"/>
                                    <div class="title">
                                        <p>성게국</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('6');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_06.png?raw=true"/>
                                    <div class="title">
                                        <p>회</p>
                                    </div>
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('7');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_07.png?raw=true"/>
                                    <div class="title">
                                        <p>물회</p>
                                    </div>
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('8');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_08.png?raw=true"/>
                                    <div class="title">
                                        <p>갈치요리</p>
                                    </div> 
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('9');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_09.png?raw=true"/>
                                    <div class="title">
                                        <p>고등어</p>
                                    </div>
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('10');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_10.png?raw=true"/>
                                    <div class="title">
                                        <p>오분자기</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('11');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_11.png?raw=true"/>
                                    <div class="title">
                                        <p>전복</p>
                                    </div> 
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('12');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_12.png?raw=true"/>
                                    <div class="title">
                                        <p>소라</p>
                                    </div>
                                </a>
                                
                            </div>
                            <div class="swiper-slide">
                                <a href="javascript:show_layer('13');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_13.png?raw=true"/>
                                    <div class="title">
                                        <p>자리젓</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('14');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_14.png?raw=true"/>
                                    <div class="title">
                                        <p>멸치젓</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('15');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_15.png?raw=true"/>
                                    <div class="title">
                                        <p>깅이죽</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('16');">
                                  <img src="https://github.com/g2project/main/blob/main/food/img/food_16.png?raw=true"/>
                                    <div class="title">
                                        <p>문게죽</p>
                                    </div>  
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('17');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_17.png?raw=true"/>
                                    <div class="title">
                                        <p>조개죽</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('18');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_18.png?raw=true"/>
                                    <div class="title">
                                        <p>빙떡</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('19');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_19.png?raw=true"/>
                                    <div class="title">
                                        <p>보말칼국수 </p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('20');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_20.png?raw=true"/>
                                    <div class="title">
                                        <p>몸국</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('21');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_21.png?raw=true"/>
                                    <div class="title">
                                        <p>돔베고기</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('22');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_22.png?raw=true"/>
                                    <div class="title">
                                        <p>오메기떡</p>
                                    </div> 
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('23');">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_23.png?raw=true"/>
                                    <div class="title">
                                        <p>감귤류</p>
                                    </div>
                                </a>
                            </div>

                            <div class="swiper-slide">
                                <a href="javascript:show_layer('24');">
                                   <img src="https://github.com/g2project/main/blob/main/food/img/food_24.png?raw=true"/>
                                    <div class="title">
                                        <p>보리빵</p>
                                    </div> 
                                </a>
                                
                            </div>


                        </div>
                    
                        <!-- 네비게이션 -->
                        <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                        <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
                    
                        <!-- 페이징 -->
                        <div class="swiper-pagination"></div>
                        
                    </div>
                    
                    <!-- Popular food and drink text-->

                    

                

                <DIV id=div_01>
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">흑돼지</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_01.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도를 처음 여행하는 사람들은 과연 어딜 가야 맛있는 흑돼지를 먹을 수 있을지 우왕좌왕 하기 마련. 이러한 상황에 한 가지 명쾌한 해답을 내리자면 바로 '아무 데나' 찾아가라는 것이다.
                                            제주의 흑돼지 음식점은 어딜 가나 맛있으니까. 흑돼지 구이는 멸치로 만든 젓갈인 '멜젓'에 찍어 먹으면 맛이 더욱 좋아진다. 고기의 기름진 느끼함을 없애줌과 동시에 입맛을 돋운다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </DIV>

                <div id=div_02 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">꿩요리</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_02.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주는 꿩이 많아 꿩요리 종류가 다양하다. 가을 꿩을 최고로 치는데 회로도 먹고 육포로도 만들어 먹는다. 꿩의 가슴살을 얇게 저며 샤부샤부로 먹는 꿩토렴은 별미이다.
                                            제주산 메밀과 꿩 육수가 어우러진 꿩메밀국수는 밀가루로 만든 음식에 비해 소화가 잘 되고 담백해 부담 없이 즐길 수 있다. 꿩만두국은 기름기 없이 깔끔한 맛을 자랑한다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_03 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">말요리</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_03.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            말요리는 옛날에 왕의 수라상에 진상되었던 최고급 음식이었다. 마육회, 마초밥, 탕수육, 갈비찜, 생구이, 불고기 등의 다양한 요리로 응용된다.
                                            말고기는 소고기보다 담백하고 살코기를 비롯해 내장이나 생간 등 부위별 맛도 다양하다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_04 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">고기국수</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_04.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도에는 고기국수집이 흔하다. 고기국수는 뽀얗게 우려낸 육수에 면을 넣고, 삶은 돼지고기를 얹은 뒤, 입맛에 따라 청양고추와 고춧가루, 후춧가루 등을 넣고 먹으면 된다.
                                            두툼한 중면에 수육까지 함께 먹으니 한 그릇 만으로도 속을 든든하게 채울 수 있다. 고기국수는 해장용으로도 인기가 좋지만 술을 부른다는 단점 아닌 단점이 있다.
                                            얼큰한 국물을 마실 때 소주 한 잔이 생각나는 것처럼 시원하면서도 배지근한 고기국수 국물에는 술이 술술 들어간다. 제주도 지역 소주인 한라산과 함께 먹는다면 금상첨화다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_05 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">성게국</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_05.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            성게국은 미역을 참기름으로 살짝 볶은 후, 성게와 오분자기를 함께 넣고 끓인다. 소금으로 간을 하면 성게알은 노란빛을 더하고 순두부처럼 엉겨 달짝지근하면서도 담백한 맛이 난다. 제주에서는 성게를 '구살'이라 불러 구살국이라고도 한다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_06 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">회</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_06.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도에서 가장 흔한 생선 중 하나인 황돔은 저렴하면서도 고소한 맛이 일품이다. 육지에서는 흔히 찾아볼 수 없는 생선이니 꼭 한 번 먹어보자.
                                            황돔보다 조금 더 고급스러운 것으로는 회 중의 회라 불리는 갓돔이 있다. 일년 중 12~3월까지가 가장 맛있는 때로 봄이 시작될 즈음에 가장 물이 오르는 옥돔, 6~8월까지가 제철이고 씹히는 맛이 부드러우며 감칠맛이 나 여름에 사랑 받는 한치, 9월부터 10월 말까지가 제철인 방어, 낚시로 주로 잡히는 어종으로 12~3월에 가장 맛있는 횟감의 하나인 벵에돔 등도 제주에서 꼭 맛봐야 할 음식이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_07 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">물회</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_07.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            4월 중순에서 5월 초에 많이 먹는 별미 물회, 자리물회, 해삼물회, 소라물회, 한치물회 등 그 종류도 다양하다. 재료가 싱싱한데다 맛도 뛰어나기 때문에 취향에 따라 골라 먹기만 하면 된다. 조리방식은 주로 미나리, 배, 오이, 깻잎, 풋고추 등의 채소를 얇게 썰어서 해산물과 함께 갖은 양념으로 무친 후, 물을 붓고 얼음을 띄운다.
                                            해산물을 모두 먹고 남은 양념에 공기밥 한 공기를 슥슥 말아먹는 것도 맛있다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_08 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">갈치요리</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_08.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도에서 갈치를 먹는 방법은 다양하다. 먼저 싱싱한 회로 즐길 수 있다. 갈치회는 비릴 거라고 생각하는 사람이 많으나 천만의 말씀. 씹는 맛이 좋고, 고소해 인기가 좋다.
                                            다음으로 많이 먹는 방법이 조림이다. 싱싱한 갈치살이 입안에서 살살 녹는다. 제주도의 매운 고춧가루로 양념한 조림은 밥에 쓱싹쓱싹 비벼 먹어도 맛있다.
                                            갈치 본연의 맛을 느끼고 싶다면 구이가 좋다. 좀 더 특이한 맛을 원한다면 갈칫국에도 도전해보자. 맑은 국물에 늙은 호박을 넣어 끓인 갈칫국은 매운 고추와 어우러져 해장용으로도 그만이다. 마지막으로는 갈치젓이 있다. 뜨거운 밥 한 술에 갈치젓 한 점 얹어 먹으면 밥 한 그릇이 뚝딱이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_09 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">고등어</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_09.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            고등어는 DHA와 아미노산이 풍부해 성인병 예방에 탁월한 효과가 있다. 염장하여 자반으로 말려 사시사철 즐겨 먹을 수 있지만 제철의 싱싱한 조림과 구이가 최고.
                                            직접 불에 구우면 자체적으로 기름이 베어 나와 윤기가 흐른다. 그 풍부하고 깊은 맛이 가히 일품이라고 할 수 있다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_10 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">오분자기</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_10.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도 해산물의 으뜸은 단연 '오분자기'일 것이다. 오분자기는 전복과의 연체동물로, 수심 20m의 바위에 붙어 산다. 우리나라에서 어획하는 오분자기의 약 70% 정도를 제주도에서 채취하고 있으며, 칼슘 및 철분 등의 무기질과 비타민 B가 많이 함유되어 있다. 구워서 먹거나 된장찌개, 죽의 재료로도 많이 사용하며 젓갈을 담가 먹기도 한다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_11 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">전복</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_11.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            '바다의 산삼'이라 불릴 정도로 영양이 풍부한 전복은 특히 제주에서 많이 채취된다. 전복을 회로도 많이 먹지만 죽, 뚝배기, 삼계탕, 각종 찌개류에 들어가면 고급요리가 된다.
                                            전복을 얇게 썰어 참기름에 살짝 볶은 후 물에 불린 쌀을 넣어 끓인 전복죽은 담백하고 고소한 맛이 일품.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_12 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">소라</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_12.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            소라는 어류보다 단백질이 풍부하며 육질이 단단한 것이 특징이다. 소라구이는 약한 소금물에 씻은 뒤 통째로 숯불에 구워낸다.
                                            구워 낸 소라를 몸통과 내장을 분리해서 양념장에 찍어 먹으면 입안 가득 바다향이 번지는 별미 중에 별미이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_13 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">자리젓</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_13.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주 근해에서만 잡히고 있는 자리돔을 원료로 하여 염장한 것으로 비늘을 제거하여 먹기에 좋고 맛도 구수하다. 특이한 냄새가 나지만 이 냄새가 좋아서 자리젓을 즐기는 사람들도 많다.
                                            풋고추, 마늘 등 갖은 양념을 곁들이면 밥 반찬으로도 좋다. 통째로 밥 위에 올리면 생선 한 마리를 그대로 먹는 것 같은 푸짐한 느낌을 준다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_14 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">멸치젓</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_14.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            멸치젓은 봄 가을에 생 멸치에 소금을 재 만든다. 다양한 방법으로 먹지만 상추나 싱싱한 콩잎에 싸서 먹으면 고기도 필요없이 밥 한 그릇이 뚝딱 사라진다.
                                            한여름에 땀을 흘리고 나서 먹으면 기력 보충에도 좋고 입맛을 돋워 준다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_15 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">깅이죽</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_15.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            '깅이'는 '게'의 제주어. 5월의 별미인 깅이죽은 깅이를 돌절구에 찧으면 나오는 진한 즙에 물을 넣고 채에 걸러내 국물을 낸다.
                                            불린 쌀을 참기름에 달달 볶다가 깅이즙을 넣어 저으면서 서서히 끓여내면 된다. 기호에 따라 소금을 넣어서 먹어도 된다. 뼈에 좋은 칼슘과 키토산이 풍부하다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_16 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">문게죽</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_16.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            '문게'는 '문어'의 제주어. 흔히 돌문어를 말한다. 독특한 식감이 있는 제주 돌문어는 회를 쳐서 먹기도 하고 양념 조림이나 죽을 만들기도 했다.
                                            문게죽은 소박한 서민 보양음식으로, 내장을 제거하고 손질한 문어를 절구에 찧어서 물에 불린 쌀과 함께 참기름에 볶은 후 물을 부어 끓이면 된다.
                                            이때 칼로 다지지 않고 절구에 찧음으로써 껍질의 붉은 색소가 배어나면 씹히는 느낌이 훨씬 부드러워진다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_17 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">조개죽</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_17.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            고소하고 담백하며 뒷맛까지 개운해 다른 밑반찬이 필요 없는 조개죽은 조개가 살이 통통하게 오르고 가장 맛이 좋은 여름에 먹어야 제맛이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_18 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">빙떡</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_18.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            빙빙 마는 떡이라 하여 빙떡이라고 부른다. 고운 메밀가루를 반죽하여 얇고 둥글게 전을 부친 후 무, 당근, 파, 소금, 참깨가루, 참기름 등을 골고루 섞어 소를 만들고 전 위에 올려놓아 둥글게 말면 빙떡이 된다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_19 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">보말칼국수</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_19.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            보말을 넣어 끓인 칼국수로 제주도의 요리이다. ‘보말’은 고둥의 제주도 방언이다. 고둥은 복족류의 연체동물로 밀물과 썰물이 오가는 해안지역에 가면 돌의 아랫부분에서 채집할 수 있다. 일년 중 여름에 맛이 가장 좋고 제주도에서는 고둥을 주로 국이나 죽에 넣어 먹는다. 맛이 깔끔하고 담백하다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_20 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">몸국</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_20.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            모자반을 제주에서는 ‘ᄆᆞᆷ’이라 불렀으며 이 ᄆᆞᆷ을 넣고 끓인 국이라서 ‘ᄆᆞᆷ국’이라 칭한다. 돼지고기와 내장, 순대까지 삶아 낸 국물에 모자반을 넣고 끓이면 느끼함이 줄어들고 독특한 맛이 우러나는데, 혼례와 상례 등 제주의 집안 행사에는 빠지지 않고 만들었던 행사 전용 음식이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_21 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">돔베고기</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_21.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            갓 삶은 흑돼지고기 수육을 나무 도마에 얹어 덩어리째 썰어 먹는 제주의 현지 음식으로, 여기서 ‘돔베’는 ‘도마’의 제주 방언이다. 수육에 쓰이는 고기는 제주의 흑돼지로, 예로부터 흑돼지는 일교차가 크지 않은 섬에서 자라 스트레스가 적으며 체질이 건강하다. 질병에 대한 저항성도 강해 고기의 질이 우수하다. 
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_22 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">오메기떡</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_22.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            차조 가루를 반죽하여 만든 삶은 떡에 콩가루나 팥고물을 묻혀 먹는 제주도의 향토 음식. 차조 가루로 만든 떡에 콩가루나 팥고물을 묻혀 먹는 제주도의 향토 음식이다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_23 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">감귤류</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_23.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도는 그야말로 감귤류의 천국이다. 달콤한 귤부터 한라봉, 청견, 설봉향, 카라향 등 다양한 귤 종류를 맛볼 수 있다. 그중에서도 푸른빛을 띠는 청귤은 아직 귤 맛을 보기에는 너무 이른 7월~10월까지 수확해 상큼한 맛을 자랑하는 감귤류로, 당도와 향이 강해 귤청이나 차로 만들어 먹는다. 이외에 밀감류와 오렌지류를 교배시켜 만든 천혜향, 한라봉과 서지향을 교배해 만든 레드향, 한라봉과 천혜향을 교배해 만든 황금향, 청견과 흥진조생을 교배해 만든 진지향 등 다양한 품종의 감귤류를 만날 수 있다.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>

                <div id=div_24 style="DISPLAY: none">
                    <div class="center_1">
                        <div class="tip1">
                            <div class="tip_1">
                                <h1 class="f_title">보리빵</h1>
                                <div class="t_img">
                                    <img src="https://github.com/g2project/main/blob/main/food/img/food_24.png?raw=true">
                                </div>
                                <div class="t_p">
                                        <p>
                                            제주도만의 로컬푸드를 찾는다면 제주도 특산품 중 하나인 제주도 보리빵을 추천한다. 제주도는 화산섬인 지역 특성상 벼농사가 힘들기 때문에 보리 재배가 발달되었으며, 자연스레 보리를 활용한 다양한 음식이 만들어졌다. 보리빵 역시 그중 하나로 가격도 1,000원 이하로 저렴해 관광객들의 마음을 사로잡기에 충분하다. 자칫 싱겁게 느껴질 수 있지만, 씹을수록 느껴지는 구수한 보리의 풍미와 담백하면서도 적당한 단맛이 물리지도 않고 좋다. 거친 식감도 매력적이다. 이외에 제주 쑥을 활용한 쑥찐빵, 한라봉을 활용한 한라봉 찐빵 등 다양한 찐빵을 선보인다. 
                                        </p>
                                </div>
                            </div>
                        </div>
                    </DIV>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                

                <hr>

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
                

                <!-- 센터끝 -->

        

            </div>
            <!-- 컨텐츠끝 --> 

        </div>
        <!-- 컨테이너끝 -->  

        <script>

            new Swiper('.swiper-container', {
            
                slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
                spaceBetween : 30, // 슬라이드간 간격
                slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
            
                // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
                loopFillGroupWithBlank : true,
            
                loop : true, // 무한 반복
            
                pagination : { // 페이징
                    el : '.swiper-pagination',
                    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
                },
                navigation : { // 네비게이션
                    nextEl : '.swiper-button-next', // 다음 버튼 클래스명
                    prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
                },
            });
            
            </script>
            <script type="text/javascript" src="food.js"></script>

</body>
</html>
                                            