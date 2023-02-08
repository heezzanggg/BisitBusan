<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/include/menus02.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');

.picture-text p{

}

#empty-div {
  margin-top:11%;
}

* {
  font-family: 'Song Myung', serif;
}

.the-hr {
 margin-top:10%;
}
.hrsort {
 border-width:2px;
 color:black;
 width:100%;
}
.main_div {
 background-color : #fff;
}
.outer_text {
 text-align:left;
 margin-left:15%;
 margin-bottom:2%;
 margin-top:2%;
}
.swiper-container  {
   width:83%;
   margin : 0 auto;
   margin-left: 10%;
}
.swiper1 .swiper-button-next {
   position:absolute;
   right:6%;
   color:black;
}
.swiper-wrapper{
   display:flex;
}
.swiper-slide img {
   position:relative;
   width:380px;
}
.swiper2 .swiper-button-next {
   position:absolute;
   right:7%;
   color:black;
 }
.hrsort2 {
  border-width:2px;
  float:left;
  width:380px;
}
.picture-text {
  
}
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');
 b {
 color: orange;
} 
.recomm-text {
 text-align:left;  
 margin-left:15%;
 margin-bottom:5%;
 display:inline-block;
}
.dropdown {
  float:right;
  display : inline-block;
  margin-bottom:5%;
  margin-right:18%;
}
.dropbtn_icon {
  font-family : 'Material Icons';
  float:left;
}
.dropbtn {
  border : 1px solid rgb(37, 37, 37);
  border-radius : 4px;
  background-color: #f5f5f5;
  font-weight: 400;
  color : rgb(37, 37, 37);
  padding : 12px;
  width :250px;
  text-align: left;
  cursor : pointer;
  font-size : 13px;
}  
.dropdown-content {
  display : none;
  position : absolute;
  z-index : 1;
  font-weight: 400;
  background-color: #f9f9f9;
  min-width : 250px;
}
.dropdown-content a {
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
}
.dropdown-content a:hover {
  background-color : #ececec
}
.dropdown:hover .dropdown-content {
  display: block;
}    
.divide {
  margin: 0 auto;
  width:1280px;
  border: none;
  height:2px;
  background-color: black;
}
</style>
<meta charset="UTF-8">
<title>BUSAN VISIT</title>
</head>
<body>
  <div class="site_total">

  <main>
    <div class="main_div">
        <div class="recomm">
          <div class="recomm-text">
             <h1><b>일단 추천</b> 해드릴게요</h1>
         </div>
      <div class="dropdown"  >
            <button class="dropbtn" type="submit" > 
              <span class="dropbtn_icon">테마 선택하기 </span>
            </button>
            <div class="dropdown-content" >
              <a href="/Gohistory">역사</a>
              <a href="/Gonature">자연</a>
              <a href="/Goculture">문화</a>
              <a href="/Gopark">공원</a>
            </div>
      </div>
      </div>
      <hr class="divide">
         <div class="outer_text">
             <h1><b>1박2일</b> 추천</h1>
       </div>

