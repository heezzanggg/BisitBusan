<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>BUSAN VISIT</title>
    <style>
    


body{
	margin:0px;
}
#mapwrap{position:relative;overflow:hidden;}
#mapwrap > #map > div > div > div > div > .wrap{margin-left:-200px !important;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png') no-repeat;} 
.category .ico_coffee {background-size: 20px 28px; background-position:0px 0px;}  
.category .ico_store {background-size: 20px 28px; background-position:0px 0px;}   
.category .ico_carpark {background-size: 20px 28px; background-position:0px 0px;} 

.wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 400px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .next {position: absolute;top: 92px;right: 10px;color: #888;width: 17px;height: 17px;background: url('/fileload/sight/화살표.png');}
.info .next:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 5px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
@import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');

.btn-3d.green {
   position:absolute; left:168px; top:6px;z-index:9; padding:13px;
  background-color: #E8F0F2;
  box-shadow: 0 0 0 1px #E8F0F2 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(126, 194, 155, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
         font-family: 'Song Myung', serif;
}
.btn-3d.green:active {
  box-shadow: 0 0 0 1px #82c8a0 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}
</style>

<script src ="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>


 </script>
</head>

<body>
<div class="btn-container">
  <a href="/Main" class="btn-3d green">Back</a>
</div>
<div id="mapwrap"> 

    <!-- 지도가 표시될 div   style="position:absolute; z-index:9; padding:100px;">-->
    <div id="map" style="width:100%;height:100vh;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <input type = "button" style= background-color:#1BBC9B;margin-bottom:5px;z-index:8;color:white;onClick="location.href='/Main'"></div>
    <div class="category">
        <ul>
            <li id="coffeeMenu" onclick="changeMarker('coffee')">
                <span class="ico_comm ico_coffee"></span>
                명소
            </li>
            <li id="storeMenu" onclick="changeMarker('store')">
                <span class="ico_comm ico_store"></span>
                축제
            </li>
            <li id="carparkMenu" onclick="changeMarker('carpark')">
                <span class="ico_comm ico_carpark"></span>
                전체
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da4df8479f2b43832aaba6ccb6bc108c"></script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.173988, 129.080555), // 지도의 중심좌표 
        level: 8 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var mapTypeControl = new kakao.maps.MapTypeControl();
// 커피숍 마커가 표시될 좌표 배열입니다
var coffeePositions = [ 
	new kakao.maps.LatLng(35.1295178,129.094151),
	new kakao.maps.LatLng(35.1019518,129.0345919),
	new kakao.maps.LatLng(35.076122,129.017298),
	new kakao.maps.LatLng(35.17827,129.199126),
	new kakao.maps.LatLng(35.097635,129.120893),
	new kakao.maps.LatLng(35.1547966,129.144653),
	new kakao.maps.LatLng(35.1769907,129.1154605),
	new kakao.maps.LatLng(35.154865,129.062732),
	new kakao.maps.LatLng(35.1211379,129.0167921),
	new kakao.maps.LatLng(35.1710871,129.1139105),
	new kakao.maps.LatLng(35.2510047,129.0427975),
	new kakao.maps.LatLng(35.1681608,129.0573853),
	new kakao.maps.LatLng(35.1006536,129.0326226),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.1545716,129.1329907),
	new kakao.maps.LatLng(35.1706486,129.1254273),
	new kakao.maps.LatLng(35.1100718,129.0280727),
	new kakao.maps.LatLng(35.1846343,129.0434794),
	new kakao.maps.LatLng(35.1641542,129.0648058),
	new kakao.maps.LatLng(35.2057006,129.2276931),
	new kakao.maps.LatLng(35.2201331,129.0738073),
	new kakao.maps.LatLng(35.1599375,129.1698125),
	new kakao.maps.LatLng(35.172711,128.9853636),
	new kakao.maps.LatLng(35.0973904,129.0105924),
	new kakao.maps.LatLng(35.1883491,129.2233197),
	new kakao.maps.LatLng(35.0783256,129.0798565),
	new kakao.maps.LatLng(35.2839899,129.0687639),
	new kakao.maps.LatLng(35.1031252,129.0274609),
	new kakao.maps.LatLng(35.1198148,129.029509),
	new kakao.maps.LatLng(35.1711778,129.1271956),
	new kakao.maps.LatLng(35.1689766,129.1360411),
	new kakao.maps.LatLng(35.1940316,129.0615183),
	new kakao.maps.LatLng(35.301617,129.185367),
	new kakao.maps.LatLng(35.272772,129.137896),
	new kakao.maps.LatLng(35.061884,129.022211),
	new kakao.maps.LatLng(35.360046,129.239801),
	new kakao.maps.LatLng(35.158601,129.160001),
	new kakao.maps.LatLng(35.078255,129.045316),
	new kakao.maps.LatLng(35.046999,128.966551),
	new kakao.maps.LatLng(35.046999,128.966551),
	new kakao.maps.LatLng(35.052544,128.960647),
	new kakao.maps.LatLng(35.152813,129.118218),
	new kakao.maps.LatLng(35.0930473,129.0374683),
	new kakao.maps.LatLng(35.1249213,129.0743458),
	new kakao.maps.LatLng(35.1039739,129.0346464),
	new kakao.maps.LatLng(35.1026721,129.031176),
	new kakao.maps.LatLng(35.1042116,129.0191299),
	new kakao.maps.LatLng(35.2101539,129.0894131),
	new kakao.maps.LatLng(35.2083599,129.0914505),
	new kakao.maps.LatLng(35.1034532,129.0174521),
	new kakao.maps.LatLng(35.1279039,129.0961877)
               
];

// 편의점 마커가 표시될 좌표 배열입니다
var storePositions = [
	new kakao.maps.LatLng(35.1711778,129.1271956),
	new kakao.maps.LatLng(35.2118622,129.0899982),
	new kakao.maps.LatLng(35.0966394,129.0305933),
	new kakao.maps.LatLng(35.1142633,129.0380202),
	new kakao.maps.LatLng(35.0457857,128.968704),
	new kakao.maps.LatLng(35.1537821,129.1185399),
	new kakao.maps.LatLng(35.0990683,129.031487),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.056739,129.086336),
	new kakao.maps.LatLng(35.171074,129.126709),
	new kakao.maps.LatLng(35.158367,129.159007),
	new kakao.maps.LatLng(35.152502,129.118065),
	new kakao.maps.LatLng(35.046338,128.967912),
	new kakao.maps.LatLng(35.076122,129.017298),
	new kakao.maps.LatLng(35.17827,129.199126),
	new kakao.maps.LatLng(35.2048909,128.982775),
	new kakao.maps.LatLng(35.0961559,129.0089071),
	new kakao.maps.LatLng(35.209882,128.972345),
	new kakao.maps.LatLng(35.2247703,129.2301119),
	new kakao.maps.LatLng(35.2722418,129.245967),
	new kakao.maps.LatLng(35.1537821,129.1185399),
	new kakao.maps.LatLng(35.1173881,129.0487465),
	new kakao.maps.LatLng(35.1899786,129.0582686),
	new kakao.maps.LatLng(35.220095,128.9994207),
	new kakao.maps.LatLng(35.1006536,129.0326226),
	new kakao.maps.LatLng(35.1754288,129.0433882),
	new kakao.maps.LatLng(35.2755,129.0575042),
	new kakao.maps.LatLng(35.158697,129.1603842)
];

