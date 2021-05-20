<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:if test="${mem.msm_id==null}">
    <c:redirect url="/" />
</c:if>
<c:set var="cpath" value="${pageContext.request.contextPath}" scope="request" />
<c:set var="headTitle" value="주차장등록" scope="request" />

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

        <form action="<c:url value="/parkingInsert.do"/>" method="post" id="form-parking-insert" class="form-horizontal">
            <input type="hidden" name="msm_no" value="${mem.msm_no}" />

            <div class="form-group">
                <label class="col-md-2 control-label">월권 / 일권</label>
                <div class="col-md-10">
                    <label class="radio-inline" for="msp_type_1">
                        <input type="radio" id="msp_type_1" name="msp_type" value="1" checked="checked"> 월권
                    </label>
                    <label class="radio-inline" for="msp_type_2">
                        <input type="radio" id="msp_type_2" name="msp_type" value="2"> 일권
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="msp_location">주차장 주소</label>
                <div class="col-md-3">
                    <input type="text" id="msp_location" name="msp_location" class="form-control" placeholder="주차장 주소">
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="msp_location">주차공간 개수</label>
                <div class="col-md-3">
                    <input type="text" id="msp_num" name="msp_num" class="form-control" placeholder="주차공간 개수">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label" for=""msm_file"">주차장 공간 사진 첨부</label>
                <div class="col-md-5">
                    <input type="file" id=""msm_file"" name="msm_file">
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 text-right">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-arrow-right"></i> 등록</button>
                    <button type="reset" onclick="reset();" class="btn btn-default"><i class="fa fa-times"></i> 취소</button>
                    <button type="button" class="btn btn-default" onclick="parkingist()"><i class="fa fa-angle-right"></i> 목록</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="foot.jsp" flush="true" />

<script type="text/javascript">
function parkingist(){
    location.href="<c:url value="/parkingList.do"/>";
}

$(function () {
    /* Initialize Form Validation */
    $('#form-parking-insert').validate({
        errorClass: 'help-block', // You can add help-inline instead of help-block if you like validation messages to the right of the inputs
        errorElement: 'div',
        errorPlacement: function (error, e) {
            e.parents('.form-group > div').append(error);
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
            $(e).closest('.help-block').remove();
        },
        success: function (e) {
            // You can remove the .addClass('has-success') part if you don't want the inputs to get green after success!
            e.closest('.form-group').removeClass('has-success has-error').addClass('has-success');
            e.closest('.help-block').remove();
        },
        rules: {
            msp_type: {
                required: true
            },
            msp_location: {
                required: true,
                minlength: 10
            },
            msp_num: {
                required: true
            }
        },
        messages: {
            msp_type: {
                required: 'Please choice a type'
            },
            msp_location: {
                required: 'Please enter a valid location address',
                minlength: 'Your id must consist of at least 10 characters'
            },
            msp_num: {
                required:'Please enter a number'
            }
        }
    });
    
});
</script>