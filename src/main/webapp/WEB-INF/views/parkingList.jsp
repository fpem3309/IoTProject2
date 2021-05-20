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
                            <th class="text-center">주차장번호</th>
                            <th>주차장주소</th>
                            <th>차번호</th>
                            <th>예약종류</th>
                            <th>예약일자</th>
                            <th>회원명</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vo" items="${list}">
                        <tr>
                            <td class="text-center">${vo.msp_no}</td>
                            <td>${vo.msp_location}</td>     
                            <td>${vo.msp_num}</td>
                            <td>${vo.msp_type}</td>
                            <td>${vo.msp_date}</td>
                            <td>${vo.msm_name}</td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Edit Member" class="btn btn-xs btn-default" onclick="contentFn(${vo.msm_no})""><i class="fa fa-pencil"></i></a>
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Delete Member" class="btn btn-xs btn-default" onclick="deleteFn(${vo.msm_no})"><i class="fa fa-times"></i></a>
                                </div>
                            </td>
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
                            <th class="text-center">주차장번호</th>
                            <th>주차장주소</th>
                            <th>차번호</th>
                            <th>예약종류</th>
                            <th>예약일자</th>
                            <th>회원명</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vo" items="${list2}">
                        <tr>
                            <td class="text-center">${vo.msp_no}</td>
                            <td>${vo.msp_location}</td>     
                            <td>${vo.msp_num}</td>
                            <td>${vo.msp_type}</td>
                            <td>${vo.msp_date}</td>
                            <td>${vo.msm_name}</td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Edit Member" class="btn btn-xs btn-default" onclick="contentFn(${vo.msp_no})""><i class="fa fa-pencil"></i></a>
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Delete Member" class="btn btn-xs btn-default" onclick="deleteFn(${vo.msp_no})"><i class="fa fa-times"></i></a>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
      <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                <a href="javascript:void(0)" onclick="insertForm()" class="btn btn-primary" data-toggle="tooltip" title="" data-original-title="Insert Parking"><i class="fa fa-magic"></i>주차등록</a>
            </div>
        </div>
</div>

<jsp:include page="foot.jsp" flush="true" />
<script type="text/javascript">
function insertForm() {
    location.href = "<c:url value="/parkingForm.do"/>";
}
function contentFn(msp_no){
    location.href="<c:url value="/parkingContent.do"/>?msp_no="+msp_no;
}
function deleteFn(msp_no){
    location.href="<c:url value="/parkingDelete.do"/>?msp_no="+msp_no;
}
</script>