// 주차장 마커가 표시될 좌표 배열입니다
var carparkPositions = [
	new kakao.maps.LatLng(35.1295178,129.094151),
	new kakao.maps.LatLng(35.1019518,129.0345919),
	new kakao.maps.LatLng(35.076122,129.017298),
	new kakao.maps.LatLng(35.17827,129.199126),
	new kakao.maps.LatLng(35.097635,129.120893),
	new kakao.maps.LatLng(35.1547966,129.144653),
	new kakao.maps.LatLng(35.1769907,129.1154605),
	new kakao.maps.LatLng(35.154865,129.062732),
	new kakao.maps.LatLng(35.1211379,129.0167921),
	new kakao.maps.LatLng(35.1710871,129.1139105),
	new kakao.maps.LatLng(35.2510047,129.0427975),
	new kakao.maps.LatLng(35.1681608,129.0573853),
	new kakao.maps.LatLng(35.1006536,129.0326226),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.1545716,129.1329907),
	new kakao.maps.LatLng(35.1706486,129.1254273),
	new kakao.maps.LatLng(35.1100718,129.0280727),
	new kakao.maps.LatLng(35.1846343,129.0434794),
	new kakao.maps.LatLng(35.1641542,129.0648058),
	new kakao.maps.LatLng(35.2057006,129.2276931),
	new kakao.maps.LatLng(35.2201331,129.0738073),
	new kakao.maps.LatLng(35.1599375,129.1698125),
	new kakao.maps.LatLng(35.172711,128.9853636),
	new kakao.maps.LatLng(35.0973904,129.0105924),
	new kakao.maps.LatLng(35.1883491,129.2233197),
	new kakao.maps.LatLng(35.0783256,129.0798565),
	new kakao.maps.LatLng(35.2839899,129.0687639),
	new kakao.maps.LatLng(35.1031252,129.0274609),
	new kakao.maps.LatLng(35.1198148,129.029509),
	new kakao.maps.LatLng(35.1711778,129.1271956),
	new kakao.maps.LatLng(35.1689766,129.1360411),
	new kakao.maps.LatLng(35.1940316,129.0615183),
	new kakao.maps.LatLng(35.301617,129.185367),
	new kakao.maps.LatLng(35.272772,129.137896),
	new kakao.maps.LatLng(35.061884,129.022211),
	new kakao.maps.LatLng(35.360046,129.239801),
	new kakao.maps.LatLng(35.158601,129.160001),
	new kakao.maps.LatLng(35.078255,129.045316),
	new kakao.maps.LatLng(35.046999,128.966551),
	new kakao.maps.LatLng(35.046999,128.966551),
	new kakao.maps.LatLng(35.052544,128.960647),
	new kakao.maps.LatLng(35.152813,129.118218),
	new kakao.maps.LatLng(35.0930473,129.0374683),
	new kakao.maps.LatLng(35.1249213,129.0743458),
	new kakao.maps.LatLng(35.1039739,129.0346464),
	new kakao.maps.LatLng(35.1026721,129.031176),
	new kakao.maps.LatLng(35.1042116,129.0191299),
	new kakao.maps.LatLng(35.2101539,129.0894131),
	new kakao.maps.LatLng(35.2083599,129.0914505),
	new kakao.maps.LatLng(35.1034532,129.0174521),
	new kakao.maps.LatLng(35.1279039,129.0961877),
	new kakao.maps.LatLng(35.1711778,129.1271956),
	new kakao.maps.LatLng(35.2118622,129.0899982),
	new kakao.maps.LatLng(35.0966394,129.0305933),
	new kakao.maps.LatLng(35.1142633,129.0380202),
	new kakao.maps.LatLng(35.0457857,128.968704),
	new kakao.maps.LatLng(35.1537821,129.1185399),
	new kakao.maps.LatLng(35.0990683,129.031487),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1582327,129.1615639),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.1687484,128.9735403),
	new kakao.maps.LatLng(35.056739,129.086336),
	new kakao.maps.LatLng(35.171074,129.126709),
	new kakao.maps.LatLng(35.158367,129.159007),
	new kakao.maps.LatLng(35.152502,129.118065),
	new kakao.maps.LatLng(35.046338,128.967912),
	new kakao.maps.LatLng(35.076122,129.017298),
	new kakao.maps.LatLng(35.17827,129.199126),
	new kakao.maps.LatLng(35.2048909,128.982775),
	new kakao.maps.LatLng(35.0961559,129.0089071),
	new kakao.maps.LatLng(35.209882,128.972345),
	new kakao.maps.LatLng(35.2247703,129.2301119),
	new kakao.maps.LatLng(35.2722418,129.245967),
	new kakao.maps.LatLng(35.1537821,129.1185399),
	new kakao.maps.LatLng(35.1173881,129.0487465),
	new kakao.maps.LatLng(35.1899786,129.0582686),
	new kakao.maps.LatLng(35.220095,128.9994207),
	new kakao.maps.LatLng(35.1006536,129.0326226),
	new kakao.maps.LatLng(35.1754288,129.0433882),
	new kakao.maps.LatLng(35.2755,129.0575042),
	new kakao.maps.LatLng(35.158697,129.1603842)
                                    
];  


