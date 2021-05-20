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

        <form action="<c:url value="/boardUpdate.do"/>" method="post" id="form-board" class="form-horizontal">
             <input type="hidden" name="msm_no" value="${mem.msm_no}">
             <input type="hidden" name="msnb_no" value="${vo.msnb_no}">
            <div class="form-group">
                <label class="col-md-2 control-label" for="msnb_subject">제목</label>
                <div class="col-md-3">
                    <input type="text" id="msnb_subject" name="msnb_subject" class="form-control" placeholder="제목을 작성해주세요" value="${vo.msnb_subject}"  <c:if test="${isAdmin==null}">readonly</c:if>>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="msnb_content">내용</label>
                <div class="col-md-6">
                    <textarea id="msnb_content" name="msnb_content" rows="6" class="form-control" placeholder="내용을 입력해주세요" <c:if test="${isAdmin==null}">readonly</c:if>>${vo.msnb_content}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12 text-right">
                    <c:if test="${isAdmin!=null}">
                    <button type="submit" class="btn btn-info btn-primary"><i class="fa fa-angle-right"></i> 수정</button>
                    <button type="reset" onclick="reset();" class="btn btn-default"><i class="fa fa-times"></i> Reset</button>
                    </c:if>
                    <button type="button" onclick ="location.href='<c:url value="boardList.do"/>'" class="btn btn-default">목록으로</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="foot.jsp" flush="true" />
