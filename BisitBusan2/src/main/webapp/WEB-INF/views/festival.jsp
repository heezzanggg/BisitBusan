<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
    
<!DOCTYPE html>
<html>
<head>
 <%@include file="/WEB-INF/include/menus02.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>VISITBUSAN 페스티벌</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
.box {
 text-align:center;
}
.box img {
 border-radius: 5%;
}
.box p {
 margin-bottom:8px;
}
.tableAtt {
 border-collapse: seperate;
 border-spacing: 30px 40px;
 border-top-left-radius: 15px; 
 border-top-right-radius: 15px;
 border-bottom-left-radius: 15px; 
 border-bottom-right-radius: 15px;
}
.titatle{
text-align:center;
}
</style>
</head>
<body>
<div class = titatle>
<h2>축제 전체 보기</h2>

<div class="row">
	<div class="col-md-11"></div>	
	<div class="col-md-1 text-right">
		<!-- perPageNum의 값을 정하는 select 박스 -->
		<select class="form-control" id="perPageSel" hidden>
	  		<option value="10">10</option>
	  		<option value="15">15</option>
	  		<option value="20">20</option>
		</select>
	</div>
</div>

</div>
  <table class="tableAtt">
  <tr class="tableAtt">
	<c:forEach var="festivalTable" items="${ festivalTable }" varStatus="status">
		<c:if test="${status.index%4==0}">
  </tr>
  <tr class="tableAtt">
		</c:if>
  	<td class="tableAtt">
	  <div class="box">
            <p><a href="">${festivalTable.f_name}</a></p>
            <a href="/InfoFes?f_code=${festivalTable.f_code}"><img src ="fileupload/festival/${festivalTable.f_name}.jpg" alt="${festival.f_name}" width="350" height="300"></a>
      </div>
    </td>
    </c:forEach>
  </tr>
</table>

  <!-- 페이징처리 -->
	<div class="text-center">
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
				<!-- prev버튼 -->
				<li id="page-prev">
					<a class="page-link" href="Festival${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
						<span aria-hidden="true"> Previous </span>
					</a>
				</li>
				
				<!-- 페이지번호 (시작페이지 번호부터 끝 페이지 번호까지) -->
				<c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var="idx">
					<li id=page${idx} class="page-item" aria-current="page">
						<a class="page-link"  href = "Festival${pageMaker.makeQuery(idx)}">
							<span >${idx}</span>
						</a>
					</li>
				</c:forEach>

				<!-- next버튼 -->
				<li id="page-item">
					<a class="page-link" href="Festival${pageMaker.makeQuery(pageMaker.endPage +1) }" aria-label="Next">
						<span aria-hidden = "true"> next </span>
					</a>
				</li>
				

			</ul>
		</nav> 
	</div>


	<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		
	/* 	//등록, 삭제 후 문구 처리
		var result = '${result}';
		$(function(){
			if(result === 'registerOK'){
				$('#registerOK').removeClass('hidden');
				$('#registerOK').fadeOut(2000);
			}
			if(result === 'removeOK'){
				$('#removeOK').removeClass('hidden');
				$('#removeOK').fadeOut(2000);
			}
		}) */
		
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if(canPrev !== 'true'){
			$('#page-prev').addClass('disabled');
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if(canNext !== 'true'){
			$('#page-next').addClass('disabled');
		}
		
		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
		$('#page'+thisPage).addClass('active');
	})
	
	function setPerPageNumSelect(){
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop("selected",true);
		//PerPageNum가 바뀌면 링크 이동
		$perPageSel.on('change',function(){
			//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
			window.location.href = "Festival?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
	}
	
	</script>
	

  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>