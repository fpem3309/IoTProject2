<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" scope="request" />
<c:set var="headTitle" value="예약내역 및 주차장 사용" scope="request" />
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
        <!-- PT On the Grid Title -->
        <div class="block-title">
            <h2>월주차관리</h2>
        </div>
        <!-- END PT On the Grid Title -->

        <!-- PT On the Grid Content -->
        <div class="row">
            <c:forEach var="vo" items="${list}">
            <div class="col-sm-3">
                <table class="table table-borderless table-pricing table-featured">
                    <thead>
                        <tr>
                            <th>2월</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>주차장소</strong><br><small>${vo.msp_location}</small></td>
                        </tr>
                        <tr>
                            <td><strong>주차상태</strong><br><small>${vo.msr_use!=1?"OFF":"ON"}</small></td>
                        </tr>
                        <tr>
                            <td><strong>예약일</strong><br><small>${vo.msr_usedate}</small></td>
                        </tr>
                        <tr>
                            <td><strong>예약 자리 번호</strong><br><small>${vo.msr_num}</small></td>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${vo.msr_use!=1}">
                                <a href="javascript:void(0)" onclick="parkOpen(${vo.msr_no}, ${mem.msm_no });" class="btn btn-danger">주차하기</a>
                                </c:if>
                                <c:if test="${vo.msr_use==1}">
                                <a href="javascript:void(0)" class="btn btn-danger" onclick="parkClose(${vo.msr_no}, ${mem.msm_no });" >주차중</a>
                                </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </c:forEach>
        </div>
        <!-- END PT On the Grid Content -->
    </div>

    <div class="block">
        <!-- PT On the Grid Title -->
        <div class="block-title">
            <h2>일주차관리</h2>
        </div>
        <!-- END PT On the Grid Title -->

        <!-- PT On the Grid Content -->
        <div class="row">
            <c:forEach var="vo" items="${list2}">
            <div class="col-sm-3">
                <table class="table table-borderless table-pricing table-featured">
                    <thead>
                        <tr>
                            <th>2월</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>주차장소</strong><br><small>${vo.msp_location}</small></td>
                        </tr>
                        <tr>
                            <td><strong>주차상태</strong><br><small>${vo.msr_use!=1?"OFF":"ON"}</small></td>
                        </tr>
                        <tr>
                            <td><strong>예약일</strong><br><small>${vo.msr_usedate}</small></td>
                        </tr>
                        <tr>
                            <td><strong>예약 자리 번호</strong><br><small>${vo.msr_num}</small></td>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${vo.msr_use!=1}">
                                <a href="javascript:void(0)" onclick="parkOpen(${vo.msr_no}, ${mem.msm_no });" class="btn btn-danger">주차하기</a>
                                </c:if>
                                <c:if test="${vo.msr_use==1}">
                                <a href="javascript:void(0)" class="btn btn-danger" onclick="parkClose(${vo.msr_no}, ${mem.msm_no });" >주차중</a>
                                </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </c:forEach>
        </div>
        <!-- END PT On the Grid Content -->
    </div>
    
</div>
<jsp:include page="foot.jsp" flush="true" />

<script type="text/javascript">
    function parkOpen(msr_no, msm_no) {
        window.location.href = "<c:url value="/parkOpen.do"/>?msr_no="+msr_no+"&msm_no="+msm_no;
    }

    function parkClose(msr_no, msm_no) {
        window.location.href = "<c:url value="/parkClose.do"/>?msr_no="+msr_no+"&msm_no="+msm_no;
    }
</script>