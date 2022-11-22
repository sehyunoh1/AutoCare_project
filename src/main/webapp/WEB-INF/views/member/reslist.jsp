<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css/">
<script src="/resources/js/jquery.js"></script>
<html>
<head>
    <title>${sessionScope.member.memberName}님 예약 조회</title>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <button class="btn btn-secondary mt-5" onclick="desc()">날짜순↓</button>
    <button class="btn btn-secondary mt-5" onclick="asc()">날짜순↑</button>
  <table class="table table-hover">
    <tr>
      <th>예약 번호</th>
      <th>예약자명</th>
      <th>전화번호</th>
      <th>예약 차량모델</th>
      <th>예약 차량연식</th>
      <th>예약 차량번호</th>
      <th>카테고리</th>
      <th>예약 날짜</th>
    </tr>
   <c:forEach items="${list}" var="list">
      <tr>
          <td><a href="/reservation/reservation?resId=${list.resId}">${list.resId}</a></td>
        <td>${list.memberName}</td>
        <td>${list.memberMobile}</td>
        <td>${list.carModel}</td>
        <td>${list.carYear}</td>
        <td>${list.carNumber}</td>
        <td>${list.category}</td>
        <td>${list.serviceDate}</td>
    </tr>
   </c:forEach>
  </table>
</div>
</body>
<script>
    const desc = () => {
    location.href="/member/list/desc?id="+${sessionScope.member.id}
    }
    const asc = () => {
        location.href="/member/list?id="+${sessionScope.member.id}
    }
</script>
</html>