var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

 let Overlay=[],
     Overlay2=[],
     Overlay3=[];
var clickedOverlay=null;


var tloc_Lng="";
var sloc_Lng="";
var totloc_Lng="";
createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

changeMarker(); // 지도에 커피숍 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: coffeePositions,
        image: image
    });
    
    return marker;  
}   

   

// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCoffeeMarkers() {
    
	coffeePositions.forEach(function(cof){
		
		
		var imageSize = new kakao.maps.Size(28, 30),
	    imageOptions = {  
	        spriteOrigin: new kakao.maps.Point(0,0),    
	        spriteSize: new kakao.maps.Size(20, 30),
	   		};  
		
		
		 // 마커이미지와 마커를 생성합니다
		 var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);    
		 var marker = new kakao.maps.Marker({
		        position: new kakao.maps.LatLng(cof.getLat(), cof.getLng()),		        
		        image: markerImage,
		      });
		    kakao.maps.event.addListener(marker,'click', function() {
		 
							
							tloc_Lng = cof.getLng();
							$.ajax( {
								   url  :  'Test32'  ,  
								    data :  {tloc_Lng  : tloc_Lng}, 
							    method   : "POST"
							} )
							.done(function( result, textStatus, xhr ) {
								   console.log( result );
								  // var resultStr = JSON.stringify( result ); // JSOn -> string
								   
								   var s_name       = result[0].s_name;
								   var s_date       = result[0].s_date;
								   var s_address    = result[0].s_address;
								   var s_fee       = result[0].s_fee;
								   var s_tel       = result[0].s_tel;
								   var s_hp       = result[0].s_hp;
								   var s_code      = result[0].s_code;
								  
								   
								    var content = '<div class="wrap">' + 
								    '    <div class="info">' + 
								    '        <div class="title"><a href=/Info?s_code=' + s_code + '>' + s_name + 
								    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
								    '        </div>' + 
								    '        <div class="body">' + 
								    '            <div class="img"><a href=/Info?s_code=' + s_code + '>' +
								    '                <img width="73" height="70" src="/fileupload/sight/'+s_name+'.jpg">' +
								    '           </a></div>' + 
								    '            <div class="desc">' + 
								    '                <div class="ellipsis"> 주 소 : '+s_address+'</div>' + 
								    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
								    '                <div>홈페이지 : <a href='+s_hp+'>홈페이지</a></div>' + 
								    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
								    '                <div>전화번호 : '+s_tel+'</div>' + 
								    '                <div>영업시간 : '+s_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+s_fee+'</div>' + 
								    '                <div>'+s_date+'</div>' + 
								    '            </div>' + 
								    '        </div>' + 
								    '    </div>' +    
								    '</div>';
									var overlay = new kakao.maps.CustomOverlay({
										content: content,
									    position: marker.getPosition()
									});
									Overlay.push(overlay);
									
									 if (clickedOverlay){
								        	clickedOverlay.setMap(null);
								        } 
								        overlay.setMap(map);
								        clickedOverlay = overlay;
								   
								   $('#result1').html(  );
							})
							.fail(function(error, textStatus, errorThrown ) {
								   console.log ( error );
								   alert('Error:' + error)
							});
		        
			});
		coffeeMarkers.push(marker);
		 
		 
  })
}

