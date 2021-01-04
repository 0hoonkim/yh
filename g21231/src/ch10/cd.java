package ch10;

import java.util.Calendar;

public class cd {

	// 이름, 주소, 전화번호 자동 생성기
	static String k1[] = { "010", "02", "031", "032", "041", "051", "053", "063", "062", "044" };
	static String k2[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};

	static String k3[] = { "가", "교", "고", "공", "강", "남", "담", "동", "두", "라", "란", "마", "래", "권", "방", "백", "보", "배",
			"반", "수", "송", "새", "안", "룡", "용", "오", "우", "욱", "을", "장", "재", "조", "종", "주", "중", "지", "창", "찬", "추",
			"충", "해", "한", "호", "후", "영", "진", "현", "형", "로", "완", "환", "권", "흥", "철", "범", "봄", "복", "기", "길", "건",
			"곤", "문", "술", "성" };

	static String k4[] = { "대로", "역로", "도로", "길", "동" };
	static String firstname[] = { "김", "이", "박", "서", "최", "지", "황", "전", "장", "강", "주", "추", "고", "기", "나", "노", "도",
			"라", "우", "조", "하", "권", "백", "방", "배", "안", "현" };

	static String add1[] = { "서울시", "경기", "인천광역시", "전주", "충북", "충남", "전남", "전북", "경남", "경북", "대구광역시", "대전광역시", "부산광역시",
			"강원", "울산광역시", "세종시", "제주시" };
	
