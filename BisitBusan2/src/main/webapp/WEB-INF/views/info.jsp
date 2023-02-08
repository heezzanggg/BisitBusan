<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUSAN VISIT</title>
 <%@include file="/WEB-INF/include/menus02.jsp" %>
<style>
#hh{
	 margin-top:11%;
}

.left3{
border:1px;
 margin-top:5px;
 margin-left:5px;
 font-size:40px;
}
.left1{
font-family:Jalnan;
font-size:22px;
}
h2 {
 margin:30px 0;
}
li {
 width:800px;
 padding:10px;
} 
#nav {
 width :  800px;
 border:1px solid #c0c0c0;
 padding : 10px;
}
.right{
 font-size:18px;
 display:inline-block;
 position:absolute;
 right:240px;
 line-height:60px;
 display:flex;
 align-items:center;
 margin-top:8%;
}
.right table, td, th {
 border-spacing: 10px 15px;
 text-align:left;
 border:none;
}
.leftcontainer {
 text-algin:left;
 margin-left:15%;
 margin-top:3%;
}
.left2 img {
  width:700px;
  height:500px;
}
.left4 {
text-align:left;
text-size:large;
}
</style>
</head>
<body>

    <div class="container" style="display:flex; flex-direction:row;">
       
       <div class="leftcontainer" style="flex-grow:3; position:absolute;">
            <div class="left1">
              <h2>${ vo.s_name }</h2>
              </div>
              <div class="left2">
              <img src="/fileupload/sight/${ vo.s_name }.jpg" width="700px" height="650px" >
              </div>
              <div class="left3">
              <p>조회수👍🏻 ${ vo.s_good }</p>
              </div>
              <div class="left4">
              <p>${ vo.s_intro }</p></div>
           </div>
    
        <div class="right" style="flex-grow:1;"> 
          <table>
               <tr>
                <td>${ vo.s_name }</td> 
                </tr>
                <tr>
                <td>이용시간: ${ vo.s_date }</td>
                </tr>
                <tr>
                <td>${ vo.s_address }</td>
                </tr>
                <tr>
                <td>요금: ${ vo.s_fee }</td>
                </tr>
                <tr>
                <td>Tel: ${ vo.s_tel }</td>
                </tr>
                <tr>
                <td>홈페이지: <a href="${ vo.s_hp }">홈페이지</a></td>
                </tr>
         </table>   
         </div>
    </div>
<div id = hh>


</div>
</body>
</html>