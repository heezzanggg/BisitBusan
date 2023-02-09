<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
 <%@include file="/WEB-INF/include/menus02.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>BUSAN VISIT</title>
<style>
 
</style>
<script src ="http://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<body>
	<div class ="form1">
		<h1>부산 인기 여행지 TOP6</h1>
		<div class="grid text center">
			<div class="row">
				<c:forEach var="sight" items="${ sightList }">
					<div class = "col-lg-4 col-md-6" >
						<a href="/Info?s_code=${sight.s_code}">
							<img src ="fileupload/sight/${sight.s_name}.jpg" alt="${sight.s_name}" width="350" height="300">
						</a>
						<br>
					    <a href="/Info?s_code=${sight.s_code}">${ sight.s_name }</a>
					</div>
				</c:forEach>
			</div>	
		</div>
	  <hr>
	</div> <!--end form1 -->
	<div class="form2">
		<div class ="grid text center">
				<div class ="row">
					<div class = "col-lg-6">
						<h1>부산 지도</h1>
						<a href="/Maps"><img src = "/img/api.jpg" alt="부산지도일러스트" width="450" height="350"></a>
					</div> 
					<div class = "col-lg-6">
					<div class="api">
						<h1>부산 날씨</h1>
						<br><br>
						<div id ="appi"  class="div1"></div>
					</div>
					</div> 
				</div>
			</div>
		</div>
	</div><!-- end form2 -->

    
</body> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

 <script>