function closeOverlay() {
	
    for(let i=0; i<Overlay.length; i++){
      Overlay[i].setMap(null);
    }
  }





// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCoffeeMarkers(map) {        
    for (var i = 0; i < coffeeMarkers.length; i++) { 
    	coffeeMarkers[i].setMap(map);
    }        
}
//축제  인포윈도우를 변하게 하기위해 데이터를 변수로
var f_name       = ""
var f_date       = ""
var f_address    = ""
var f_fee       = ""
var f_tel       = ""
var f_hp       = ""
var f_code     =""
var cntt = 0;
var index = 0;
let co;
let mma;



function Display(marker, result, Overlay2, clickedOverlay2){

	console.log(cntt);
	   f_name       = result[cntt].f_name;
	   f_date       = result[cntt].f_date;
	   f_address    = result[cntt].f_address;
	   f_fee       = result[cntt].f_fee;
	   f_tel       = result[cntt].f_tel;
	   f_hp       = result[cntt].f_hp; 
	   f_code     = result[cntt].f_code;
	   
	  
	   
	   
	
	   
	   
	   
	   var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title"><a href=/InfoFes?f_code=' + f_code + '>' + f_name + 
	    '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img"><a href=/InfoFes?f_code=' + f_code + '>' +
	    '                <img width="73" height="70" src="/fileupload/festival/'+f_name+'.jpg">' +
	    '           </a></div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis"> 주 소 :'+f_address+'</div>' + 
	    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
	    '                <div> 홈페이지 : <a href='+f_hp+'>홈페이지</a></div>' + 
	    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
	    '                <div> 전화번호 : '+f_tel+'</div>' + 
	    '                <div> 축제일정 : '+f_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+f_fee+'<button name = "button"> >> </button></div>' + 
	    '                <div>'+f_date+'</div>' + 
	    '            </div>' + 
	    '        </div>' + 
	    '    </div>' +    
	    '</div>';
	    
	   
	   
	
		var overlay2 = new kakao.maps.CustomOverlay({//오버레이생성
			content: content,//컨텐트 추가
		    position: marker.getPosition()//위치추가
		});
		Overlay2.push(overlay2);//Overlay2배열에 overaly추가
		clickedOverlay2 = overlay2;
		console.log(Overlay2);
		 if (clickedOverlay2){
	        	clickedOverlay2.setMap(null);
	        	Overlay2=null;
	        } 
	        overlay2.setMap(map);
	        clickedOverlay2 = overlay2;
}

