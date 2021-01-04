<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch15.BoardBeanProduct, ch15.BoardBeanScript, ch15.BoardBeanReview"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ch15.BoardMgr" />
    
<%
 String img1 = request.getParameter("img1");
 String img2 = request.getParameter("img2");
 String img3 = request.getParameter("img3");
 String img4 = request.getParameter("img4");
 String img5 = request.getParameter("img5");
 String img6 = request.getParameter("img6");
 String img7 = request.getParameter("img7");
 String img8 = request.getParameter("img8");
 String img9 = request.getParameter("img9");
 String splace = request.getParameter("place");
 String scontent = request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- <link rel="stylesheet" href="sights_script_script.css"> -->
    <script src="./js/vendor/modernizr.custom.min.js"></script>
    <script src="./js/vendor/jquery-1.10.2.min.js"></script>
    <script src="./js/vendor/jquery-ui-1.10.3.custom.min.js"></script>
   	<script src="js/script.js"></script>
   	
   	
   	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    
    <style>

.ma_dt_bs div {
   display: inline-block;
   vertical-align: top;
}

.searchLink {
   padding-bottom: 10px;
}

.searchlink img {
   widht: 20px;
   height: 20px;
   border-radius: 50%;
   margin-right: 5px;
   margin-top: 5px;
}
</style>
</head>
<body>
<div id="center_test">
                        <div id="detail_showoff">
                        <div class="ma_dt_wp">
                            <div class="ma_dt_oc">
                                <!-- <div class="ma_dt_hl"></div>
                                <div class="ma_dt_ll"></div> -->
                                
                                <div class="slideshow">
                                    <div class="slideshow-slides">
                                        <div class="slide" id="slide-1" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i" src="<%=img1%>" >
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-2" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i" src="<%=img2%>" >
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/110806801408958467066">SEORAN KIM</a>
                                                    </div>
                                            </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-3" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i" src="<%=img3%>" >
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/112925210708638106192">PHUONG HUYNH</a>
                                                    </div>
                                            </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-4" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i" src="<%=img4%>" >
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/116308292875829448442">박애란</a>
                                                    </div>
                                            </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-5" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i"   src="<%=img5%>">
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/102367465213928383439">조장호 준장</a>
                                                    </div>
                                                </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-6" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i"   src="<%=img6%>">
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/100639104759192244528">Yongsheng Chai</a>
                                                    </div>
                                                </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-7" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i"   src="<%=img7%>"><span  class="">
                                                    <div class="ma_dt_nm" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/112512230838745124811">몽키초이</a>
                                                    </div>
                                                </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-8" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i"   src="<%=img8%>">
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/102107924449269984832">youngseob Kim</a>
                                                    </div>
                                                </span>
                                            </easy-img>
                                        </div>
                                        <div class="slide" id="slide-9" >
                                            <easy-img  class="">
                                                <img alt="" class="s_i"   src="<%=img9%>">
                                                <span  class="ma_dt_nm">
                                                    <div class="" >
                                                        <span class="" ></span>
                                                        <a class="" href="//maps.google.com/maps/contrib/112512230838745124811">몽키초이</a>
                                                    </div>
                                                </span>
                                            </easy-img>
                                        </div>           
                                    </div>
                                    
                                    
                                    <div class="slideshow-nav">
					                    <a href="#" class="prev">Prev</a>
					                    <a href="#" class="next">Next</a>
					                </div>
					                
                        </div>
                                        <!-- <div class="" >
                                            <div  >
                                                <button class=""    aria-label="Previous" tabindex="-1"><span  class=""></span>
                                                    <div class=""></div><span class=""><svg focusable="false" width="18" height="18" viewBox="0 0 24 24" class=""><path d="M16.41 5.41L15 4l-8 8 8 8 1.41-1.41L9.83 12"></path></svg></span></button>
                                            </div>
                                        </div>
                                        <div class="" >
                                            <div  >
                                                <button class=""    aria-label="Next" tabindex="0"><span  class=""></span>
                                                    <div class=""></div><span class=""><svg focusable="false" width="18" height="18" viewBox="0 0 24 24" class=""><path d="M7.59 18.59L9 20l8-8-8-8-1.41 1.41L14.17 12"></path></svg></span></button>
                                            </div>
                                        </div> -----------------------삭제불가--> 
                                                    
                               <div class="ma_dt_bs">
                                   <div>
                                    <h3 class="" aria-label="Wolmido"><%=splace %></h3>
                                    </div>
                                    <div>
                                    <input id="placename" type="hidden" name="placename" value="<%=splace %>" />
                                    </div>
                                    <div class="searchlink">
                                       <span  class="">
                                         <a class="" href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=<%=splace %>"  target="_blank"><img alt="" class="" src="https://github.com/g2project/main/blob/main/sights/images/naver_logo.jpg?raw=true""></a>
                                       </span>
                                      
                                       <span  class="">
                                          <a class="" href="https://www.google.co.kr/maps/place/<%=splace %>" target="_blank"><img alt="" class=""   src="https://github.com/g2project/main/blob/main/sights/images/google_logo.jpg?raw=true"></a>
                                       </span>
                                     </div>
                                     
                                    <table class="ma_dt_tb">
                                        <tr>
                                            <td class="ma_tb_lf">
                                                <div class="ma_dt_bt ma_dt_lt">
                                                    <div class="ma_dt_tt">
                                                        
                                                        <!-- <div class="">
                                                            <div>
                                                                <div>
                                                                    <div    class=""><span   aria-pressed="false"  tabindex="0" class=""  aria-label="Add Wolmido to collection" title="Add Wolmido to collection"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" class=""><path d="M34 6H14c-2.21 0-3.98 1.79-3.98 4L10 42l14-6 14 6V10c0-2.21-1.79-4-4-4zm0 30l-10-4.35L14 36V10h20v26z"></path></svg><span  class="">Add to</span></span><span   aria-pressed="true"  tabindex="0" class=""  aria-label="Add Wolmido to collection" title="Add Wolmido to collection" style="display: none;"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" class=""><path d="M34 6H14c-2.21 0-3.98 1.79-3.98 4L10 42l14-6 14 6V10c0-2.21-1.79-4-4-4z"></path></svg><span  class="">Added</span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> -->
                                                    </div>
                                                    <div class="ma_dt_at">
                                                        <div class="">
                                                            <!-- <div class="">
                                                                <div class="">
                                                                    <div class=""  >
                                                                        <div aria-label="4.0 out of 5 stars from 260 reviews. Very good.">
                                                                            <div class="" >
                                                                                <div class="">4.0</div>
                                                                                <div class="">
                                                                                    <div class=""><span class=""><span class="" ></span><span class="" ></span><span class="" ></span><span class="" ></span><span class="" ></span></span><span class=""><span class="" ></span><span class="" ></span><span class="" ></span><span class="" ></span><span class="" ></span></span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class=""><span class="" >Very good</span><span >&nbsp;|&nbsp;</span><a href="https://search.google.com/local/reviews?placeid=ChIJbYc0JWOCezURypoST-McTYM" target="_blank" class="">260 reviews</a></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> -->
                                                            <div class="">
                                                                <div   >
                                                                    <div  class="" ><%=scontent %><a target="_blank"  href="https://en.wikipedia.org/wiki/Wolmido">Wikipedia</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="ma_tb_rt"> 
                                                <div class="ma_dt_bt ma_dt_rt">
                                                    <div class="">
                                                        <div class="ma_rt_tt">방문자 리뷰</div>
                                                        <table class="">
                                                            <%
	                                                            int listSize=0;
	                                                            int numPerPage=3;
	                                                            String rId = "";
	                                                            String rImg = "";
	                                                            String rComment = "";
	                                                            Vector<BoardBeanReview> rlist = null;
	
	                                                            rlist = bMgr.getBoardListReview(splace, 1, 3);
	                                                            listSize = rlist.size();//브라우저 화면에 보여질 게시물갯수
	                                                            if (rlist.isEmpty()) {
	                                                           	out.println("등록된 게시물이 없습니다.");
	                                                            } else {
	                                                              for (int i = 0;i<numPerPage; i++) {
	                                                           	if (i == listSize) break;
	                                                           	BoardBeanReview rbean = rlist.get(i);
	                                                           	rId = rbean.getId();
	                                                           	rImg = rbean.getImg();
	                                                           	rComment = rbean.getComment();
	                                                           	%>
	                                                           	<tr class="ma_rt_is">
	                                                                <td class="ma_rt_tb ma_rt_cp" >
	                                                                    <a href="https://www.google.com/maps/contrib/110538406358623875558/reviews/" target="_blank">
	                                                                        <easy-img  class="">
	                                                                            <div class=""></div><img alt="" class="" src="<%=rImg %>" ></easy-img>
	                                                                    </a>
	                                                                </td>
	                                                                <td class="ma_rt_tb ma_bt_sy"  >
	                                                                    <a class="" href="https://www.google.com/maps/contrib/110538406358623875558/place/ChIJbYc0JWOCezURypoST-McTYM" target="_blank">
	                                                                        <html-blob><%=rComment %></html-blob>
	                                                                    </a>
	                                                                </td>
                                                            	</tr>
	                                                           	<%

	                                                              	}
	                                                            }
                                                            %>
                                                            <%-- <tr class="ma_rt_is">
                                                                <td class="ma_rt_tb ma_rt_cp" >
                                                                    <a href="https://www.google.com/maps/contrib/110538406358623875558/reviews/" target="_blank">
                                                                        <easy-img  class="">
                                                                            <div class=""></div><img alt="" class="" src="<%=rImg %>" ></easy-img>
                                                                    </a>
                                                                </td>
                                                                <td class="ma_rt_tb ma_bt_sy"  >
                                                                    <a class="" href="https://www.google.com/maps/contrib/110538406358623875558/place/ChIJbYc0JWOCezURypoST-McTYM" target="_blank">
                                                                        <html-blob><%=rComment %></html-blob>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                            <tr class="ma_rt_is">
                                                                <td class="ma_rt_tb ma_rt_cp" >
                                                                    <a href="https://www.google.com/maps/contrib/115559558799531355151/reviews/" target="_blank">
                                                                        <easy-img  class="">
                                                                            <div class=""></div><img alt="" class="" src="https://lh3.googleusercontent.com/a-/AOh14GgZ_w0-gQ2sTjvsOT4XRf0PRF9Vx2cBefysRYp4HHw=w28-h28-n-k-c0xffffffff-no-br100" ></easy-img>
                                                                    </a>
                                                                </td>
                                                                <td class="ma_rt_tb ma_bt_sy"  >
                                                                    <a class="" href="https://www.google.com/maps/contrib/115559558799531355151/place/ChIJbYc0JWOCezURypoST-McTYM" target="_blank">
                                                                        <html-blob>"There is also <b>tourist sight</b> <b>seeing cruise</b> here but they have fix timings..."</html-blob>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                            <tr class="ma_rt_is">
                                                                <td class="ma_rt_tb ma_rt_cp" >
                                                                    <a href="https://www.google.com/maps/contrib/109725873676983357715/reviews/" target="_blank">
                                                                        <easy-img  class="">
                                                                            <div class=""></div><img alt="" class="" src="https://lh4.googleusercontent.com/-Aj_yHXEfnFs/AAAAAAAAAAI/AAAAAAAAAAA/yeQJhdg4faM/w28-h28-n-k-c0xffffffff-no-br100/photo.jpg" ></easy-img>
                                                                    </a>
                                                                </td>
                                                                <td class="ma_rt_tb ma_bt_sy"  >
                                                                    <a class="" href="https://www.google.com/maps/contrib/109725873676983357715/place/ChIJbYc0JWOCezURypoST-McTYM" target="_blank">
                                                                        <html-blob>"If you <b>like fresh seafood</b>, you should visit here."</html-blob>
                                                                    </a>
                                                                </td>
                                                            </tr> --%>
                                                            
                                                            
                                                            
                                                            
                                                        </table>
                                                        <div class="ma_dt_mo"  >
                                                            <div class="" >
                                                                <div class=""  >
                                                                <%-- script>
                                                                var placename = <%=splace %>;
                                                                </script> --%>
                                                                    <a href="#" onClick="myWindow()"><span  class="" >Read more reviews</span></a>
                                                                    <a  class="" href="https://search.google.com/local/reviews?placeid=ChIJbYc0JWOCezURypoST-McTYM" target="_blank" aria-label="Read more reviews about Wolmido"></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>                
                                </div>
                                <div class="ma_md_ht"></div>
                                <div class="ma_dt_mt"  >
                                    <div class="" >
                                        <div class=""  >
                                            <div class=""></div><span  class="ma_dt_bp" >Web results about this place</span>
                                            <a  class="" href="https://www.google.com/search?q=Wolmido&amp;stick=H4sIAAAAAAAAAONgFuLQz9U3yCgzTFLiArGyzPPM8pK1FLOTrfRz8pMTSzLz8-AMq8SSkqLEZBCzGADhRCyiOwAAAA#fpstate=trskp&amp;trifp=kpq%253DWolmido%2526skpm%253D/m/0j7n6nc%2526t%253Dd" target="_blank" aria-label="Web results about Wolmido"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </div>
    
    
    
    
                    </div>
</body>
</html>