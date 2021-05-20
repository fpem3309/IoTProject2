<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="예약  > 지역선택"  scope="request"/>
<c:if test="${mem.msm_id==null}">
    <c:redirect url="/" />
</c:if>

<jsp:include page="head.jsp" flush="true" />

<!-- Page content -->
<div id="page-content" class="block full">
    <ul class="breadcrumb breadcrumb-top">
        <li><i class="fa fa-th"></i></li>
        <li><a href="#">${headTitle}</a></li>
    </ul>
    
    <div class="block">
        <!-- Basic Form Elements Title -->
        <div class="block-title">
            <h2>${headTitle}</h2>
        </div>
        
        <form name="parkingList2.do" id="parkingList2" class="form-horizontal form-bordered">
            <div class="form-group">
                <label class="col-sm-1 control-label" for="example-select">지역선택</label>
                <div class="col-sm-2">
                    <select id="sido" name="sido" class="form-control" size="1" onchange="areaChange(this)">
                        <option value="" >시/도</option>
                        <option value="1">서울</option>
                        <option value="2">부산</option>
                        <option value="3">대구</option>
                        <option value="4">인천</option>
                        <option value="5">광주</option>
                        <option value="6">대전</option>
                        <option value="7">울산</option>
                        <option value="8">강원</option>
                        <option value="9">경기</option>
                        <option value="10">경남</option>
                        <option value="11">경북</option>
                        <option value="12">전남</option>
                        <option value="13">전북</option>
                        <option value="14">제주</option>
                        <option value="15">충남</option>
                        <option value="16">충북</option>
                    </select>
                </div>

                <label class="col-sm-1 control-label" for="example-select">동선택</label>
                <div class="col-sm-2">
                    <select id="gugun" name="gugun" class="form-control" size="1">
                    </select>
                </div>

                <label class="col-sm-1 control-label">월간/주간</label>
                <div class="col-sm-2">
                    <label class="radio-inline" for="msp_type_1">
                        <input type="radio" id="msp_type_1" name="msp_type" value="1" checked> 월간
                    </label>
                    <label class="radio-inline" for="msp_type_2">
                        <input type="radio" id="msp_type_2" name="msp_type" value="2"> 일간
                    </label>
                </div>

                <div class="col-sm-1">
                    <button type="button" class="btn btn-sm btn-primary" id="parkingList2Btn"><i class="fa fa-angle-right"></i> 목록보기</button>
                </div>
            </div>
        </form>
    </div>
    
    <div class="block">
        <!-- Basic Form Elements Title -->
        <div class="block-title">
            <h2>${headTitle}</h2>
        </div>
        <div class="form-horizontal form-bordered" id="parkingList21">
            
        </div>
    </div>
    <!-- END block -->

</div>
<!-- END Page Content -->

<jsp:include page="foot.jsp" flush="true" />
<script src="<c:url value="/resources/js/parkPage.js"/>"></script>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- <div class="modal-content" id="regist">-->
            <div class="modal-header">
                    <div class="block">
                        <!-- Basic Form Elements Title -->
                        <div class="block-title">
                            <h2>예약신청</h2>
                        </div>
                        <div class="form-horizontal form-bordered" id="parkingList21"></div>
                    </div>
            </div>
            <div class="modal-body" id="modify"></div>
        </div>
    </div>
</div>