function Display2(){

	cntt = index%co.length;
	index++;
	//cntt +=1;

	for(let i=0; i<Overlay2.length; i++){
				Overlay2[i].setMap(null);
	}
	
	f_name       = co[cntt].f_name;
   f_date       = co[cntt].f_date;
   f_address    = co[cntt].f_address;
   f_fee       = co[cntt].f_fee;
   f_tel       = co[cntt].f_tel;
   f_hp       = co[cntt].f_hp;
   f_code     = co[cntt].f_code;
	//오버레이 띄우기
	var content = '<div class="wrap">' + 
					    '    <div class="info">' + 
					    '        <div class="title"><a href=/InfoFes?f_code=' + f_code + '>' + f_name + 
					    '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
					    '        </div>' + 
					    '        <div class="body">' + 
					    '            <div class="img"><a href=/InfoFes?f_code=' + f_code + '>' +
					    '                <img width="73" height="70" src="/fileupload/festival/'+f_name+'.jpg">' +
					    '           </a></div>' + 
					    '            <div class="desc">' + 
					    '                <div class="ellipsis"> 주 소 :'+f_address+'</div>' + 
					    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
					    '                <div> 홈페이지 : <a href='+f_hp+'>홈페이지</a></div>' + 
					    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
					    '                <div> 전화번호 : '+f_tel+'</div>' + 
					    '                <div> 축제일정 : '+f_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+f_fee+'<input type="button" id = "button" onclick="Display2()"  value=">>"></input></div>' + 
					    '                <div>'+f_date+'</div>' + 
					    '            </div>' + 
					    '        </div>' + 
					    '    </div>' +    
					    '</div>';

					var overlay2 = new kakao.maps.CustomOverlay({
							content: content,
						    position: mma.getPosition()
						});
						
						Overlay2.push(overlay2);
						overlay2.setMap(map);

		
	
}
// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createStoreMarkers() {
	
	storePositions.forEach(function(sof){//축제 포지션 위치개수만큼 반복
		
		//마커 이미지 사이즈및 크기 생성
		var imageSize = new kakao.maps.Size(28, 30),
	    imageOptions = {  
	        spriteOrigin: new kakao.maps.Point(0,0),    
	        spriteSize: new kakao.maps.Size(20, 30),
	   		};     
		 
		 var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);  
		 //마커에 마커의 이미지와 마커의 위치를 같이 넣어줌
		 var marker = new kakao.maps.Marker({
		        position: new kakao.maps.LatLng(sof.Ma, sof.La),
		        image: markerImage,
		      }); 
		 
		 
		 storeMarkers.push(marker);
		//마커를 클릭했을시 실행되는 함수
		 kakao.maps.event.addListener(marker,'click', function() {
			console.log("click")
			cntt=0;
			//있던 오버레이 지우기
			for(let i=0; i<Overlay2.length; i++){
				Overlay2[i].setMap(null);
			}
			
			sloc_Lng = sof.getLng();
			//ajax로 데이터 가져오기
				$.ajax( {
					   url  :  'Test33'  ,  
					    data :  {sloc_Lng  : sloc_Lng}, 
				    method   : "POST"
				} )
				.done(function( result, textStatus, xhr ) {//에이잭스로 받은 데이터로 작업
					co = result;
					
					   f_name       = co[cntt].f_name;
					   f_date       = co[cntt].f_date;
					   f_address    = co[cntt].f_address;
					   f_fee       = co[cntt].f_fee;
					   f_tel       = co[cntt].f_tel;
					   f_hp       = co[cntt].f_hp; 
					   f_code     = co[cntt].f_code;
						//오버레이 띄우기
						
						if (co.length>1){
						var content = '<div class="wrap">' + 
								    '    <div class="info">' + 
								    '        <div class="title"><a href=/InfoFes?f_code=' + f_code + '>' + f_name + 
								    '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
								    '        </div>' + 
								    '        <div class="body">' + 
								    '            <div class="img"><a href=/InfoFes?f_code=' + f_code + '>' +
								    '                <img width="73" height="70" src="/fileupload/festival/'+f_name+'.jpg">' +
								    '           </a></div>' + 
								    '            <div class="desc">' + 
								    '                <div class="ellipsis"> 주 소 :'+f_address+'</div>' + 
								    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
								    '                <div> 홈페이지 : <a href='+f_hp+'>홈페이지</a></div>' + 
								    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
								    '                <div> 전화번호 : '+f_tel+'</div>' + 
								    '                <div> 축제일정 : '+f_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+f_fee+'<input type="button" id = "button" onclick="Display2()"  value=">>"></input></div>' + 
								    '                <div>'+f_date+'</div>' + 
								    '            </div>' + 
								    '        </div>' + 
								    '    </div>' +    
								    '</div>';
										mma = marker;
								var overlay2 = new kakao.maps.CustomOverlay({
										content: content,
									    position: marker.getPosition()
									});
									Overlay2.push(overlay2);
									overlay2.setMap(map);
						}
						else{
							
							var content = '<div class="wrap">' + 
						    '    <div class="info">' + 
						    '        <div class="title"><a href=/InfoFes?f_code=' + f_code + '>' + f_name + 
						    '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
						    '        </div>' + 
						    '        <div class="body">' + 
						    '            <div class="img"><a href=/InfoFes?f_code=' + f_code + '>' +
						    '                <img width="73" height="70" src="/fileupload/festival/'+f_name+'.jpg">' +
						    '           </a></div>' + 
						    '            <div class="desc">' + 
						    '                <div class="ellipsis"> 주 소 :'+f_address+'</div>' + 
						    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
						    '                <div> 홈페이지 : <a href='+f_hp+'>홈페이지</a></div>' + 
						    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
						    '                <div> 전화번호 : '+f_tel+'</div>' + 
						    '                <div> 축제일정 : '+f_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+f_fee+'</div>' + 
						    '                <div>'+f_date+'</div>' + 
						    '            </div>' + 
						    '        </div>' + 
						    '    </div>' +    
						    '</div>';
								mma = marker;
						var overlay2 = new kakao.maps.CustomOverlay({
								content: content,
							    position: marker.getPosition()
							});
							Overlay2.push(overlay2);
							overlay2.setMap(map);
							
						}
									
					}).fail(function(error, textStatus, errorThrown ) {
						   console.log ( error );
						   alert('Error:' + error)
					});
			
 
});
		 


})
}




