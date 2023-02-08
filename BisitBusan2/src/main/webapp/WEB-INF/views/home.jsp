<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
<title>BUSAN VISIT</title>
<style>


	*{
		padding : 0;
		margin : 0;
		font-family : sans-serif;
			
	}
	
	body{
		background: #404258;
	}
	
	header{
		background: #e4e4e4;
		background-size: cover;
		background-position: center;
		height : 50px;
	}
	
	nav{
		position: fixed;
		width: 100%;
		line-height: 20px;
		transition: 0.4s;
	}
	
	nav ul{
		float: right;
		margin: 0;
		padding-right: 42px;
		 
	}
	
	nav ul li{
		list-style: none;
		display: inline-block;
		padding: 16px 32px;
		
	}
	
	nav ul li a{
		text-decoration: none;
		padding: 16px 15px;
		font-size: 16px;
		color: #000;
	}
	
	nav img{
		height: 40px;
		width: 40px;
		float: left;
		margin-left: 50px;
	}
	
	.container{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
		align-items: center;	
	}
	
	.container h1{
		color: #fff;
		font-size: 71px;
		margin-bottom: 40px;
		
	}
	
	.button{
		background: #fff;
		padding: 10px 15px;
		color: #34495e;
		font-weight: bolder;
		text-transform: uppercase;
		font-size: 18px;
		border-radius: 5px;
		box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
		margin-top: 25px;
		text-decoration: none;
		transition: 0.4s;
		display: block;
		
		
	}
	
	
	.button:hover{
		background: #34495e;
		color: #fff;
				
	}
	
	.buttont{
		background: #fff;
		padding: 10px 15px;
		color: #34495e;
		font-weight: bolder;
		text-transform: uppercase;
		font-size: 18px;
		border-radius: 5px;
		box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
		margin-top: 40px;
		text-decoration: none;
		transition: 0.4s;
		display: block;
		width: 25%;
		position: absolute;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -50%);
		
		
	}
	
	
	.buttont:hover{
		background: #34495e;
		color: #fff;
				
	}
	
	.buttonts{
		background: #fff;
		padding: 10px 15px;
		color: #34495e;
		font-weight: bolder;
		text-transform: uppercase;
		font-size: 18px;
		border-radius: 5px;
		box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
		margin-top: 80px;
		text-decoration: none;
		transition: 0.4s;
		display: block;
		width: 25%;
		position: absolute;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -50%);
		
		
	}
	
	
	.buttonts:hover{
		background: #34495e;
		color: #fff;
				
	}
	
	
	
	.popuplogin{
		background: rgba(0, 0, 0, 0.6);
		width: 100%;
		height: 100%;
		position: absolute;
		top: 0;
		display: none;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	
	.popupnew{
		background: rgba(0, 0, 0, 0.6);
		width: 100%;
		height: 100%;
		position: absolute;
		top: 0;
		display: none;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	
	.popup-content{
		height: 250px;
		width: 500px;
		background: #fff;
		padding: 20px;
		border-radius: 5px;
		position: relative;
			
	}
	
	input{
		margin: 20px auto;
		display: block;
		width: 50%;
		padding: 8px;
		border: 1px solid gray;
	}
	
	.close1{
		position: absolute;
		top: -15px;
		right: -15px;
		background: #fff;
		height: 20px;
		width: 20px;
		border-radius: 50%;
		box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
		cursor: pointer;
	}
	
	.close2{
		position: absolute;
		top: -15px;
		right: -15px;
		background: #fff;
		height: 20px;
		width: 20px;
		border-radius: 50%;
		box-shadow: 6px 6px 29px -4px rgba(0,0,0,0.75);
		cursor: pointer;
	}
	
	
</style>


</head>
<body>
	<div class="container">
		<h1>BUSAN VISIT</h1>
		<a href="#" class="button" id="button1">Login</a>
		<a href="#" class="button" id="button2">회원가입</a>
		<a href="/Guest" class="button" id="button3">Guest</a>
	</div>
	
	
	<div class="popuplogin">
		<div class="popup-content">
			<form action="/loginProcess" method="POST">
				<img src="img/cbtn.png" alt="Close" class="close1">
				<input type="text" name="user_id" placeholder="Username">
				<input type="password" name="user_pw" placeholder="Password">
				<input type="submit" value="LOGIN" class="buttont" >
			</form>
		</div>
	</div>

	<div class="popupnew">
		<div class="popup-content">
			<form action="/Write" method="POST">
				<img src="img/cbtn.png" alt="Close" class="close2">
				<input type="text" name="user_id" placeholder="InputID">
				<input type="password" name="user_pw" placeholder="InputPassword">
				<input type="text" name="user_name" placeholder="Inputname">
				<input type="submit" value="가입완료" class="buttonts">
			</form>
		</div>
	</div>

<script>

document.getElementById("button1").addEventListener("click", function(){
	document.querySelector(".popuplogin").style.display="flex";
})


document.getElementById("button2").addEventListener("click", function(){
	document.querySelector(".popupnew").style.display="flex";
})

document.querySelector(".close1").addEventListener("click", function(){
	document.querySelector(".popuplogin").style.display="none";
})

document.querySelector(".close2").addEventListener("click", function(){
	document.querySelector(".popupnew").style.display="none";
})
</script>




</body>

</html>