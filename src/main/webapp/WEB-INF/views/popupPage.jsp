<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:if test="${mem.msm_id==null}">
    <script type="text/javascript">
    opener.document.location.href="<c:url value="/resvPage.do"/>"; 
    self.close();
    </script>
</c:if>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>예약등록</title>
    <meta name="description" content="FreshUI is a Premium Web App and Admin Template created by pixelcave and published on Themeforest.">
    <meta name="author" content="pixelcave">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon57.png"/>" sizes="57x57">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon72.png"/>"  sizes="72x72">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon76.png" />" sizes="76x76">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon114.png" />" sizes="114x114">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon120.png" />" sizes="120x120">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon144.png"/>"  sizes="144x144">
    <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon152.png" />" sizes="152x152">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/plugins.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link id="theme-link" rel="stylesheet" href="<c:url value="/resources/css/themes/dragon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/themes.css"/>">
    <script src="<c:url value="/resources/js/vendor/modernizr-respond.min.js"/>"></script>
</head>
<body>
<input type="hidden" name="msp_num" value="${vo.msp_num}"/>
<script>
function closePop(){
	opener.document.location.href="<c:url value="/resvPage.do"/>"; 
	self.close();
}
function changeBtnName()  {
	  const btnElement = document.getElementById('btn');
	  btnElement.innerText = '예약완료!';
	}
</script>
<div id="fx-container" class="fx-opacity">
    <div id="page-content" class="block">
        <div class="block">
            <!-- Basic Form Elements Title -->
            <div class="block-title">
                <h2>예약완료</h2>
            </div>
            <div class="col-sm-3">
            <table class="table table-borderless table-pricing">
                <tbody>
                    <tr>
                        <td> 예약이 완료 되었습니다.</td>
                    </tr>
                    <tr>
                        <td>(AM09:00 ~ PM18:00)</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="javascript:void(0)" onclick="closePop()" class="btn btn-sm btn-primary"> 닫기</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>