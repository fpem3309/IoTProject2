<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="공지사항"  scope="request"/>

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
        <div class="table-responsive">
            <div id="example-datatable_wrapper" class="dataTables_wrapper form-inline no-footer">
                <div class="row">
                    <div class="col-sm-6 col-xs-5">
                        <div class="dataTables_length" id="example-datatable_length">
                            <label>
                            <select id="cntPerPage" name="sel" onchange="selChange()" aria-controls="example-datatable" class="form-control">
                                <option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                                <option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                                <option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                                <option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
                            </select>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-7">
                        <div id="example-datatable_filter"
                            class="dataTables_filter">
                            <label>
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="Search" aria-controls="example-datatable">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>
                <table id="example-datatable" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example-datatable_info">
                    <thead>
                        <tr>
                            <th class="text-center">No</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <c:if test="${isAdmin!=null}">
                            <th class="text-center">Actions</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                          <c:forEach var="vo" items="${list}">
                          <tr>
                            <td class="text-center">${vo.rn}</td>
                            <td><a href="<c:url value="/boardContent.do"/>?msnb_no=${vo.msnb_no}" >${vo.msnb_subject}</a></td>
                            <td>${vo.msm_name}</td>
                            <td>${vo.msnb_date}</td>
                            <td>${vo.msnb_hit}</td>
                            <c:if test="${isAdmin!=null}">
                            <td class="text-center">
                                <div class="btn-group">
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Edit Board" class="btn btn-xs btn-default" onclick="contentFn(${vo.msnb_no})""><i class="fa fa-pencil"></i></a>
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Delete Board" class="btn btn-xs btn-default" onclick="deleteFn(${vo.msnb_no})"><i class="fa fa-times"></i></a>
                                </div>
                            </td>
                            </c:if>
                        </tr>
                        </c:forEach>
                    </tbody>
                    <c:if test="${isAdmin!=null}">
                    <tfoot>
                        <tr>
                            <td colspan="6">
                                <div class="btn-group btn-group-sm">
                                    <a href="javascript:void(0)" onclick="insertForm()" class="btn btn-default" data-toggle="tooltip" title="" data-original-title="Insert Member"><i class="fa fa-magic"></i>글쓰기</a>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                    </c:if>
                </table>
                <div class="row">
                    <div class="col-sm-5 hidden-xs">
                        <div class="dataTables_info"
                            id="example-datatable_info" role="status"
                            aria-live="polite">
                            <strong>${paging.start}</strong>-<strong>${paging.end}</strong> of <strong>${paging.total}</strong>
                        </div>
                    </div>
                    <div class="col-sm-7 col-xs-12 clearfix">
                        <div class="dataTables_paginate paging_bootstrap" id="example-datatable_paginate">
                            <ul class="pagination pagination-sm remove-margin">
                                <c:if test="${paging.startPage != 1 }">
                                <li class="prev">
                                    <a href="<c:url value="/boardList.do"/>?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}""><i class="fa fa-chevron-left"></i> </a>
                                </li>
                                </c:if>
                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                                    <c:choose>
                                        <c:when test="${p == paging.nowPage }">
                                <li class="active"><a href="javascript:void(0)"><b>${p }</b></a></li>
                                        </c:when>
                                        <c:when test="${p != paging.nowPage }">
                                <li><a href="<c:url value="/boardList.do"/>?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                        </c:when>
                                    </c:choose>
                                    
                                </c:forEach>
                                <c:if test="${paging.endPage != paging.lastPage}">
                                <li class="next">
                                    <a href="<c:url value="/boardList.do"/>?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"><i class="fa fa-chevron-right"></i></a>
                                </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="foot.jsp" flush="true" />

<script type="text/javascript">
function insertForm() {
    location.href = "<c:url value="/boardForm.do"/>";
}
function deleteFn(msnb_no) {
    location.href = "<c:url value="/boardDelete.do"/>?msnb_no="+ msnb_no;
}
function contentFn(msnb_no) {
    location.href = "<c:url value="/boardContent.do"/>?msnb_no=" + msnb_no;
}
function selChange() {
    var sel = document.getElementById('cntPerPage').value;
    location.href = "<c:url value="/boardList.do"/>?nowPage=${paging.nowPage}&cntPerPage="+sel;
}
</script>