	static String e1[] = {"a", "e", "i", "o", "u"};
	static String e2[] = {"b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
	static String e3[] = {"a", "e", "i", "o", "u", "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
	static String e4[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
	static String e5[] = {"@naver.com", "@gamil.com", "@daum.net", "@kakao.com"};
	
	static String g1[] = {"m", "f"};
	
	static String h1[] = {"인터넷", "여행", "게임", "영화", "운동", "독서", "기타"};
	
	static String j1[] = {"회사원", "연구전문직", "교수", "교사", "학생", "일반자영업", "공무원", "의료인", "법조인", "생산직", "영업직", "서비스직", "프리랜서", "종교,언론,에술인", "농,축,수산,광업인", "주부", "무직", "기타"};
	
	static String img[] = {"https://github.com/g2project/main/blob/main/sights/images/p1.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p2.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p3.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p4.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p5.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p6.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p7.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p8.jpg?raw=true",
			"https://github.com/g2project/main/blob/main/sights/images/p1.jpg?raw=true"};
	
	static String cmt[] = {"직접 가 봤는데 너무 멋진 곳이었어요.",
			"제주도는 볼거리 즐길거리가 정말 많은것 같아요.",
			"올 봄에 다녀온 제주도. 기회가 되면 꼭 다시 가보고 싶은 곳입니다.",
			"저녁으로 근처에서 전복 비빔밥과 해물라면을 먹었는데 맛이 끝내줍니다.",
			"근처에 한라봉 주스를 파는 곳이 있더라구요. 꼭 한번 먹어보세요.",
			"산책하기 좋은 곳들로 예쁜 곷들 구경하고 사진 많이 남기고 왔어요. 곳곳에 포토존 많이 있으니 사진 많이 찍으세요.",
			"예쁜 바다 풍경과 주상절리를 감상하는 요트로 1시간 동안 요트를 타 보는것도 좋아요.",
			"지금은 동백꽃이 절정인 시기입니다. 동백꽃 명소인 카멜리아힐에 들어보세요.",
			"한라봉 에이드가 시그니처 메뉴인 정원 카페 마노르 블랑, 꼭 한번 가보세요.",
			"매년 네 가지 꽃 축제를 진행하는 제주 대표 자연생활공원인 휴애리 자연생활공원도 추천합니다.",
			"270만 평 규모의 국내 최대 유기농 축산 농장인 청초밭에서 제주도를 한눈에 내려다 보세요.",
			"1년 내내 다양한 축제가 열리는 정원인 상효원에서 느끼는 제주도의 맑은 자연",
			"제주도 하면 우도, 마라도 두 섬은 꼭 가볼만한 명소입니다.",
			"유람선을 타고 푸른 바다를 가로질로 10분이면 도착하는 차귀도에서 멋진 트래킹도 즐겨요.",
			"요즘 억새꽃이 피어나 장관을 이루고 있습니다. 잘 왔다는 생각이 들어요.",
			"제주도는 바다 위에 봉긋봉긋 솟아 있는 섬들을 관람하는 재미를 빼놓을 수 없죠.",
			"산굼부리에 올라 사방이 확 트인 풍경에 감탄이 절로 났습니다. 수십개의 대형 바람개비가 돌아가는 것도 신기해요.",
			"제주하면 아쿠아 플래닛. 성산에 위치하고 있기에 동부권 일정에 맞춰 들러 보세요.",
			"아쿠아 플래닛 식당에 앉아서 큰 수족관 보며 밥 먹는 장소가 여기 메인이죠.",
			"만장굴은 세계에서 가장 긴 용암동굴로 연중 평균 기온 12도 안팎을 유지해 반팔 차림으로 들어가면 추워요.",
			"한라산에서 내려오는 얼음장 같이 찬 돈내코 원앙폭포. 정말 멋졌어요.",
			"서귀포시 근교에 위치한 솜반천은 사계절 용천수가 스르고 주위가 숲으로 둘러쌓인 도심 속 하천입니다.",
			"지난 휴가때 논짓물에 갔었어요. 넓은 용천수탕과 바다가 이어져 담수와 해수를 동시에 즐길수 있어요.",
			"이름난 명소인 소정방폭포는 정방폭포에서 동쪽으로 300m 정도 떨어진 곳에 위치해 있어요.",
			"제주도의 특산물인 감귤을 직접 먹어볼 수 있는 시기에 제주를 방문해 보세요. 정말 좋습니다.",
			"제주도의 이니스프리 제주하우스에 다녀왔어요. 청정섬이라는 말이 정말 실감나더라구요",
			"제주도예촌에 다녀왔어요. 세계에서 유일하게 돌로 축조된 제주전퉁가마인 석요는 정말 신기했어요.",
			"제주도 지질공원은 화산지형이 원형 그대로 잘 보존돼 지구과학적 가치가 크고, 경관도 아름답습니다.",
			"제주도립미술관에 가보세요. 제주의 자연 속에 세워진 예술의 빛과 숨결이 넘치는 숲속 미술관 입니다.",
			"제주 다랑쉬 오름에 올라 보세요. 정말 멋진 곳입니다.",
			"제주 섭지코지 아침 풍경은 정말 멋져요. 오후엔 바람도 많이 불고 파도도 강하게 쳐서 추웠어요",
			"김영갑 갤러리 두모악에 다녀와 보세요. 정말 고요하고 한적한게 좋습니다."};
	
	/* static String rt[] = {"1", "2", "3", "4", "5"}; */
	static String rt[] = {"2", "3", "4", "5"};
	
	/*
	 * static String place[] = {"성산일출봉", "한라산", "천지연 폭포", "만장굴", "정방폭포", "천제연 폭포",
	 * "우도", "한라산 국립공원", "쇠소깍"};
	 */
	static String place[] = {"성산일출봉", "우도"};
	
	static String birt[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};	
	
	
	
	
	
	
	
	
	// 장소 생성
		public static String getPlace() {
			
	
			String str = place[(int) (Math.random() * place.length)];
			
			return str;
		}
	
	
	// 직업 생성
		public static String getJob() {
			

			String str = j1[(int) (Math.random() * j1.length)];
			
			return str;
		}
	
	// 취미 생성
	public static String getHobby() {
		

		String str = h1[(int) (Math.random() * h1.length)];
		
		return str;
	}
	
	// 우편번호 생성
				public static String getZipcode() {
					

					String str = "";
					
					var lnt = 5;
					for(int i=0; i<lnt; i++) {
						str += e4[(int) (Math.random() * e4.length)];
					}
					
					return str;
				}
	
	// 비밀번호 생성
			public static String getPass() {
				

				String str = e3[(int)(Math.random() * e3.length)];
				
				var lnt = (int)(Math.random()*5+1);
				for(int i=0; i<lnt; i++) {
					str += e4[(int) (Math.random() * e4.length)];
				}
				
				return str;
			}
	
	// 성별 생성
		public static String getGender() {
			

			String str = g1[(int)(Math.random() * g1.length)];
			return str;
		}
	
	// 아이디 생성
	public static String getId() {
		

		String str = e3[(int)(Math.random() * e3.length)];
		
		int lnt = (int)(Math.random()*5 + 1);
		for(int i=0; i<lnt; i++) {
			str += e1[(int) (Math.random() * e1.length)];
		}
	
		lnt = (int)(Math.random()*5);
		for(int i=0; i<lnt; i++) {
			str += e4[(int) (Math.random() * e4.length)];
		}

		return str;
	}

	
	// 이메일 생성
		public static String getEmail() {
			

			String str = e3[(int)(Math.random() * e3.length)];
			
			int lnt = (int)(Math.random()*5);
			for(int i=0; i<lnt; i++) {
				str += e1[(int) (Math.random() * e1.length)];
			}
			
			lnt = (int)(Math.random()*5);
			for(int i=0; i<lnt; i++) {
				str += e2[(int) (Math.random() * e2.length)];
			}
			
			lnt = (int)(Math.random()*5);
			for(int i=0; i<lnt; i++) {
				str += e4[(int) (Math.random() * e4.length)];
			}
			
			lnt = (int)(Math.random()*5);
			for(int i=0; i<lnt; i++) {
				str += e1[(int) (Math.random() * e1.length)];
			}
			
			str += e5[(int) (Math.random() * e5.length)];

			return str;
		}
		
	// 이미지 생성
			public static String getImg() {
				String str = img[(int)(Math.random() * img.length)];
				return str;
			}
			
	// 후기 생성
			public static String getComment() {
				String str = cmt[(int)(Math.random() * cmt.length)];
				return str;
			}	
			
	// 별점 생성
			public static String getRating() {
				String str = rt[(int)(Math.random() * rt.length)];
				return str;
			}				

	// 이름 생성
	public static String getName() {
		String str = firstname[(int) (Math.random() * firstname.length)];
		str += k3[(int) (Math.random() * firstname.length)];
		str += k3[(int) (Math.random() * firstname.length)];

		return str;
	}

	// 주소 생성
	public static String getAddress() {
		String str = add1[(int) (Math.random() * add1.length)];

		if (str.length() < 3)
			str += " " + k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)] + "시 ";
		else
			str += " ";
		str += k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)] + "구 ";
		str += k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)]
				+ k4[(int) (Math.random() * k4.length)] + " ";
		str += (int) (Math.random() * 100 + 1) + "-" + (int) (Math.random() * 100 + 1);

		return str;
	}

	// 전화번호 생성
	public static String getPhone() {
		String str = k1[(int) (Math.random() * k1.length)];

		var lnt = 8;
		for(int i=0; i<lnt; i++) {
			str += k2[(int) (Math.random() * k2.length)];
		}
		
		return str;
	}

	// 날짜 생성
	public static String getDate() {
		return getDate(1980);
	}

	public static String getDate(int startYear) {
		Calendar calendar = Calendar.getInstance();
		int thisYear = calendar.get(Calendar.YEAR);
		int thisMonth = calendar.get(Calendar.MONTH);
		int thisDate = calendar.get(Calendar.DATE);
		
		System.out.println(thisYear);
		System.out.println(thisMonth);
		System.out.println(thisDate);
		
		
		int year = (int) (Math.random() * (thisYear - startYear) + startYear + 1);
		int month = (int) (Math.random() * 12) + 1;
		int date;
		String str = "";

		// 월
		switch (month) {
		case 2:
			date = (int) (Math.random() * 28) + 1;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			date = (int) (Math.random() * 30) + 1;
			break;
		default:
			date = (int) (Math.random() * 31) + 1;
			break;
		}

		// 년월일 체크
		if (year == thisYear && month > thisMonth) {
			month = thisMonth;
		}

		if (year == thisYear && month == thisMonth && date > thisDate) {
			date = thisDate;
		}

		if (month < 10)
			str += year + "0" + month;
		else
			str += year + "" + month;

		if (date < 10)
			str += "0" + date;
		else
			str += "" + date;

		return str;
	}
}


