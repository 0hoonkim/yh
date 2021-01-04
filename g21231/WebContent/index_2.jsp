<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch15.ThemaBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ch15.BoardMgr" />
<%   
     request.setCharacterEncoding("UTF-8");
	
     
      int totalRecord=0; //전체레코드수
     int numPerPage=6; // 페이지당 레코드 수 
     
     int start=0; //디비의 select 시작번호
     int end=6; //시작번호로 부터 가져올 select 갯수
     
     int listSize=0; //현재 읽어온 게시물의 수

      String keyWord = "", keyField = "";
      Vector<ThemaBean> vlist = null;
%>
<%
/* 	  request.setCharacterEncoding("EUC-KR"); */
	  String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link href="main.css" rel="stylesheet" type="text/css"> 
    <script src="js/main.js"></script> 
</head>
<body onload="javascript:openPopup('popup.html')">

    <header class="" id="header">
     <jsp:include page="sights_header.jsp"></jsp:include>
    </header>

    
    <!-- <div class="wrapper"> -->
       <!-- 왼쪽사이드바 프레임 -->
       <div id="sb">
        <!-- 왼쪽사이드바 로고5개 프레임 -->
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
        <div class="container">
                <!-- 백그라운드 이미지 슬라이드 -->
                <div id="mainFrm">
                    <div class="slideshow-container">
                        
                        <!-- Full-width images with number and caption text -->
                        <div class="mySlides fade">
                        
                        <img src="https://github.com/g2project/main/blob/main/index2/img/1.jpg?raw=true" style="width:100%" height="100%">
                        <div class="text">제주의 낭만 성산 주변의 야경</div>
                        </div>
                
                        <div class="mySlides fade">
                        
                        <img src="https://github.com/g2project/main/blob/main/index2/img/15.jpg?raw=true" style="width:100%">
                        <div class="text">별도연대 근처의 절벽</div>
                        </div>
                
                        <div class="mySlides fade">
                    
                        <img src="https://github.com/g2project/main/blob/main/index2/img/2.jpg?raw=true" style="width:100%">
                        <div class="text">오름의 여왕 다랑쉬 오름</div>
                        </div>
                
                        <div class="mySlides fade">
                        
                        <img src="https://github.com/g2project/main/blob/main/index2/img/36.jpg?raw=true" style="width:100%">
                        <div class="text">꾸밈없는 대자연 용눈이 오름</div>
                        </div>
                
                        <div class="mySlides fade">
                        
                        <img src="https://github.com/g2project/main/blob/main/index2/img/39.jpg?raw=true" style="width:100%">
                        <div class="text">꾸밈없는 대자연 용눈이 오름</div>
                        </div>
                
                        <div class="mySlides fade">
                        
                        <img src="https://github.com/g2project/main/blob/main/index2/img/20180405140033768_TZ1L4APD.jpeg?raw=true" style="width:100%">
                        <div class="text">오늘의 산책 사려니 숲길</div>
                        </div>
                        </br>
                    
                        <!-- Next and previous buttons -->
                        <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
                        <a class="next" onclick="moveSlides(1)">&#10095;</a>
                    </div>
                </div>  

                <div class="content">
                        <!--백그라운드 이미지 슬라이드 끝 -->
                        <div class="weather_wrap">
                            <div class="w_w">
                            <div class="w_w1">
                                
                                <span class="now">
                                    <img src="https://github.com/g2project/main/blob/main/index2/img/now.jpg?raw=true">
                                </span>
                                <div class="p_1">
                                    <p>제주도의 현재 날씨는</p>
                                </div>
                             </div>
                                <br>
                               <!-- weather widget start -->

						<div id="m-booked-weather-bl250-78627">
							<div class="booked-wzs-250-175 weather-customize" style="background-color:#137AE9;width:430px;" id="width3">
								<div class="booked-wzs-250-175_in">
									<div class="booked-wzs-250-175-data">
										<div class="booked-wzs-250-175-left-img wrz-03">
											
										</div>
										<div class="booked-wzs-250-175-right">
											<div class="booked-wzs-day-deck">
												<div class="booked-wzs-day-val">
													<div class="booked-wzs-day-number"><span class="plus">+</span>7</div>
													<div class="booked-wzs-day-dergee">
														<div class="booked-wzs-day-dergee-val">&deg;</div>
														<div class="booked-wzs-day-dergee-name">C</div>
													</div>
												</div>
												<div class="booked-wzs-day">
													<div class="booked-wzs-day-d">H: <span class="plus">+</span>9&deg;</div>
													<div class="booked-wzs-day-n">L: <span class="plus">+</span>6&deg;</div>
												</div>
											</div>
											<div class="booked-wzs-250-175-info">
												<div class="booked-wzs-250-175-city">제주 </div>
												<div class="booked-wzs-250-175-date">월요일, 21 12월</div>
												<div class="booked-wzs-left"> <span class="booked-wzs-bottom-l">7일 예보 보기</span> </div>
											</div>
										</div>
									</div>
				
										<table cellpadding="0" cellspacing="0" class="booked-wzs-table-250">
											<tr>
												<td>화</td>
												<td>수</td>
												<td>목</td>
												<td>금</td>
												<td>토</td>
												<td>일</td>
											</tr>
											<tr>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-03"></div>
												</td>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-03"></div>
												</td>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-18"></div>
												</td>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-01"></div>
												</td>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-03"></div>
												</td>
												<td class="week-day-ico">
													<div class="wrz-sml wrzs-18"></div>
												</td>
											</tr>
											<tr>
												<td class="week-day-val"><span class="plus">+</span>10&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>12&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>10&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>8&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>10&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>16&deg;</td>
											</tr>
											<tr>
												<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>7&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
												<td class="week-day-val"><span class="plus">+</span>9&deg;</td>
											</tr>
										</table>
									</a>
								</div>
							</div>
						</div>
						<script type="text/javascript">
						var css_file = document.createElement("link");
						css_file.setAttribute("rel", "stylesheet");
						css_file.setAttribute("type", "text/css");
						css_file.setAttribute("href", 'https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1');
						document.getElementsByTagName("head")[0].appendChild(css_file);
						
						function setWidgetData(data) {
							if(typeof(data) != 'undefined' && data.results.length > 0) {
								for(var i = 0; i < data.results.length; ++i) {
									var objMainBlock = document.getElementById('m-booked-weather-bl250-78627');
									if(objMainBlock !== null) {
										var copyBlock = document.getElementById('m-bookew-weather-copy-' + data.results[i].widget_type);
										objMainBlock.innerHTML = data.results[i].html_code;
										if(copyBlock !== null) objMainBlock.appendChild(copyBlock);
									}
								}
							} else {
								alert('data=undefined||data.results is empty');
							}
						}
						</script>
						<script type="text/javascript" charset="UTF-8" src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=32868&type=3&scode=2&ltid=3457&domid=593&anc_id=63385&cmetric=1&wlangID=24&color=137AE9&wwidth=430&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script>
						<!-- weather widget end -->
								
                            </div>
                        </div> 

                        <!-- <div class="m_j">
                            <div class="">
                                <h1>이달의 제주도</h1>
                            </div>
                        </div> -->
                        
                        
                        
                         <div class="m_j">
                        <div class="">
                            <h1>인기 제주도 여행</h1>
                        </div>
                    	</div>
                       <!-- 테마여행표 시작 -->
    
                 <div class="thema">

                    <div class="ts_wp">
                    
                    <%
              vlist = bMgr.getIndexList(keyField, keyWord, start, end);
              listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
              if (vlist.isEmpty()) {
               out.println("등록된 게시물이 없습니다.");
              } else {
                for (int i = 0;i<numPerPage; i++) {
               if (i == listSize) break;
               ThemaBean bean = vlist.get(i);
               int num = bean.getNum();
               String img = bean.getImg();
               String title = bean.getTitle();
               int count = bean.getCount();
               
               String id_id = "p" + num;
         %>
               <div class="ts_pt bx_hs pt_qs_al" id="<%=id%>">
                  <jsp:include page="themaProduct.jsp">
                     <jsp:param value = "<%=num %>" name = "num"/>
                     <jsp:param value = "<%=img %>" name = "img"/>
                     <jsp:param value = "<%=title %>" name = "title"/>
                     <jsp:param value = "<%=count %>" name = "count"/>
                  </jsp:include>
             </div>
         <%      
                 }//for
             }//if
          %>
                    

                </div>
                <!-- 메인끝 -->
            </div>    
                 
                </div>
                <div class=bor_1></div>

                <hr style="width: 85%; margin:140px 0 0 140px;">
        
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

                
        </div>
        <script>
        // 슬라이드쇼 

