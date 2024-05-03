<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<title>입원 서약서</title>
<style>
.area-custom-select {
 /*  position: relative;
  width: 400px;
  height: 150px;
  margin: 50px auto; */
}

.custom-select {
  display: inline-block;
  width: 260px;
  height: 48px;
  border: solid 1px #c4ccd8;
  background-color: #ffffff;
  box-sizing: border-box;
  font-size: 18px;
  cursor: pointer;
  position: relative;
  outline: 0px;
}

.select-origin {
  position: absolute;
  right: 10px;
}

.custom-select-text {
  position: absolute;
  top: 14px;
  left: 15px;
}

.custom-select-arrow {
  position: absolute;
  top: 20px;
  right: 15px;
}

.custom-select-list {
  position: absolute;
  font-size: 18px;
  width: 260px;
  height: 145px;
  z-index: 15;
  border: solid 1px #c4ccd8;
  background-color: #ffffff;
  text-align: left;
  margin-top: -3px;
  box-sizing: border-box;
}

.custom-select-option {
  height: 48px;
  line-height: 48px;
  padding-left: 15px;
  cursor: pointer;
  box-sizing: border-box;
}

.custom-select-option:hover {
  color: #ffffff;
  background-color: #1172c4;
  box-sizing: border-box;
}

</style>
</head>

<body>
	<div class="area-custom-select">
		<div class="custom-select" tabindex="0">
			<span class="custom-select-text">선택 옵션1</span>
			<img src="${pageContext.request.contextPath}/resources/icon/search.png" class="custom-select-arrow">
		</div>
		<ul class="custom-select-list" style="display:none;">
			<li value="selectOption1" class="custom-select-option">선택 옵션1</li>
			<li value="selectOption2" class="custom-select-option">선택 옵션2</li>
			<li value="selectOption3" class="custom-select-option">선택 옵션3</li>
		</ul>
	</div>


</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
let selectFlag;
$('.custom-select').on('click', function() {
  $(this).toggleClass('selected');
  if($(this).hasClass('selected')) {
    $('.custom-select-list').show();
  } else {
    $('.custom-select-list').hide();
  }
})

$('.custom-select').on('focusin', function() {
  $('.custom-select-list').show();
});

$('.custom-select').on('focusout', function() {
  if(!selectFlag) {
    $('.custom-select-list').hide();
  }
  $(this).removeClass('selected');
});

$('.custom-select-option').on('mouseenter', function() {
  selectFlag = true;
});

$('.custom-select-option').on('mouseout', function() {
  selectFlag = false;
});

$('.custom-select-option').on('click', function() {
  let value = $(this).attr('value');

  $('.custom-select-text').text($(this).text());
  $('.select-origin').val(value);
  $('.custom-select-list').hide();

  $('.select-origin').find('option').each(function(index, el) {
    if($(el).attr('value') == value) {
      $(el).attr('selected', 'selected');
    } else {
      $(el).removeAttr('selected');
    }
  });
});
</script>
</html>