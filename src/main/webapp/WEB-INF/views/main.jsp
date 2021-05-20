<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="Smart Car"  scope="request"/>

<jsp:include page="head.jsp" flush="true" />

<div id="page-content" class="block">
    <div class="block-header">
    
        <div class="row remove-margin">
            <!-- Title -->
            <div class="col-md-12">
                <!-- If you do not want a link in the header, instead of .header-title-link you can use a div with the class .header-section -->
                <a href="#" class="header-title-link">
                    <h1><i class="fa fa-coffee animation-expandUp"></i>주차해볼CAR!<br><small>Welcome to 주차해볼CAR!</small></h1>
                </a>
            </div>
            <!-- END Title -->
    
            <div class="col-md-4">
                <!-- If you do not want a link in the header, instead of .header-title-link you can use a div with the class .header-section -->
                <a href="#" class="header-title-link">
                    <img src="<c:url value="/resources/img/introcar.jpg"/>" class="animation-tossing text-center" style="width:100%">
                </a>
            </div>
            
            <!-- Statistics -->
            <div class="col-md-8">
                <c:if test="${mem.msm_no!=null}">
                <!-- Outer Grid -->
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Inner Grid 1 -->
                        <div class="row">
                            <div class="col-xs-4">
                                <a href="<c:url value="/memberContent.do"/>?msm_no=${mem.msm_no}" class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>개인정보</strong><br><small>Member</small>
                                    </h1>
                                </a>
                            </div>
                            <div class="col-xs-4">
                                <a href="<c:url value="/areaPage.do"/>" class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>예약신청</strong><br><small>Reservation</small>
                                    </h1>
                                </a>
                            </div>
                            <div class="col-xs-4">
                                <a href="<c:url value="/resvPage.do"/>"  class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>예약내역</strong><br><small>Reservation details</small>
                                    </h1>
                                </a>
                            </div>
                        </div>
                        <!-- END Inner Grid 1 -->
                    </div>
                    <div class="col-sm-6">
                        <!-- Inner Grid 2 -->
                        <div class="row">
                            <div class="col-xs-4">
                                <a href="<c:url value="/boardList.do"/>" class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>공지</strong><br><small>Notice</small>
                                    </h1>
                                </a>
                            </div>
                            <!-- <div class="col-xs-4">
                                <a href="page_special_timeline.html" class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>쿠폰</strong><br><small>Coupon</small>
                                    </h1>
                                </a>
                            </div>
                            <div class="col-xs-4">
                                <c:if test="${isAdmin!=null}">
                                <a href="#" class="header-link">
                                    <h1 class="animation-pullDown">
                                        <strong>주차장관리</strong><br><small>Parking</small>
                                    </h1>
                                </a>
                                </c:if>
                            </div> -->
                        </div>
                        <!-- END Inner Grid 2 -->
                    </div>
                    </c:if>
                    <c:if test="${mem.msm_no==null}">
                    <div class="row">
                        <div class="col-sm-6">
                            <!-- Inner Grid 1 -->
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="<c:url value="/loginForm.do"/>" class="header-link">
                                        <h1 class="animation-pullDown">
                                            <strong>로그인</strong><br><small>Login</small>
                                        </h1>
                                    </a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="<c:url value="/memberForm.do"/>" class="header-link">
                                        <h1 class="animation-pullDown">
                                            <strong>회원가입</strong><br><small>Register</small>
                                        </h1>
                                    </a>
                                </div>
                            </div>
                            <!-- END Inner Grid 1 -->
                        </div>
                        
                    </div>
                    </c:if>
                    
                     <!-- END Outer Grid  -->
            </div>
            <!-- END Statistics -->
        </div>
    </div>
</div>

<jsp:include page="foot.jsp" flush="true" />