function closeOverlay2() {
    for(let i=0; i<Overlay2.length; i++){
      Overlay2[i].setMap(null);
    }
  }



// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function setStoreMarkers(map) {        
    for (var i = 0; i < storeMarkers.length; i++) {  
        storeMarkers[i].setMap(map);
    }        
}











// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
function createCarparkMarkers() {
	carparkPositions.forEach(function(pof){
		
		var imageSize = new kakao.maps.Size(28, 30),
	    imageOptions = {  
	        spriteOrigin: new kakao.maps.Point(0,0),    
	        spriteSize: new kakao.maps.Size(20, 30),
	   		};     
		
		
		var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);    
		 var marker = new kakao.maps.Marker({
		        position: new kakao.maps.LatLng(pof.getLat(), pof.getLng()),
		        image: markerImage,
		      });
		 
		 
		 kakao.maps.event.addListener(marker,'click', function() {
			 totloc_Lng = pof.getLng();
			 console.log(totloc_Lng);
				
				$.ajax( {
					   url  :  'Test34'  ,  
					    data :  {totloc_Lng  : totloc_Lng},
				    method   : "POST"
				} )
				.done(function( result, textStatus, xhr ) {
					   console.log( result );
					  // var resultStr = JSON.stringify( result ); // JSOn -> string
					   
					    var a_name       = result[0].a_name;
					   var a_date       = result[0].a_date;
					   var a_address    = result[0].a_address;
					   var a_fee       = result[0].a_fee;
					   var a_tel       = result[0].a_tel;
					   var a_hp       = result[0].a_hp;
					   var a_code     = result[0].a_code;
					    
					   if(result[0].a_code <2000 && result[0].a_code > 1000){
					   var content = '<div class="wrap">' + 
					    '    <div class="info">' + 
					    '        <div class="title"><a href=/InfoFes?f_code=' + a_code + '>' + a_name + 
					    '            <div class="close" onclick="closeOverlay3()" title="닫기"></div>' + 
					    '        </div>' + 
					    '        <div class="body" height:90px; line-height:90px;>' + 
					    '            <div class="img"><a href=/InfoFes?f_code=' + a_code + '>' +
					    '                <img width="73" height="70" src="/fileupload/all/'+a_name+'.jpg">' +
					    '           </a></div>' + 
					    '            <div class="desc">' + 
					    '                <div class="ellipsis">주 소 : '+a_address+'</div>' + 
					    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
					    '                <div>홈페이지 : <a href='+a_hp+'>홈페이지</a></div>' + 
					    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
					    '                <div> 전화번호 : '+a_tel+'</div>' + 
					    '                <div>영업시간 : '+a_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+a_fee+'</div>' + 
					    '                <div>'+a_date+'</div>' + 
					    '            </div>' + 
					    '        </div>' + 
					    '    </div>' +    
					    '</div>';
					   }else{
						   var content = '<div class="wrap">' + 
						    '    <div class="info">' + 
						    '        <div class="title"><a href=/Info?s_code=' + a_code + '>' + a_name + 
						    '            <div class="close" onclick="closeOverlay3()" title="닫기"></div>' + 
						    '        </div>' + 
						    '        <div class="body" height:90px; line-height:90px;>' + 
						    '            <div class="img"><a href=/Info?s_code=' + a_code + '>' +
						    '                <img width="73" height="70" src="/fileupload/all/'+a_name+'.jpg">' +
						    '           </a></div>' + 
						    '            <div class="desc">' + 
						    '                <div class="ellipsis">주 소 : '+a_address+'</div>' + 
						    //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
						    '                <div>홈페이지 : <a href='+a_hp+'>홈페이지</a></div>' + 
						    //'                <div>'+s_tel+'&nbsp;'+s_fee+'&nbsp;'+s_date+'</div>' + 
						    '                <div> 전화번호 : '+a_tel+'</div>' + 
						    '                <div>영업시간 : '+a_date+'&nbsp;&nbsp;&nbsp; 이용요금 : '+a_fee+'</div>' + 
						    '                <div>'+a_date+'</div>' + 
						    '            </div>' + 
						    '        </div>' + 
						    '    </div>' +    
						    '</div>';
						   
					   }
						var overlay3 = new kakao.maps.CustomOverlay({
							content: content,
						    position: marker.getPosition()
						});
						Overlay3.push(overlay3);
						
						 if (clickedOverlay){
					        	clickedOverlay.setMap(null);
					        } 
					        overlay3.setMap(map);
					        clickedOverlay = overlay3;
					   
					   $('#result1').html(  );
				})
				.fail(function(error, textStatus, errorThrown ) {
					   console.log ( error );
					   alert('Error:' + error)
				});
 
});
		 carparkMarkers.push(marker);


})
}



  function closeOverlay3() {
  for(let i=0; i<Overlay3.length; i++){
    Overlay3[i].setMap(null);
  }
}

// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCarparkMarkers(map) {        
    for (var i = 0; i < carparkMarkers.length; i++) {  
        carparkMarkers[i].setMap(map);
    }        
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
	closeOverlay3();
	closeOverlay2();
	closeOverlay();
    var coffeeMenu = document.getElementById('coffeeMenu');
    var storeMenu = document.getElementById('storeMenu');
    var carparkMenu = document.getElementById('carparkMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'coffee') {
    
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        storeMenu.className = '';
        carparkMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(map);
        setStoreMarkers(null);
        setCarparkMarkers(null);
        
        
    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = 'menu_selected';
        carparkMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(map);
        setCarparkMarkers(null);
        
    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    }    
   
}

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>

</body>
</html>