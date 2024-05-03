<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="footer">
	<div class="flex space-between light">
		<div class="icon" onclick="goToMyPage()">
			<img alt="mypage" id="mypage" src="${pageContext.request.contextPath}/resources/icon/my.png"><br>
			<div id="mypage-t">마이페이지</div>
		</div>
		<div class="icon" onclick="goToHome()">
			<img alt="home" id="home" src="${pageContext.request.contextPath}/resources/icon/home.png"><br>
			<div id="home-t">홈</div>
		</div>
		<div class="icon" onclick="goToPoint()">
			<img alt="point" id="point" src="${pageContext.request.contextPath}/resources/icon/point.png"><br>
			<div id="point-t">포인트내역</div>
		</div>
        
    </div>
    
    
    <script>
    var midx = "${detail.midx}";
    
    function goToMyPage(){
    	if(midx == ""){
    		var url = "${pageContext.request.contextPath}/m/Login.do";
    		
    		alert("로그인이 필요합니다.");
    		
    		window.location.href = url;
    	}else{
    	// 이동할 페이지 url
    	var url = "${pageContext.request.contextPath}/m/Mypage.do/"+midx;
    	var img = document.getElementById("mypage");
    	var text = document.getElementById("mypage-t");
    	// 변경할 이미지 url
    	img.src = "${pageContext.request.contextPath}/resources/icon/my_y.png";
    	// 변경할 폰트색상
    	text.style.color = "#fbb03b";
    	window.location.href = url;
    	}
    }
    function goToHome(){
    	var url = "${pageContext.request.contextPath}/h/Main.do";
    	var img = document.getElementById("home");
    	var text = document.getElementById("home-t");
    	img.src = "${pageContext.request.contextPath}/resources/icon/home_y.png";
    	text.style.color = "#fbb03b";
    	window.location.href = url;
    }
    function goToPoint(){
    	if(midx == ""){
			var url = "${pageContext.request.contextPath}/m/Login.do";
    		
    		alert("로그인이 필요합니다.");
    		
    		window.location.href = url;
    	}else{
    		var url = "${pageContext.request.contextPath}/m/Point.do/"+midx+"/1/${start}/${end}/selectOption1";
        	var img = document.getElementById("point");
        	var text = document.getElementById("point-t");
        	img.src = "${pageContext.request.contextPath}/resources/icon/point_y.png";
        	text.style.color = "#fbb03b";
        	window.location.href = url;
    	}
    	
    }
    </script>

</div>
<style>

/*  footer css   */
.footer{
	background-color: #ffffff;
	text-align : center;
	border-top : 1px solid rgba(115, 115, 115, 0.18);
	height: 150px;
	position : fixed;	/* 이 부분을 고정 */
	bottom : 0;			/* 하단에 여백 없이 */
	width : 100vw;		/* 가로 사이즈를 브라우저에 가득 채움 */
	font-size: 22pt;
	color: #666666;
	z-index: 2;
}
.footer img{
	/* box-shadow: 1px 1px 1px 0 rgba(115, 115, 115, 0.18); */
}
.footer > div{
	height: inherit;
}
.footer .space-between{
	justify-content: space-between;		/* 좌우 여백 없이 flex */
	margin-left: 73px;					/* 좌우에 약간의 여백 */
	margin-right: 73px;					/* 좌우에 약간의 여백 */
}
.footer .icon{
	margin-top:28px;
	margin-bottom:22px;
}
/**/
	

</style>