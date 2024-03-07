<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function goBack() {
	window.history.back();
}
</script>
<div class="header4">
	<div class="img_box2" onclick="location.href='${pageContext.request.contextPath}/c/CounselList2.do'">
		<img src="${pageContext.request.contextPath}/resources/icon/arrow2.png">
	</div>
	<div class="con2">
		<span style="" class="bold">입원서약서</span>
	</div>
</div>
<style>


.header4{
	font-size: 28pt;
	text-align: center;
	display: flex;
	align-items: center;		/* 세로 가운데 정렬 */
	border-bottom: 1px solid #e3e3e3;
	padding-top: 5px;
	padding-bottom: 5px;
	height: 70px;
	background-color: #ffffff;
	z-index: 99;			/* z-index 를 사용하려면 포지션값이 있어야한다 (static 말고 다른거) */
	position: relative;
}
.img_box2{
	margin-left: 32px;
	margin-right: 10px; /* 이미지와 span 태그 사이 간격 조정 */
	flex-grow: 0;
	align-items: center;
	display: flex;
	z-index: 1;
}
.header4 > span{
	color: #2f2f2f;
}
.con2{
	display: flex; /* flexbox 적용 */
	align-items: center; /* 세로 가운데 정렬 */
	flex-grow: 1;
	justify-content: center; /* 가로 가운데 정렬 */
	text-align: center; /* 수정된 부분 */
	margin-left: -68px;
}
/**/
	
</style>

