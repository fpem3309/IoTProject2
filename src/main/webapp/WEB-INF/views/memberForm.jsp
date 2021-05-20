<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"  scope="request"/>
<c:set var="headTitle" value="회원가입"  scope="request" />

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
        <!-- Register Form -->
        <form action="<c:url value="/memberInsert.do"/>" method="post" id="form-register" class="form-horizontal">
            <input type="hidden" name="msm_level_no" value="2">
            <input type="hidden" name="msm_denied" value="1">
            <input type="hidden" name="msm_point" value="0">
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                        <input type="text" id="msm_name" name="msm_name" class="form-control input-lg" placeholder="Username">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                        <input type="text" id="msm_id" name="msm_id" class="form-control input-lg" placeholder="ID">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                        <input type="text" id="msm_email" name="msm_email" class="form-control input-lg" placeholder="email">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-asterisk fa-fw"></i></span>
                        <input type="password" id="msm_password" name="msm_password" class="form-control input-lg" placeholder="Password">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-asterisk fa-fw"></i></span>
                        <input type="password" id="msm_password_verify" name="msm_password_verify" class="form-control input-lg" placeholder="Verify Password">
                    </div>
                    <!--
                    Hidden checkbox. Its checked property will be toggled every time the terms (#btn-terms) button is clicked (js code at the bottom)
                    You can add the checked property by default (the button will be enabled automatically)
                    -->
                    <input type="checkbox" id="register-terms" name="register-terms" hidden>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone fa-fw"></i></span>
                        <input type="text" id="msm_phone" name="msm_phone" class="form-control input-lg" placeholder="Phone">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-car fa-fw"></i></span>
                        <input type="text" id="msm_car" name="msm_car" class="form-control input-lg" placeholder="Car">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-8">
                    <div class="btn-group">
                        <a href="#modal-terms" class="btn btn-sm btn-primary" data-toggle="modal">Terms</a>
                        <button type="button" class="btn btn-sm btn-default" data-toggle="button" id="btn-terms"><i class="fa fa-check"></i> Agree</button>
                    </div>
                </div>
                <div class="col-xs-4 text-right">
                    <button type="reset" onclick="window.location.href='<c:url value="/"/>' " class="btn btn-sm btn-default"><i class="fa fa-times"></i> Reset</button>
                    <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> Register</button>
                </div>
            </div>
        </form>
        <!-- END Register Form -->

        <!-- Modal Terms -->
        <div id="modal-terms" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">회원가입약관</h4>
                    </div>
                    <div class="modal-body">
                        <h4>약관</h4>
                        <p>회원이 되고 싶거든 동의를 하시오.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Modal Terms -->
    </div>

</div>
<!-- END Page Content -->

<jsp:include page="foot.jsp" flush="true" />

<script>
    $(function () {
        /* Initialize Form Validation */
        $('#form-register').validate({
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
                msm_name: {
                    required: true,
                    minlength: 3
                },
                msm_id: {
                    required: true,
                    minlength: 3
                },
                msm_email: {
                    required: true,
                    email: true
                },
                msm_password: {
                    required: true,
                    minlength: 4
                },
                msm_password_verify: {
                    required: true,
                    minlength: 4,
                    equalTo: '#msm_password'
                }
            },
            messages: {
                msm_name: {
                    required: 'Please enter a username',
                    minlength: 'Your username must consist of at least 3 characters'
                },
                msm_id: {
                    required: 'Please enter a id',
                    minlength: 'Your id must consist of at least 3 characters'
                },
                msm_email: {
                    required:'Please enter a valid email address'
                },
                msm_password: {
                    required: 'Please provide a password',
                    minlength: 'Your password must be at least 4 characters long'
                },
                msm_password_verify: {
                    required: 'Please provide a password',
                    minlength: 'Your password must be at least 4 characters long',
                    equalTo: 'Please enter the same password as above'
                }
            }
        });
        
    });
</script>

