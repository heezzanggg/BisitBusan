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
.left1{
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
 display:inline-block;
 position:absolute;
 right:150px;
 line-height:60px;
 display:flex;
 align-items:center;
 margin-top:8%;
}
.right table, td, th {
 border-spacing: 10px 15px;
 text-align:left;
 border : none;
}
.leftcontainer {
 text-algin:left;
 margin-left:15%;
 margin-top:2%;
}

</style>
</head>
<body>

 
    <div class="container"style="display: flex; flex-direction: row;">
    
       <div class="leftcontainer" style="flex-grow:3; position:absolute;" >
       <br>
       <br>
            <div class="left1">
              <h2>${ vo.f_name }</h2>
              </div>
              <div class="left2">
              <img src="/fileupload/festival/${ vo.f_name }.jpg" width="700px" height="600px">
              </div>
            <%--   <div class="left3">
              <p>조회수😎 ${ vo.s_good }</p>
              </div> --%>
           </div>
    
        <div class="right" style="flex-grow:1;"> 
          <table>
               <tr>
                <td>${ vo.f_name }</td> 
                </tr>
                <tr>
                <td>이용시간: ${ vo.f_date }</td>
                </tr>
                <tr>
                <td>${ vo.f_intro }</td>
                </tr>
                <tr>
                <td>주소:${ vo.f_address }</td>
                </tr>
                <tr>
                <td>요금: ${ vo.f_fee }</td>
                </tr>
                <tr>
                <td>Tel: ${ vo.f_tel }</td>
                </tr>
                <tr>
                <td>홈페이지: <a href="${ vo.f_hp }">홈페이지</a></td>
                </tr>
         </table>   
         </div>
    </div>

</body>
</html>