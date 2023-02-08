<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"href="/css/common.css"/>

    <header>
      <div class="title">
        <div class="title_text">
            <h1>BUSAN VISIT</h1>
            <div class = "lsls">
             <h5>${ sessionScope.thisid }님 환영합니다 </h5>
             <h6><a href="/logout">로그아웃</a></h6>
             </div> 
        </div>
      </div>
  </header>
   
   <div class="button_container"style="display: flex; justify-content: center;">
   <div class="container"style="display:flex; justify=content:left">
  <div class="button">
    <div class="eff-1"></div>
    <a href="/Sight"> 명 소 </a>
  </div>

  <div class="button">
    <div class="eff-1"></div>
    <a href="/Festival"> 축 제 </a>
  </div>
  <div class="button">
    <div class="eff-1"></div>
    <a href="/Recog"> 일단 추천 </a>
  </div>
  <div class="button">
    <div class="eff-1"></div>
    <a href="/Board/List"> 게시판 </a>
  </div>
  <div class="button">
    <div class="eff-1"></div>
    <a href="/Main"> 홈으로 </a>
  </div>
  </div>
  </div>
  