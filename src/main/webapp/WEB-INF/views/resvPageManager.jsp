<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:if test="${mem.msm_id==null}">
    <c:redirect url="/" />
</c:if>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="주차장관리"  scope="request"/>

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
            <h2>월권 주차</h2>
        </div>

        <div class="table-responsive">
            <div id="example-datatable_wrapper" class="dataTables_wrapper form-inline no-footer">
                <table id="example-datatable" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example-datatable_info">
                    <thead>
                        <tr>
                            <th >주차장소</th>
                            <th >관리자</th>
                            <th >결제금액</th>
                            <th >예약해당날짜</th>
                            <th >관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vo" items="${list3}">
                            <tr>
                                <td >${vo.msp_location}</td>
                                <td >${vo.msm_name}</td>
                                <td >${vo.msr_price}</td>
                                <td >${vo.msr_usedate}</td>
                                <td ><input type="button"  onclick="resvDelete(${vo.msr_no})" value="취소" class="btn btn-sm btn-default"></td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="block">
        <!-- Basic Form Elements Title -->
        <div class="block-title">
            <h2>일권 주차</h2>
        </div>

        <div class="table-responsive">
            <div id="example-datatable_wrapper" class="dataTables_wrapper form-inline no-footer">
                <table id="example-datatable" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example-datatable_info">
                    <thead>
                        <tr>
                            <th >주차장소</th>
                            <th >관리자</th>
                            <th >결제금액</th>
                            <th >예약해당날짜</th>
                            <th >관리</th>
                        </tr>
                    </thead>
                    <c:forEach var="vo" items="${list4}">
                        <tbody>
                        <tr>
                            <td >${vo.msp_location}</td>
                            <td >${vo.msm_name}</td>
                            <td >${vo.msr_price}</td>
                            <td >${vo.msr_usedate}</td>
                            <td ><input type="button" onclick="resvDelete(${vo.msr_no})" value="취소" class="btn btn-sm btn-default"></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="foot.jsp" flush="true" />

<script type="text/javascript">
    function resvDelete(msr_no){
       location.href="<c:url value="/resvDelete.do"/>?msr_no="+msr_no;
    }

</script>

