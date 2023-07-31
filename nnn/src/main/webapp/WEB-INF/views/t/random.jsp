<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Insertcss.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Randomcss.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<div class="btn-box">
	<div id="end" class="flex flex-center btn btn2 bold">수발완료</div>
</div>
<div class="modal normal">
	<div class="modal_body">
		<div>
			<img class="del-icon" src="${pageContext.request.contextPath}/resources/icon/del.png" onclick="closePopup()">
			<img class="insert-icon" src="${pageContext.request.contextPath}/resources/icon/insert.png">
			<div class="text text3">수발완료가 되었습니다.</div>
			<div class="text text4">기타 참고 사항을 입력해주세요.</div>
			<div class="textarea">
				<textarea name="h_comm" id="h_comm"></textarea>
			</div>
			<div class="modal_insert" id="modal_insert" onclick="end()">
			등록
			</div>
		</div>
	</div>
</div>
<div class="modal2 normal">
	<div class="modal_body2">
		<div>
			<%-- <img class="modal2_img" src="${pageContext.request.contextPath}/resources/img/prize.png" style="width: 680px; height: 680px;"> --%>
<!-- 			<img class="modal2_img" src="https://kr.lovepik.com/images/png-2972103.html" style="width: 680px; height: 680px;"> -->
			<img class="modal2_img" src="" style="width: 680px; height: 680px;">
			<div class="text text3" id="result"></div>
			<div class="modal_insert" id="" onclick="closePopupAndRedirect2()">
			확인
			</div>
		</div>
	</div>
</div>
</body>
<script>

const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const btnOpenPopup = document.querySelector('#end');
//const modal2Open = document.querySelector('#modal_insert');
var result = document.querySelector('#result')
var modal2img = document.querySelector('.modal2_img');


function getRandRange(min,max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandWeight(listItem){
    var pickVal = Number.MAX_VALUE;
    var pickItem = null;
    for(var item in listItem){
        if(listItem.hasOwnProperty(item)){
            var tmpVal = -Math.log(Math.random()) / listItem[item];
            if(tmpVal < pickVal){
                pickVal = tmpVal;
                pickItem = item;
            }
        }
    }
    return pickItem;
}

btnOpenPopup.addEventListener('click', () => {
	
	
	
	modal.classList.toggle('show');

	if (modal.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
});
/* 
modal2Open.addEventListener('click', () => {
	modal2.classList.toggle('show');

	if (modal2.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
});
 */
modal.addEventListener('click', (event) => {
	
	
	if (event.target === modal) {
		// 모달 바깥 영역을 클릭했을 때
		const confirmed = window.confirm('등록하시겠습니까?');
		if (confirmed){
			// 예
			if (textareaIsEmpty()) {
				// textarea가 비어있는 경우
				const confirmed = window.confirm('내용을 입력하지 않으셨습니다. 그대로 등록하시겠습니까?');
				if (confirmed) {
					// 예
					$(document).ready(function(){
					var str = "";
					var listItem = [];
					listItem["당첨"] = 50;
					listItem["꽝"] = 50;
					
					// 꽝
					var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
					// 당첨
					var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
					
					var pickItem = getRandWeight(listItem);
					
					if(pickItem == "꽝"){
						str = "아쉽지만.. "
						modal2img.src = src1;
					}else{
						str = "축하합니다! "
						modal2img.src = src2;
					}
					console.log(str + pickItem +"입니다");
					
					
					result.textContent = str + pickItem +"입니다";
	//				alert(str + pickItem +" 입니다");
					});
//					closePopupAndRedirect();
				}else{
					// 아니오
					closePopup();
				}
			}else{
				// textarea에 글이 있는 경우
				modal2.classList.toggle('show');
				
				if (modal2.classList.contains('show')) {
					body.style.overflow = 'hidden';
				}
				$(document).ready(function(){
					var str = "";
					var listItem = [];
					listItem["당첨"] = 50;
					listItem["꽝"] = 50;
					
					// 꽝
					var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
					// 당첨
					var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
					
					var pickItem = getRandWeight(listItem);
					
					if(pickItem == "꽝"){
						str = "아쉽지만.. "
						modal2img.src = src1;
					}else{
						str = "축하합니다! "
						modal2img.src = src2;
					}
					console.log(str + pickItem +"입니다");
					
					
					result.textContent = str + pickItem +"입니다";
//					alert(str + pickItem +" 입니다");
					
				});
//				closePopupAndRedirect();
			}
		}else{
			// 아니오
			closePopup();
		}
	}
});
function closePopupAndRedirect() {
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
//	let h_name = $("#h_name").val();
//	let h_no = $("#h_no").val();
//	let h_number = $("#h_number").val();
//	let midx = "${sessionScope.midx}"
//	let h_comm = $("#h_comm").val();
	
//	$("#frm").attr("action","${pageContext.request.contextPath}/h/end.do/${detail.midx}").submit();
	//window.location.href = '${pageContext.request.contextPath}/h/end.do/${sessionScope.midx}';
	
}
function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

// 모달2 닫기
function closePopup2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopupAndRedirect2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
//	let h_name = $("#h_name").val();
//	let h_no = $("#h_no").val();
//	let h_number = $("#h_number").val();
//	let midx = "${sessionScope.midx}"
//	let h_comm = $("#h_comm").val();
	
//	console.log(h_name);
//	console.log(h_no);
//	console.log(h_number);
//	console.log(h_comm);
//	$("#frm").attr("action","${pageContext.request.contextPath}/h/end.do/${detail.midx}").submit();
}
function textareaIsEmpty() {
	const textarea = modal.querySelector('textarea');
	return textarea.value.trim() === '';
}

function end(){
	modal2.classList.toggle('show');

	if (modal2.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
	if (textareaIsEmpty()) {
		// textarea가 비어있는 경우
			const confirmed = window.confirm('내용을 입력하지 않으셨습니다. 그대로 등록하시겠습니까?');
			if (confirmed) {

				$(document).ready(function(){
					var str = "";
					var listItem = [];
					listItem["당첨"] = 50;
					listItem["꽝"] = 50;
					
					// 꽝
					var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
					// 당첨
					var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
					
					var pickItem = getRandWeight(listItem);
					
					if(pickItem == "꽝"){
						str = "아쉽지만.. "
						modal2img.src = src1;
					}else{
						str = "축하합니다! "
						modal2img.src = src2;
					}
					console.log(str + pickItem +"입니다");
					
					
					result.textContent = str + pickItem +"입니다";
//					alert(str + pickItem +" 입니다");
					
				});
//				closePopupAndRedirect();
			}else{
				closePopup2();
				closePopup();
			}
		} else {
			// textarea에 글이 있는 경우
			modal2.classList.toggle('show');
			
			if (modal2.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			$(document).ready(function(){
				var str = "";
				var listItem = [];
				listItem["당첨"] = 50;
				listItem["꽝"] = 50;
				
				// 꽝
				var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
				// 당첨
				var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
				
				var pickItem = getRandWeight(listItem);
				
				if(pickItem == "꽝"){
					str = "아쉽지만.. "
					modal2img.src = src1;
				}else{
					str = "축하합니다! "
					modal2img.src = src2;
				}
				console.log(str + pickItem +"입니다");
				
				
				result.textContent = str + pickItem +"입니다";
//				alert(str + pickItem +" 입니다");
				
			});
		}
}


</script>
</html>