window.onload=function(){
$.ajax({
	url : '/service',
	success : function(json){
		var html = '';
		var date = ""; //날짜넣을변수
		
		var month = new Date().getMonth()+1; //이번달
		var day = new Date().getDate(); //오늘 날짜 구하기
		
		//기본날
		var date1="", date2="", date3="", date4=""; //오늘 내일 모레 글피
		date1 = month + "월" + day     + "일"	;
		date2 = month + "월" + (day+1) + "일";
		date3 = month + "월" + (day+2) + "일";
		date4 = month + "월" + (day+3) + "일";
		date5 = month + "월" + (day+4) + "일";

		
		//월말 경우의 수
		if(month==1||month==3||month==5||month==7||month==8||month==10){ //1,3,5,7,8,10월 => 31일)
			if(day==31){
				date2 = month+1 + "월 1일";
				date3 = month+1 + "월 2일";
				date4 = month+1 + "월 3일";
				date5 = month+1 + "월 4일";

			}else if(day==30){
				date3 = month+1 + "월 1일";
				date4 = month+1 + "월 2일";
				date5 = month+1 + "월 3일";

			}else if(day==29){
				date4 = month+1 + "월 1일";
				date5 = month+1 + "월 2일";
			}
		} 
		else if(month==12){ //12월 => 31일, 해바뀜)
			if(day==31){
				date2 = "1월 1일";
				date3 = "1월 2일";
				date4 = "1월 3일";
				date5 = "1월 4일";

			}else if(day==30){
				date3 = "1월 1일";
				date4 = "1월 2일";
				date5 = "1월 3일";

			}else if(day==29){
				date4 = "1월 1일";
				date5 = "1월 2일";
			}
		}else if(month==4||month==6||month==9||month==11){ //4,6,9,11월 =>30일)
			if(day==30){
				date2 = month+1 + "월 1일";
				date3 = month+1 + "월 2일";
				date4 = month+1 + "월 3일";
				date5 = month+1 + "월 4일";

			}else if(day==29){
				date3 = month+1 + "월 1일";
				date4 = month+1 + "월 2일";
				date5 = month+1 + "월 3일";

			}else if(day==28){
				date4 = month+1 + "월 1일";
				date5 = month+1 + "월 2일";
			}
		}else{ //2월 =>28일 or 29일
			var year = new Date().getFullYear();
			
			if(year = (year%4==0 && year%100!=0) || year%400==0){
				//2월 윤년
				if(day==29){
					date2 = month+1 + "월 1일";
					date3 = month+1 + "월 2일";
					date4 = month+1 + "월 3일";
					date5 = month+1 + "월 4일";

				}else if(day==28){
					date3 = month+1 + "월 1일";
					date4 = month+1 + "월 2일";
					date5 = month+1 + "월 3일";

				}else if(day==27){
					date4 = month+1 + "월 1일";
					date5 = month+1 + "월 2일";

				}
			}else {
				//2월 평년
				if(day==28){
					date2 = month+1 + "월 1일";
					date3 = month+1 + "월 2일";
					date4 = month+1 + "월 3일";
					date5 = month+1 + "월 4일";

				}else if(day==27){
					date3 = month+1 + "월 1일";
					date4 = month+1 + "월 2일";
					date5 = month+1 + "월 3일";

				}else if(day==26){
					date4 = month+1 + "월 1일";
					date5 = month+1 + "월 2일";
				}
			} 
		}//end 월말 경우의
		
		json.response.body.items.item.forEach(function(data,i){	
			var time = String(data.announceTime).substring(8,12); //발표시각의 시간
						
			if(time=="0500"){ //발표시각에 따른 값 
				if(data.numEf==0) {date=date1+" 오전";}
				else if(data.numEf==1) {date=date1+" 오후";}
				else if(data.numEf==2) {date=date2+" 오전";}
				else if(data.numEf==3) {date=date2+" 오후";}
				else if(data.numEf==4) {date=date3+" 오전";}
				else if(data.numEf==5) {date=date3+" 오후";}
				else if(data.numEf==6) {date=date4+" 오전";}
				else {date=date4+" 오후";}
			}else{
				if(data.numEf==0) {date=date1+" 오후";}
				else if(data.numEf==1) {date=date2+" 오전";}
				else if(data.numEf==2) {date=date2+" 오후";}
				else if(data.numEf==3) {date=date3+" 오전";}
				else if(data.numEf==4) {date=date3+" 오후";}
				else if(data.numEf==5) {date=date4+" 오전";}
				else if(data.numEf==6) {date=date4+" 오후";}
				else if(data.numEf==7) {date=date5+" 오전";}
				else if(data.numEf==8) {date=date5+" 오후";}
				//else {date=date4+"오후";}
			}
  		 	
  		 	var weather='';//날씨 아이콘 담을 변수
  		 	if(data.wf=="맑음"){
  		 		weather = 
  		 			"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-sun-fill\" viewBox=\"0 0 16 16\">"
  		 	 		+"<path d=\"M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z\"/>"
  		 			+"</svg>";
  		 	}else if(data.wf=="구름많음"){
  		 		weather = 
  		 			"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cloud-sun-fill\" viewBox=\"0 0 16 16\">"
  		 	  		+"<path d=\"M11.473 11a4.5 4.5 0 0 0-8.72-.99A3 3 0 0 0 3 16h8.5a2.5 2.5 0 0 0 0-5h-.027z\"/>"
  		 	 		 +"<path d=\"M10.5 1.5a.5.5 0 0 0-1 0v1a.5.5 0 0 0 1 0v-1zm3.743 1.964a.5.5 0 1 0-.707-.707l-.708.707a.5.5 0 0 0 .708.708l.707-.708zm-7.779-.707a.5.5 0 0 0-.707.707l.707.708a.5.5 0 1 0 .708-.708l-.708-.707zm1.734 3.374a2 2 0 1 1 3.296 2.198c.199.281.372.582.516.898a3 3 0 1 0-4.84-3.225c.352.011.696.055 1.028.129zm4.484 4.074c.6.215 1.125.59 1.522 1.072a.5.5 0 0 0 .039-.742l-.707-.707a.5.5 0 0 0-.854.377zM14.5 6.5a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z\"/>"
  		 			+"</svg>";
  		 	}else{//흐림
  		 		weather=
  		 			"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-clouds-fill\" viewBox=\"0 0 16 16\">"
  		 	  		+"<path d=\"M11.473 9a4.5 4.5 0 0 0-8.72-.99A3 3 0 0 0 3 14h8.5a2.5 2.5 0 1 0-.027-5z\"/>"
  		 	 		 +"<path d=\"M14.544 9.772a3.506 3.506 0 0 0-2.225-1.676 5.502 5.502 0 0 0-6.337-4.002 4.002 4.002 0 0 1 7.392.91 2.5 2.5 0 0 1 1.17 4.769z\"/>"
  		 			+"</svg>";
  		 	}
  		 	
			var raintype=""; //강수형태

  		 	if(data.rnYn == 0){
  		 		raintype = weather;
 			} else if(data.rnYn == 1){//비
 				raintype = 
 					"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cloud-rain-heavy-fill\" viewBox=\"0 0 16 16\">"
 				  		+"<path d=\"M4.176 11.032a.5.5 0 0 1 .292.643l-1.5 4a.5.5 0 0 1-.936-.35l1.5-4a.5.5 0 0 1 .644-.293zm3 0a.5.5 0 0 1 .292.643l-1.5 4a.5.5 0 0 1-.936-.35l1.5-4a.5.5 0 0 1 .644-.293zm3 0a.5.5 0 0 1 .292.643l-1.5 4a.5.5 0 0 1-.936-.35l1.5-4a.5.5 0 0 1 .644-.293zm3 0a.5.5 0 0 1 .292.643l-1.5 4a.5.5 0 0 1-.936-.35l1.5-4a.5.5 0 0 1 .644-.293zm.229-7.005a5.001 5.001 0 0 0-9.499-1.004A3.5 3.5 0 1 0 3.5 10H13a3 3 0 0 0 .405-5.973z\"/>"
 					 		+"</svg>";
 			} else if(data.rnYn == 2){//비and눈
 				raintype = 
 					"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cloud-sleet-fill\" viewBox=\"0 0 16 16\">"
 						 +"<path d=\"M2.375 13.5a.25.25 0 0 1 .25.25v.57l.501-.287a.25.25 0 0 1 .248.434l-.495.283.495.283a.25.25 0 1 1-.248.434l-.501-.286v.569a.25.25 0 1 1-.5 0v-.57l-.501.287a.25.25 0 1 1-.248-.434l.495-.283-.495-.283a.25.25 0 1 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm1.849-2.447a.5.5 0 0 1 .223.67l-.5 1a.5.5 0 0 1-.894-.447l.5-1a.5.5 0 0 1 .67-.223zM6.375 13.5a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 1 1-.248.434l-.501-.286v.569a.25.25 0 1 1-.5 0v-.57l-.501.287a.25.25 0 1 1-.248-.434l.495-.283-.495-.283a.25.25 0 1 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm1.849-2.447a.5.5 0 0 1 .223.67l-.5 1a.5.5 0 0 1-.894-.447l.5-1a.5.5 0 0 1 .67-.223zm2.151 2.447a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 1 1-.248.434l-.501-.286v.569a.25.25 0 0 1-.5 0v-.57l-.501.287a.25.25 0 1 1-.248-.434l.495-.283-.495-.283a.25.25 0 1 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm1.849-2.447a.5.5 0 0 1 .223.67l-.5 1a.5.5 0 1 1-.894-.447l.5-1a.5.5 0 0 1 .67-.223zm1.181-7.026a5.001 5.001 0 0 0-9.499-1.004A3.5 3.5 0 1 0 3.5 10H13a3 3 0 0 0 .405-5.973z\"/>"
 							 +"</svg>";
 			} else if (dadta.rnYn == 3){//눈
 				raintype = 
 					"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cloud-snow-fill\" viewBox=\"0 0 16 16\">"
 					  +"<path d=\"M2.625 11.5a.25.25 0 0 1 .25.25v.57l.501-.287a.25.25 0 0 1 .248.434l-.495.283.495.283a.25.25 0 0 1-.248.434l-.501-.286v.569a.25.25 0 1 1-.5 0v-.57l-.501.287a.25.25 0 0 1-.248-.434l.495-.283-.495-.283a.25.25 0 0 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm2.75 2a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 0 1-.248.434l-.501-.286v.569a.25.25 0 1 1-.5 0v-.57l-.501.287a.25.25 0 0 1-.248-.434l.495-.283-.495-.283a.25.25 0 0 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm5.5 0a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 0 1-.248.434l-.501-.286v.569a.25.25 0 0 1-.5 0v-.57l-.501.287a.25.25 0 0 1-.248-.434l.495-.283-.495-.283a.25.25 0 0 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm-2.75-2a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 0 1-.248.434l-.501-.286v.569a.25.25 0 1 1-.5 0v-.57l-.501.287a.25.25 0 0 1-.248-.434l.495-.283-.495-.283a.25.25 0 0 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm5.5 0a.25.25 0 0 1 .25.25v.57l.5-.287a.25.25 0 0 1 .249.434l-.495.283.495.283a.25.25 0 0 1-.248.434l-.501-.286v.569a.25.25 0 0 1-.5 0v-.57l-.501.287a.25.25 0 1 1-.248-.434l.495-.283-.495-.283a.25.25 0 0 1 .248-.434l.501.286v-.569a.25.25 0 0 1 .25-.25zm-.22-7.223a5.001 5.001 0 0 0-9.499-1.004A3.5 3.5 0 1 0 3.5 10.25H13a3 3 0 0 0 .405-5.973z\"/>"
 						 +"</svg>";
 			} else{//소나기
 				raintype = 
 					"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cloud-rain-fill\" viewBox=\"0 0 16 16\">"
 						  +"<path d=\"M4.158 12.025a.5.5 0 0 1 .316.633l-.5 1.5a.5.5 0 1 1-.948-.316l.5-1.5a.5.5 0 0 1 .632-.317zm3 0a.5.5 0 0 1 .316.633l-1 3a.5.5 0 1 1-.948-.316l1-3a.5.5 0 0 1 .632-.317zm3 0a.5.5 0 0 1 .316.633l-.5 1.5a.5.5 0 1 1-.948-.316l.5-1.5a.5.5 0 0 1 .632-.317zm3 0a.5.5 0 0 1 .316.633l-1 3a.5.5 0 1 1-.948-.316l1-3a.5.5 0 0 1 .632-.317zm.247-6.998a5.001 5.001 0 0 0-9.499-1.004A3.5 3.5 0 1 0 3.5 11H13a3 3 0 0 0 .405-5.973z\"/>"
 							 +"</svg>";
 			}
  		 	
			html +='<div><h5>'+date+'&nbsp;&nbsp;&nbsp;'+data.ta+'℃&nbsp;&nbsp;&nbsp;'+raintype+'</h5></div>';

			})
		
		$('.div1').html(html);
		},//end success
	error : function(xhr){
		$('.div1').html("날씨정보를 알 수 없습니다.");
		}//end error
	})
}

</script>

</html>