<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">
<style>

</style>
</head>
<body>
	<div class="modal normal">
		<div class="modal_body">
			<div>
				<div class="menu_msg">현재 답변하지 않은 평가가 있습니다. 확인해주세요.</div>
				<div style="top:28%;" class="btn pink_btn" id="modal_insert" onclick="closePopup()">
				확인
				</div>
			</div>
		</div>
	</div>
	<div class="modal2 normal">
		<div class="modal_body2">
			<div>
				<div class="menu_msg2">d</div>
				<div class="munu_btn">
					<div class="btn pink_btn" id="modal_insert" onclick="closePopup2redirect()">
					확인
					</div>
					<div class="btn pink_btn" id="modal_insert" onclick="closePopup2()">
					취소
					</div>
				</div>
				
			</div>
		</div>
	</div>
    <div class="wrap">
        <section>
        <p>
        	<label><input type="radio" name="a1" value="매우우수">매우우수</label>
        	<label><input type="radio" name="a1" value="우수">우수</label>
        	<label><input type="radio" name="a1" value="보통">보통</label>
        	<label><input type="radio" name="a1" value="미흡">미흡</label>
        	<label><input type="radio" name="a1" value="매우미흡">매우미흡</label>
        </p>
        <p>
        	<label><input type="radio" name="a2" value="매우우수">매우우수</label>
        	<label><input type="radio" name="a2" value="우수">우수</label>
        	<label><input type="radio" name="a2" value="보통">보통</label>
        	<label><input type="radio" name="a2" value="미흡">미흡</label>
        	<label><input type="radio" name="a2" value="매우미흡">매우미흡</label>
        </p>
            <button type="button" id="confirm" onclick="com();">컨펌창</button>
            <button type="button" id="alert">경고창</button>
            <button class="end" id="end" onclick="end();">평가완료</button>
        </section>
        
    </div>
    <script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const modal2 = document.querySelector('.modal2');
    const msg = document.querySelector('.menu_msg');
    const msg2 = document.querySelector('.menu_msg2');
    console.log(msg.innerText)
    
   	function end(){
    	modal.classList.toggle('show');
    	msg.style.top = '34%';
    	msg.innerHTML = "<p><b>[ 직원 근무평가 마감 ]</b><p><br><p>2023년도 직원 근무평가가 마감되었습니다.</p><p>평가에 응해주셔서 대단히 감사드립니다.</p><p>- (주)코어솔루션 -</p>"
    	if (modal.classList.contains('show')) {
    		body.style.overflow = 'hidden';
    	}
   	}
	function closePopup(){
		modal.classList.toggle('show');
		if (!modal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	}
	function closePopup2(){
		modal2.classList.toggle('show');
		if (!modal2.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	}
	function com(){
    	msg2.innerText = "이미 평가가 완료된 대상입니다.";
   		modal2.classList.toggle('show');
   		
   		if (modal2.classList.contains('show')) {
   			body.style.overflow = 'hidden';
   		}
    }
	function closePopup2redirect(){
		modal2.classList.toggle('show');
		if (!modal2.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	}
	
    </script>
</body>
</html>