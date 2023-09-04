<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<li class="contact_row_w100p">
    <div>
        <label class="jt_label" for=""><span class="ftcdanger fc-red">*</span>방문총인원</label>
    </div>
     <div>
     <div class="form_control_wrap mt10">
        <input type="text" class="jt_form_field mr5 wt1" value="10대" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_age10" name="resv_age10" class="jt_form_field wt500" />
    </div>
     <div class="form_control_wrap mt10">
         <input type="text" class="jt_form_field mr5 wt1" value="20대" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_age20" name="resv_age20" class="jt_form_field wt500" />
    </div>
     <div class="form_control_wrap mt10">
         <input type="text" class="jt_form_field mr5 wt1" value="30대" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_age30" name="resv_age30" class="jt_form_field wt500" />
    </div>
     <div class="form_control_wrap mt10">
         <input type="text" class="jt_form_field mr5 wt1" value="40대" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_age40" name="resv_age40" class="jt_form_field wt500" />
    </div>
     <div class="form_control_wrap mt10">
         <input type="text" class="jt_form_field mr5 wt1" value="50대 이상" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_age50" name="resv_age50" class="jt_form_field wt500" />
    </div>
     <div class="form_control_wrap mt10">
         <input type="text" class="jt_form_field mr5 wt1" value="합계" readonly="readonly" style="text-align:center;"/>
        <input type="text" id="resv_number" name="resv_number" class="jt_form_field wt500" readonly="readonly"/>
    </div>
    </div>
</li>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function() {
	alertResMsg(gTxt("${resMap.msg}"));
	 
	$("#resv_age10").on("propertychange change paste input", function() {
	 
	    var resv_age10 = fnReplace($("#resv_age10").val());
	    var resv_age20 = fnReplace($("#resv_age20").val());
	    var resv_age30 = fnReplace($("#resv_age30").val());
	    var resv_age40 = fnReplace($("#resv_age40").val());
	    var resv_age50 = fnReplace($("#resv_age50").val());
	    
	    $("#resv_number").val(resv_age10 + resv_age20 + resv_age30 + resv_age40 + resv_age50);
	});
	 
	$("#resv_age20").on("propertychange change paste input", function() {
	 
	    var resv_age10 = fnReplace($("#resv_age10").val());
	    var resv_age20 = fnReplace($("#resv_age20").val());
	    var resv_age30 = fnReplace($("#resv_age30").val());
	    var resv_age40 = fnReplace($("#resv_age40").val());
	    var resv_age50 = fnReplace($("#resv_age50").val());
	    
	    $("#resv_number").val(resv_age10 + resv_age20 + resv_age30 + resv_age40 + resv_age50 );
	});
	 
	$("#resv_age30").on("propertychange change paste input", function() {
	 
	    var resv_age10 = fnReplace($("#resv_age10").val());
	    var resv_age20 = fnReplace($("#resv_age20").val());
	    var resv_age30 = fnReplace($("#resv_age30").val());
	    var resv_age40 = fnReplace($("#resv_age40").val());
	    var resv_age50 = fnReplace($("#resv_age50").val());
	    
	    $("#resv_number").val(resv_age10 + resv_age20 + resv_age30 + resv_age40 + resv_age50 );
	});
	 
	$("#resv_age40").on("propertychange change paste input", function() {
	 
	    var resv_age10 = fnReplace($("#resv_age10").val());
	    var resv_age20 = fnReplace($("#resv_age20").val());
	    var resv_age30 = fnReplace($("#resv_age30").val());
	    var resv_age40 = fnReplace($("#resv_age40").val());
	    var resv_age50 = fnReplace($("#resv_age50").val());
	    
	    $("#resv_number").val(resv_age10 + resv_age20 + resv_age30 + resv_age40 + resv_age50 );
	});
	 
	$("#resv_age50").on("propertychange change paste input", function() {
	 
	    var resv_age10 = fnReplace($("#resv_age10").val());
	    var resv_age20 = fnReplace($("#resv_age20").val());
	    var resv_age30 = fnReplace($("#resv_age30").val());
	    var resv_age40 = fnReplace($("#resv_age40").val());
	    var resv_age50 = fnReplace($("#resv_age50").val());
	    
	    $("#resv_number").val(resv_age10 + resv_age20 + resv_age30 + resv_age40 + resv_age50 );
	});
	 
	});
	 
	 
	function fnReplace(val) {
	    var ret = 0;
	    if(typeof val != "undefined" && val != null && val != ""){
	        ret = Number(val.replace(/,/gi,''));
	    }
	    return ret;        
	}
</script>
</body>
</html>