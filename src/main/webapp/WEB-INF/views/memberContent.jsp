<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="kr.ms.model.*"%>
<%@page import="java.util.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="회원정보수정" scope="request"/>
<c:if test="${mem.msm_id==null}">
    <c:redirect url="/" />
</c:if>

<jsp:include page="head.jsp" flush="true"/>
<div id="page-content" class="block full">
    <ul class="breadcrumb breadcrumb-top">
        <li><i class="fa fa-th"></i></li>
        <li><a href="#">${vo.msm_name}님의상세보기</a></li>
    </ul>

    <div class="block">
        <!-- Basic Form Elements Title -->
        <div class="block-title">
            <h2>${headTitle}</h2>
        </div>
        <!-- Register Form -->
        <form action="<c:url value="/memberUpdate.do"/>" method="post" id="form-register" class="form-horizontal">
            <input type="hidden" name="msm_no" value="${vo.msm_no}">
            <input type="hidden" name="msm_level_no" value="${vo.msm_level_no}">
            <input type="hidden" name="msm_denied" value="${vo.msm_denied}">
            <div class="form-group">
                <div class="col-xs-12">
                    <label class="col-md-2 control-label" for="val_username">UserName</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                        <input type="text" id="register-username" name="msm_name" class="form-control input-lg" placeholder="Username" value="${vo.msm_name}" readonly>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <label class="col-md-2 control-label" for="val_username">UserID</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                        <input type="text" id="register-id" name="msm_id" class="form-control input-lg" placeholder="ID" value="${vo.msm_id}" readonly>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <label class="col-md-2 control-label" for="val_username">UserEmail</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                        <input type="text" id="register-id" name="msm_email" class="form-control input-lg" placeholder="email" value="${vo.msm_email}">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="val_username">UserPassword</label>
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-asterisk fa-fw"></i></span>
                        <input type="password" id="register-password" name="msm_password" class="form-control input-lg" placeholder="Password" value="${vo.msm_password}">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for="val_username">UserPhone</label>
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone fa-fw"></i></span>
                        <input type="text" id="register-phone" name="msm_phone" class="form-control input-lg" placeholder="Phone" value="${vo.msm_phone}">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="val_username">UserCar</label>
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-car fa-fw"></i></span>
                        <input type="text" id="register-car" name="msm_car" class="form-control input-lg" placeholder="Car" value="${vo.msm_car}">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="val_username">UserPoint</label>
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-cubes"></i></span>
                        <input type="text" id="register-point" name="msm_point" class="form-control input-lg" placeholder="Car" value="${vo.msm_point}">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12 text-right">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-arrow-right"></i> 수정</button>
                    <button type="reset" onclick="window.location.href='<c:url value="/"/>' " class="btn btn-default"><i class="fa fa-times"></i> 취소</button>
                    <c:if test="${isAdmin!=null}">
                    <button type="button" class="btn btn-default" onclick="memberList()"><i class="fa fa-angle-right"></i> 목록</button>
                    </c:if>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="foot.jsp" flush="true"/>

<script type="text/javascript">
function memberList() {
    location.href = "<c:url value="/memberList.do"/>";
}
</script>