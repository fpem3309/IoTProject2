<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="kr.ms.model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

function BeforePage3(){
    location.href="${cpath}/townpage.do";
}
function parkingpage(msp_no){
    location.href="${cpath}/parkingpage.do?msp_no="+msp_no;
}
function parkingpage2(msp_no){
    location.href="${cpath}/parkingpage2.do?msp_no="+msp_no;
}
</script>

</head>
<body>

<input type="hidden" name="msm_no" value="${vo.msm_no}"/>



<h1>주차장 현황</h1>
<h4>월권</h4>
<table class = "table talbe-hover">
    <thead>
      <tr>
        <th class="tg-w4z7">주차장 번호</th>
        <th class="tg-w4z7">주차장 주소</th>
        <th class="tg-w4z7">주차 가능 공간</th>
        <th class="tg-w4z7">예약 종류</th>
        <th class="tg-w4z7">예약일자</th>
        <th class="tg-w4z7">회원이름</th>
        <th class="tg-w4z7">신청</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var ="vo" items="${list}">
      <tr>
        <td class="tg-0pky">${vo.msp_no}</td>
        <td class="tg-0pky">${vo.msp_location}</td>     
        <td class="tg-0pky">${vo.msp_num}</td>
        <td class="tg-0pky">${vo.msp_type}</td>
        <td class="tg-0pky">${vo.msp_date}</td>
        <td class="tg-0pky">${vo.msm_name}</td>
        <td class="tg-0lax"><input type ="button" onclick = "parkingpage(${vo.msp_no})" value="신청" id="go"></td>
      </tr>


    </c:forEach>
  </tbody>  
 </table>
 
<h4>일권</h4>
<table class = "table talbe-hover">
    <thead>
      <tr>
        <th class="tg-w4z7">주차장 번호</th>
        <th class="tg-w4z7">주차장 주소</th>
        <th class="tg-w4z7">주차 가능 공간</th>
        <th class="tg-w4z7">예약 종류</th>
        <th class="tg-w4z7">예약일자</th>
        <th class="tg-w4z7">회원이름</th>
        <th class="tg-w4z7">신청</th>
      </tr>
    </thead>
    <tbody> 
        <c:forEach var ="vo" items="${list2}">
      <tr>
      
        <td class="tg-0pky">${vo.msp_no}</td>
        <td class="tg-0pky">${vo.msp_location}</td>     
        <td class="tg-0pky">${vo.msp_num}</td>
        <td class="tg-0pky">${vo.msp_type}</td>
        <td class="tg-0pky">${vo.msp_date}</td>
        <td class="tg-0pky">${vo.msm_name}</td>
        <td class="tg-0lax"><input type ="button" onclick = "parkingpage2(${vo.msp_no})" value = "신청">
      </tr>
    </c:forEach>

  </tbody>  
 </table>
 <p><input type ="button" onclick ="BeforePage3()" value="뒤로가기"></p>
</body>
</html>