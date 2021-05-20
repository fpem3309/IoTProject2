<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" scope="request"/>
<c:set var="headTitle" value="로그인"  scope="request"/>
<c:if test="${mem.msm_id!=null}">
    <c:redirect url="/memberList.do" />
</c:if>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">

        <title>Welcome to SmartCar Login</title>

        <meta name="description" content="FreshUI is a Premium Web App and Admin Template created by pixelcave and published on Themeforest.">
        <meta name="author" content="pixelcave">
        <meta name="robots" content="noindex, nofollow">

        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">

        <!-- Icons -->
        <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
        <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon57.png"/> sizes="57x57">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon72.png"/> sizes="72x72">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon76.png"/> sizes="76x76">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon114.png"/> sizes="114x114">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon120.png"/>  sizes="120x120">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon144.png"/>  sizes="144x144">
        <link rel="apple-touch-icon" href="<c:url value="/resources/img/icon152.png"/>  sizes="152x152">
        <!-- END Icons -->

        <!-- Stylesheets -->
        
        <!-- Bootstrap is included in its original form, unaltered -->
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">

        <!-- Related styles of various icon packs and javascript plugins -->
        <link rel="stylesheet" href="<c:url value="/resources/css/plugins.css" />" >

        <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
        <link rel="stylesheet" href="<c:url value="/resources/css/main.css" />" >

        <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

        <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
        <link id="theme-link" rel="stylesheet" href="<c:url value="/resources/css/themes/dragon.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/themes.css" />" >
        <!-- END Stylesheets -->

        <!-- Modernizr (Browser feature detection library) & Respond.js (Enable responsive CSS code on browsers that don't support it, eg IE8) -->
        <script type="text/javascript" src="<c:url value="/resources/js/vendor/modernizr-respond.min.js"/>"></script>
    </head>
    <body>
        <!-- Header -->
        <header class="navbar navbar-inverse navbar-fixed-top">
            <!-- Header Brand -->
            <a href="<c:url value="/"/>" class="navbar-brand">
                <img src="<c:url value="/resources/img/template/drop.png"/>" alt="SmartCar">
                <span>SmartCar</span>
            </a>
            <!-- END Header Brand -->
        </header>
        <!-- END Header -->

        <!-- Login Container -->
        <div id="login-container">
            <!-- Page Content -->
            <div id="page-content" class="block remove-margin">
                <!-- Login Title -->
                <div class="block-header">
                    <div class="header-section">
                        <h1 class="text-center">Welcome to SmartCar Login<br><small>Please Login or Register</small></h1>
                    </div>
                </div>
                <!-- END Login Title -->

                <!-- Login Form -->
                <form action="<c:url value="/login.do"/>" method="post" id="form-login" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input type="text" id="msm_id" name="msm_id" class="form-control input-lg has-error" placeholder="User ID">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input type="password" id="msm_password" name="msm_password" class="form-control input-lg" placeholder="Password">

                            <!--
                            Hidden checkbox. Its checked property will be toggled every time the remember me (#btn-remember) button is clicked (js code at the bottom)
                            You can add the checked property by default (the button will be enabled automatically)
                            -->
                            <input type="checkbox" id="login-remember" name="login-remember" hidden>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-8">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-default disabled">Remember me?</button>
                                <button type="button" class="btn btn-sm btn-default" data-toggle="button" id="btn-remember"><i class="fa fa-check"></i></button>
                            </div>
                        </div>
                        <div class="col-xs-4 text-right">
                            <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> Login</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <p class="text-center remove-margin"><small>Don't have an account?</small> <a href="javascript:void(0)" id="link-login"><small>Create one for free!</small></a></p>
                        </div>
                    </div>
                </form>
                <!-- END Login Form -->

                <!-- Register Form -->
                <form action="<c:url value="/memberInsert.do"/>" method="post" id="form-register" class="form-horizontal display-none">
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
                            <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> Register</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <p class="text-center remove-margin"><small>Oops, you have an account?</small> <a href="javascript:void(0)" id="link-register"><small>Login!</small></a></p>
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
            <!-- END Page Content -->
        </div>
        <!-- END Login Container -->

        <!-- Include Jquery library from Google's CDN but if something goes wrong get Jquery from local file (Remove 'http:' if you have SSL) -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script>!window.jQuery && document.write(decodeURI('%3Cscript src="<c:url value="/resources/js/vendor/jquery-1.11.1.min.js"/>"%3E%3C/script%3E'));</script>

        <!-- Bootstrap.js, Jquery plugins and custom Javascript code -->
        <script src="<c:url value="/resources/js/vendor/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src="<c:url value="/resources/js/main.js"/>"></script>

        <!-- Javascript code only for this page -->
        <script>
            $(function () {
                /* Save buttons (remember me and terms) and hidden checkboxes in variables */
                var checkR = $('#login-remember'),
                    checkT = $('#register-terms'),
                    btnR = $('#btn-remember'),
                    btnT = $('#btn-terms');

                // Add the 'active' class to button if their checkbox has the property 'checked'
                if (checkR.prop('checked'))
                    btnR.addClass('active');
                if (checkT.prop('checked'))
                    btnT.addClass('active');

                // Toggle 'checked' property of hidden checkboxes when buttons are clicked
                btnR.on('click', function () {
                    checkR.prop('checked', !checkR.prop('checked'));
                });
                btnT.on('click', function () {
                    checkT.prop('checked', !checkT.prop('checked'));
                });

                /* Login & Register show-hide */
                var formLogin = $('#form-login'),
                    formRegister = $('#form-register');

                $('#link-login').click(function () {
                    formLogin.slideUp(250);
                    formRegister.slideDown(250);
                });
                $('#link-register').click(function () {
                    formRegister.slideUp(250);
                    formLogin.slideDown(250);
                });
                
                /* Initialize Form Validation */
                $('#form-login').validate({
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
                        msm_id: {
                            required: true,
                            minlength: 3
                        },
                        msm_password: {
                            required: true,
                            minlength:4
                        }
                    },
                    messages: {
                        msm_id: {
                            required: 'Please enter a user id',
                            minlength: 'Your user id must consist of at least 3 characters'
                        },
                        msm_password: {
                            required: 'Please provide a password',
                            minlength: 'Your password must be at least 4 characters long'
                        }
                    }
                });
                
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
    </body>
</html>
