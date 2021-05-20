<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${headTitle}</title>
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
<body class="header-fixed-top">
    <div id="sidebar-left" class="enable-hover">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Search Form -->
            <!-- <form action="search.do" method="post" class="sidebar-search">
                <input type="text" id="sidebar-search-term" name="sidebar-search-term" placeholder="Search..">
            </form> -->
            <!-- END Search Form -->

            <!-- Wrapper for scrolling functionality -->
            <div class="sidebar-left-scroll">
                <!-- Sidebar Navigation -->
                <ul class="sidebar-nav">
                    <c:if test="${mem.msm_no!=null}">
                    <li>
                        <h2 class="sidebar-header">나의정보</h2>
                    </li>
                    <li>
                        <a href="<c:url value="/memberContent.do"/>?msm_no=${mem.msm_no}"><i class="fa fa-coffee"></i>개인정보</a>
                    </li>
                    <li>
                        <h2 class="sidebar-header">주차관리</h2>
                    </li>
                    <c:if test="${isAdmin!=null}">
                    <li>
                        <a href="<c:url value="/parkingList.do"/>?msm_no=${mem.msm_no}"><i class="fa fa-coffee"></i>주차장관리</a>
                    </li>
                    <li>
                        <a href="<c:url value="/resvPageManager.do"/>"><i class="fa fa-coffee"></i>예약관리</a>
                    </li>
                    </c:if>
                    <li>
                        <a href="<c:url value="/areaPage.do"/>"><i class="fa fa-coffee"></i>예약신청</a>
                    </li>
                    <li>
                        <a href="<c:url value="/resvPage.do"/>"><i class="fa fa-coffee"></i>예약내역</a>
                    </li>
                    </c:if>
                    <li>
                        <h2 class="sidebar-header">게시판</h2>
                    </li>
                    <li>
                        <a href="<c:url value="/boardList.do"/>"><i class="fa fa-coffee"></i>공지</a>
                    </li>
                    <!-- <li>
                        <a href="#" onclick="alert('준비중입니다.');"><i class="fa fa-coffee"></i>쿠폰등록</a>
                    </li> -->
                </ul>
                <!-- END Sidebar Navigation -->
            </div>
            <!-- END Wrapper for scrolling functionality -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Left Sidebar -->

    <div id="sidebar-right">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- User Info -->
            <div class="user-info">
                <div class="user-details"><a href="#">주차해볼CAR!</a><br><em>${mem.msm_name}</em></div>
                <img src="<c:url value="/resources/img/template/avatar.png"/>" alt="Avatar">
            </div>
            <!-- END User Info -->

            <!-- Wrapper for scrolling functionality -->
            <div class="sidebar-right-scroll">
                <!-- User Menu -->
                <ul class="sidebar-nav">
                    <c:if test="${isAdmin!=null}">
                    <li>
                        <h2 class="sidebar-header">Explore</h2>
                    </li>
                    </c:if>
                    <c:if test="${mem.msm_no!=null}">
                    <li>
                        <a href="<c:url value="/logout.do"/>"><i class="fa fa-power-off"></i> Logout</a>
                    </li>
                    </c:if>
                    <c:if test="${mem.msm_no==null }">
                    <li>
                        <a href="<c:url value="/loginForm.do"/>"><i class="fa fa-power-off"></i> Login</a>
                    </li>
                    <li>
                        <a href="<c:url value="/memberForm.do"/>"><i class="fa fa-pencil-square animation-bigEntrance"></i> Register</a>
                    </li>
                    </c:if>
                    
                </ul>
                <!-- END User Menu -->
                
            </div>
            <!-- END Wrapper for scrolling functionality -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Right Sidebar -->

    <!-- Page Container -->
    <div id="page-container">
        <header class="navbar navbar-inverse navbar-fixed-top">
            <!-- Right Header Navigation -->
            <ul class="nav header-nav pull-right">
                <li>
                    <a href="javascript:void(0)" id="sidebar-right-toggle">
                        <strong></strong> <i class="fa fa-user"></i>
                    </a>
                </li>
            </ul>
            <!-- END Right Header Navigation -->

            <!-- Left Header Navigation -->
            <ul class="nav header-nav pull-left">
                <li>
                    <a href="javascript:void(0)" id="sidebar-left-toggle">
                        <i class="fa fa-bars"></i>
                    </a>
                </li>
            </ul>
            <!-- END Left Header Navigation -->

            <!-- Header Brand -->
            <a href="<c:url value="/"/>" class="navbar-brand">
                <img src="<c:url value="/resources/img/template/drop.png"/>" alt="주차해볼CAR!">
                <span>CAR</span>
            </a>
            <!-- END Header Brand -->
        </header>
        <!-- END Header -->
        
        <div id="fx-container" class="fx-opacity">
