<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>회원가입</title>
<link href="signup.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="zipSearch_kakao.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150,top=300,left=900");
	}

	/* function zipSearch() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	} */
</script>
</head>
<body onLoad="regFrm.id.focus()">
    <div class="container p-t-130">
      <a href="../index_2.jsp" style="text-decoration:none";>
        <div  class="form rec-4 p-t-30 p-b-30">
            <div class="logo">
	        <span style="color: #4285F4">J</span>
	        <span style="color: #EA4335">E</span>
	        <span style="color: #FBBC05">J</span>
	        <span style="color: #34A853">U</span>
	        <span style="color: #4285F4">A</span>
	        <span style="color: #EA4335">L</span>
	        <span style="color: #FBBC05">O</span>
	        <span style="color: #34A853">T</span>
            </div>
        </a>
            <p class=" m-b-30">당신의 제주얼랏 계정을 만드세요 !</p>
            <form id="contactform" name="regFrm" method="post" action="memberProc.jsp"> 
                <!-- <p class="contact"><label for="name">Name</label></p>  -->
                <div class="idCheck">
                    <input class="input--style-4" id="id" name="id" placeholder="ID" required="" tabindex="1" type="text">
                    <button class="btn btn--radius-2 btn--blue" type="submit" value="ID중복확인" onClick="idCheck(this.form.id.value)">아이디중복확인</button>
                </div>
                <br/>
                    
                <!-- <p class="contact"><label for="email">Email</label></p>  -->
                <input class="input--style-4" id="email" name="email" placeholder="Email 주소" required="" type="email">
                <br/><br/>
                
                <!-- <p class="contact"><label for="username">Create a username</label></p>  -->
                <input class="input--style-4" id="username" name="name" placeholder="성명" required="" tabindex="2" type="text">
                <br/><br/>
                
                <!-- <p class="contact"><label for="gender_male">Male</label></p>  -->
                <div>
                    <p class="contact"><label for="gender">성별</label></p> 
                    남자<input class="input--style-4" id="gender_male" name="gender" required="" value="1" type="radio">
                    여자<input class="input--style-4" id="gender_female" name="gender" required="" value="2" type="radio">
                </div>
                <br/><br/> 
                    
                <!-- <p class="contact"><label for="password">Create a password</label></p>  -->
                <input class="input--style-4" type="password" id="password" name="pwd" placeholder="비밀번호" required=""> 
                <!-- <p class="contact"><label for="repassword">Confirm your password</label></p>  -->
                <input class="input--style-4" type="password" id="repassword" name="repwd" placeholder="비밀번호확인" required=""> 
                <br/><br/>

                <div class="zipcodeCheck">
                    
                    <input class="input--style-4" id="sample6_postcode" name="zipcode" placeholder="주소" required="" tabindex="10" type="text">
                    <button class="btn btn--radius-2 btn--blue" type="submit" onclick="sample6_execDaumPostcode()">주소 검색</button>
                    <input class="input--style-4" id="sample6_address" name="address" placeholder="상세주소" required="" tabindex="10" type="text">
                    
                </div>
                <br/><br/>

                <!-- <p class="contact"><label for="birthday">Birthday</label></p>  -->
                <input class="input--style-4" type="text" id="birthday" name="birthday" placeholder="Birthday" required=""> 
                <br/><br/>
                
                <div>
                    <p class="contact"><label for="birthday">취미</label></p> 
                    인터넷<input type="checkbox" name="hobby" value="인터넷">
					여행<input type="checkbox" name="hobby" value="여행"> 
                    게임<input type="checkbox" name="hobby" value="게임"> 
                    영화<input type="checkbox" name="hobby" value="영화"> 
                    스포츠<input type="checkbox" name="hobby" value="운동">
                </div>
                <br/><br/>

                <div>
                    <p class="contact"><label for="birthday">직업</label></p> 
                    <select name=job class="select input--style-4">
                        <option value="0" selected>선택하세요.
                        <option value="회사원">회사원
                        <option value="연구전문직">연구전문직
                        <option value="교수학생">교수학생
                        <option value="일반자영업">일반자영업
                        <option value="공무원">공무원
                        <option value="의료인">의료인
                        <option value="법조인">법조인
                        <option value="종교,언론,에술인">종교.언론/예술인
                        <option value="농,축,수산,광업인">농/축/수산/광업인
                        <option value="주부">주부
                        <option value="무직">무직
                        <option value="기타">기타
                    </select>
                </div>
                <br/><br/><br/>
                
                <div class="button-line">
                    <button class="btn btn--radius-2 btn--blue" type="submit" onclick="inputCheck()">Submit</button>
                    <button class="btn btn--radius-2 btn--blue" type="reset">Reset</button>
                </div>
            </form> 
        </div>      
    </div>
</body>
</html>