var slideIndex = 0; //slide index

// HTML 로드가 끝난 후 동작
window.onload=function(){
  showSlides(slideIndex);

  // Auto Move Slide
  var sec = 4000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec);
}


// Next/previous controls
function moveSlides(n) {
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}

// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

function showSlides(n) {

  var slides = document.getElementsByClassName("mySlides");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex = 0; n = 0;
  }else if (n < 0) {
    slideIndex = (size-1);
    n = (size-1);
  }

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  
  slides[n].style.display = "block";
 };

// 날씨정보 
/* $(document).ready(function(){
  let weatherIcon = {
      '01' : 'fas fa-sun',
      '02' : 'fas fa-cloud-sun',
      '03' : 'fas fa-cloud',
      '04' : 'fas fa-cloud-meatball',
      '09' : 'fas fa-cloud-sun-rain',
      '10' : 'fas fa-cloud-showers-heavy',
      '11' : 'fas fa-poo-storm',
      '13' : 'far fa-snowflake',
      '50' : 'fas fa-smog'
  };

  $.ajax({
      url: 'http://api.openweathermap.org/data/2.5/weather?q=Jeju&appid=dab36ab4bb7115dc1e4e1592c7e0d2d4&units=metric',
      dataType: 'json',
      type: 'GET',
      success: function(data){
          var $Icon = (data.weather[0].icon).substr(0,2);
          var $Temp = Math.floor(data.main.temp) + 'º';
          var $city = data.name;

           $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] + '"></i>');
           $('.CurrTemp').prepend($Temp);
           $('.City').append($city);
      }
  })
}); */

	function getCookie(){
			var cookie = document.cookie;
			if (document.cookie != ""){
				var cookie_array = cookie.split("; ");
				for (var index in cookie_array) {
					var cookie_name = cookie_array[index].split("=");
					if (cookie_name[0] == "popupYN") {
						return cookie_name[1];
					}
				}
			}return ;
		
		}
		function openPopup(url) {
			var cookieCheck = getCookie("popupYN");
			if (cookieCheck != "N")
				window.open(url, '', 'width=500,height=370,left=400,top=200');
		}	;
		</script>  
</body>
</html>
