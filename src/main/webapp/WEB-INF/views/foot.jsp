<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*"%>
<%@page import="kr.ms.model.*"%>
        <!-- Footer -->
        <footer class="clearfix">
            <div class="pull-right">
                Crafted with <i class="fa fa-heart text-danger"></i> by <a href="#" target="_blank">내인생의 Spring은 지금</a>
            </div>
            <div class="pull-left">
                <span id="year-copy">2021-02</span> © <a href="#" target="_blank">주차해볼CAR! v.1</a>
            </div>
        </footer>
        <!-- END Footer -->
    </div>
    <!-- END FX Container -->
</div>
<!-- END Page Container -->

<!-- Scroll to top link, check main.js - scrollToTop() -->
<a href="javascript:void(0)" id="to-top"><i class="fa fa-angle-up"></i></a>

    <!-- Include Jquery library from Google's CDN but if something goes wrong get Jquery from local file (Remove 'http:' if you have SSL) -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>!window.jQuery && document.write(decodeURI('%3Cscript src="<c:url value="/resources/js/vendor/jquery-1.11.1.min.js"/>"%3E%3C/script%3E'));</script>
<!-- Bootstrap.js, Jquery plugins and custom Javascript code -->
<script src="<c:url value="/resources/js/vendor/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>
</body>
</html>