<!-- 구분용 swiper1 추가 -->
<div class="swiper-container swiper1">
   <div class="swiper-wrapper">
      <div class="swiper-slide">
      <div class="picture-text"><p>도시어촌 힐링코스 1박 2일</p><hr class="hrsort2"></div>
      <a href="/ex_redirect1" >
      <img src="/img/2022112201.jpg" alt="도시어촌 힐링코스">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>부산 속 해외 감성 뿜뿜 1박 2일</p><hr class="hrsort2"></div>
      <a href="/ex_redirect2" >
      <img src="/img/2022112202.jpg" alt="부산 속 해외 감성">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>나 홀로 떠나는 광안리 여행</p><hr class="hrsort2"></div>
      <a href="/ex_redirect3" >
      <img src="/img/2022112203.jpg" alt="나 홀로 광안리 여행">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>일은 호텔에서, 퇴근은 바다로! 워케이션 인 부산</p><hr class="hrsort2"></div>
      <a href="/ex_redirect4" >
      <img src="/img/2022112204.jpg" alt="워케이션 인 부산">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>우리 동네 골목 투어</p><hr class="hrsort2"></div>
      <a href="ex_redirect5" >
      <img src="/img/2022112205.jpg" alt="우리 동네 골목 투어">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>동부산 힐링 가족여행! 해운대 기장</p><hr class="hrsort2"></div>
      <a href="ex_redirect6" >
      <img src="/img/2022112206.jpg" alt="동부산 힐링 가족여행">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>야외 힐링 여행지! 오륙도에서 금정산까지</p><hr class="hrsort2"></div>
      <a href="ex_redirect7" >
      <img src="/img/2022112207.jpg" alt="오륙도에서 금정산까지">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>야외 힐링 여행지! 이번엔 영도 송도</p><hr class="hrsort2"></div>
      <a href="ex_redirect8" >
      <img src="/img/2022112208.jpg" alt="영도 송도 힐링 여행">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>두 마리 토끼, 서부산과 동부산을 잡자</p><hr class="hrsort2"></div>
      <a href="ex_redirect9" >
      <img src="/img/2022112209.jpg" alt="서부산과 동부산을 잡자">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>1박 2일에 완성하는 부산 해안선 완전 정복!</p><hr class="hrsort2"></div>
      <a href="ex_redirect10" >
      <img src="/img/2022112210.jpg" alt="부산 해안선 완전 정복">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>동해바다의 화려함, 남해바다의 잔잔함을 느끼는 부산여행</p><hr class="hrsort2"></div>
      <a href="ex_redirect11" >
      <img src="/img/2022112211.jpg" alt="동해 남해 부산여행">
      </a></div>
   </div>

   <!-- 네비게이션 버튼 -->
   <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
   <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
   <!-- 페이징 -->
   <div class="swiper-pagination"></div>

</div>


<br>
 <div class="outer_text">
       <h1><b>2박3일</b> 추천</h1>
    </div>
<!-- 구분용 swiper2 추가 -->
<div class="swiper-container swiper2">
   <div class="swiper-wrapper">
      <div class="swiper-slide">
      <div class="picture-text"><p>봄바람 부는 섬으로 떠나는 2박 3일 부산여행</p><hr class="hrsort2"></div>
      <a href="ex_redirect12" >
      <img src="/img/2022112212.jpg" alt="봄바람 섬으로 떠나는 부산여행">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>친구들과 함께하는 2박 3일 부산 뚜벅이 여행 코스 추천!</p><hr class="hrsort2"></div>
      <a href="ex_redirect13" >
      <img src="/img/2022112213.jpg" alt="2박 3일 부산 뚜벅이 여행 코스 추천">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>부산 원도심의 이야기를 품에 안고 바다로 간다</p><hr class="hrsort2"></div>
      <a href="ex_redirect14" >
      <img src="/img/2022112214.jpg" alt="원도심의 이야기를 품고 바다로 간다">
      </a></div>
      <div class="swiper-slide">
      <div class="picture-text"><p>2박 3일에 완성하는 부산 완전정복</p><hr class="hrsort2"></div>
      <a href="ex_redirect15" >
      <img src="/img/2022112215.jpg" alt="2박 3일에 완성하는 부산 완전정복">
      </a></div>
   </div>
      
   <!-- 네비게이션 버튼 -->
   <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
   <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
   
   <!-- 페이징 -->
   <div class="swiper-pagination"></div>
</div>
<div id="empty-div"></div>
</div>
</main>
</div>
  <script>
//swiper1
var swiper1 = new Swiper ('.swiper1', {
      slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
      slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
       
     loop : true, // 무한 루프 슬라이드, 반복이 되며 슬라이드가 끝이 없다.
      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      loopFillGroupWithBlank : true,
     pagination : { // 페이징 설정
        el : '.swiper-pagination',
        clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
     },
     navigation : { // 네비게이션 설정
        nextEl : '.swiper-button-next', // 다음 버튼 클래스명
        prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
     },

  });

  // swiper2
  var swiper2 = new Swiper ('.swiper2', {
     slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
      slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
        loop : true, // 무한 루프 슬라이드, 반복이 되며 슬라이드가 끝이 없다.
        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      loopFillGroupWithBlank : true,
     pagination : {
        el : '.swiper-pagination',
        clickable : true,
      },
       navigation : { // 네비게이션 설정
          nextEl : '.swiper-button-next', // 다음 버튼 클래스명
          prevEl : '.swiper-button-prev', //  이번 버튼 클래스명 
     },
  });
  </script>
</body>
</html>



