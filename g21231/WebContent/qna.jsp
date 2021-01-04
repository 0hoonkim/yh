<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="ch15.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ch15.BoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
	  
      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  int pagePerBlock=15; //블럭당 페이지수 
	  
	  int totalPage=0; //전체 페이지 수
	  int totalBlock=0;  //전체 블럭수 

	  int nowPage=1; // 현재페이지
	  int nowBlock=1;  //현재블럭
	  
	  int start=0; //디비의 select 시작번호
	  int end=10; //시작번호로 부터 가져올 select 갯수
	  
	  int listSize=0; //현재 읽어온 게시물의 수

	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
<html>
<head>
<title>JSP Board</title>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript">
	function list() {
		document.listFrm.action = "qna.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("검색어를 입력하세요.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
	 }
</script>

        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="qna.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/9588789e92.js" crossorigin="anonymous"></script>






</head>
<body bgcolor="#FFFFCC">


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


<div id="center" align="center">

	<div class="qna_bn">
	    <img class="qna_bnimg" alt="" src="img/qna.jpg">
	    <!-- 큰제목 배너틀 안쪽 제주도 틀 -->
	    <div class="qna_bntxt">
	        <h1 class="">무엇을 도와드릴까요?</h1>
	    </div>
 	</div>
	
	<!-- <div class="ct_ss">
	    <div class="ct_dv ct_sc">
	        검색창 입력부분
	        <i class="fas fa-search"></i>
	        <input type="text" value="문제를 설명해 주세요." class="" autocomplete="off">
	        /검색창 입력창 틀
	        검색창 로고
	    </div>
     </div>    -->
	
	<div class="ct_wp">
		
					
				
				
					
				
		<table class="ct_fl">
			<tr>
				<td>
					<table class="ct_oo">
							<tr>
								<td>전체 : <span><%=totalRecord%></span>건 <span>|</span> 현재페이지<span >
								<%=nowPage%>/<%=totalPage%></span></td>
							</tr>
					</table>
				</td>
				<td >
                    <form  name="searchFrm"  method="get" action="qna.jsp" >
						<table class = "ct_cd" cellpadding="4" cellspacing="0" >
					 		<tr>
					  			<td >
					   				<select name="keyField" size="1" >
					    				<option value="id"> 아이디</option>
					    				<option value="subject"> 제 목</option>
					    				<option value="content"> 내 용</option>
					   				</select>
					   				<input size="16" name="keyWord">
					   				<input type="button"  value="검색" onClick="javascript:check()">
					   				<input type="hidden" name="nowPage" value="1">
					  			</td>
					 		</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	<table class="bd_tb"  align="center" width="100%" cellpadding="3">
		<tr>
			<td colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
				  if (vlist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
			%>
				  <table  class = "tb_ct" width="100%" cellpadding="2" cellspacing="0">
						<tr>
							<th width="10%">번호</th>
							<th width="10%">고객명</th>
							<th width="10%">분류</th>
							<th width="40%">제목</th>
							<th width="10%">날짜</th>
							<th width="10%">조회수</th>
							<th width="10%">상태</th>
						</tr>
					<!-- </th> -->
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							BoardBean bean = vlist.get(i);
							int num = bean.getNum();
							String id = bean.getId();
							String category = bean.getCategory();
							String title = bean.getTitle();
							String regdate = bean.getRegdate();
							String rstatus = bean.getRstatus();
							int depth = bean.getDepth();
							int count = bean.getCount();
					%>
					<tr>
						<td>
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<td><%=id%></td>
						<td><%=category%></td>
						<td style="text-align: left;">
						<%
							  if(depth>0){
								for(int j=0;j<depth;j++){
									out.println("&nbsp;&nbsp;");
									}
								}
						%>
						  <a href="javascript:read('<%=num%>')"><%=title%></a>
						</td>
						<%-- <td align="center"><%=name%></td> --%>
						<td><%=regdate%></td>
						<td><%=count%></td>
						<td><%=rstatus %></td>
					</tr>
					<%		}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
		<tr>
			<td><br /><br /></td>
		</tr>
		<tr>
			<td class="bt_lf" style="padding-left:150px;">
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //하단 페이지 끝번호
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					<div class="paging"><%=pageStart %></div> 
     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
    					<%}//for%>&nbsp; 
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 				<!-- 페이징 및 블럭 처리 End-->
				</td>
				<td class = "bt_rt">
					<div><a href="post.jsp">글쓰기</a> </div>
					<div><a href="javascript:list()">처음으로</a></div>
				</td>
			</tr>
		</table>
	<!-- <hr width="600"/> -->
	
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="num"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
	
	</div>
	
	
	
	
	
	<!-- 푸터 -->
            <footer class="ft_wp">
                <!-- 푸터 내부 첫째줄 프레임 -->
                <div class="ft_lf">
                    <!-- 푸터 내부 첫째줄 항목1 -->
                    <a class="" href="#" target="_blank">About</a>
                    <!-- 푸터 내부 첫째줄 항목2 -->
                    <a class="" href="#" target="_blank">Privacy</a>
                    <!-- 푸터 내부 첫째줄 항목3 -->
                    <a class="" href="#" target="_blank">Terms</a>
                    <!-- 푸터 내부 첫째줄 항목4 -->
                    <a class="" href="#" target="_blank">Join user studies</a>
                    <!-- 푸터 내부 첫째줄 항목5 -->
                    <span class="" >Feedback</span>
                    <!-- 푸터 내부 첫째줄 항목6 -->
                    <a class="" href="#" target="_blank">Help Centre</a>
                </div>
                
                <!-- 푸터 내부 둘째줄 -->
                <div class="ft_ls">
                    <p class="">Content written by Google unless otherwise noted</p>
                </div>
            </footer>
</div>
















</body>
</html>