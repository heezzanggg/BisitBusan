<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <style>


        input {
            width: 70%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }
           div {
            display: flex;
  			justify-content: center;
  			align-items:center;
  			min-height: 100vh;
         	border-radius: 5px;
            text-align: center;
            padding: 20px;
            background-image:url("https://document-export.canva.com/NxSpo/DAFQteNxSpo/3/thumbnail/0001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUHWDTJW6UD%2F20221103%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221103T161004Z&X-Amz-Expires=56264&X-Amz-Signature=fe91b4fc2201cd37ae46531119411b0b173c06c547bd591aa70b6fdba7f613b1&X-Amz-SignedHeaders=host&response-expires=Fri%2C%2004%20Nov%202022%2007%3A47%3A48%20GMT");
            background-repeat: no-repeat;
            
            background-position: 50% 150px;
            background-size:220px 220px;
        }


        .in {
            margin-bottom: 10px;
            background-color: #EEEFF1;
        }
         #btn {
            background-color:#f7323f;
            margin-bottom: 5px;
            color: white;
        }
        #btn:hover{
        	background: silver;
        }

      
        </style>
        <script>

		$('form').on('submit', function(e) {
		if( $('[name=userid]').val() == '' ) {
			$('[name=userid]').val('아이디를 입력하세요');
			$('#uid').html('<b style="color:red">아이디를 입력하세요</b>')
			$('[name=userid]').css('border', '1px solid red');
			alert('아이디를 입력하세요');
			e.preventDefault();
			e.stopPropagation();
			
		}
		
	})
	
});

</script>
</head>
<body>

    <div>
        <form action="/Write" method="POST">
            <input type="text" name="user_id" placeholder="아이디"class="in">
            <input type="password" name="user_pw" placeholder="비밀번호"class="in">
            <input type="text" name="user_name" placeholder="이름"class="in">
            <input type="submit" id="btn" value="가입완료"><br>
            <input type ="button" id="btn" value = "취소" onClick="location.href='/'">
            </form>
       </div>
</body>

</html>