
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css/">
<script src="/resources/js/jquery.js"></script>
<html>
<head>
    <title>${sessionScope.member.memberName}님 예약 조회</title>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
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
    <tr>
      <td>${reslist.resId}</td>
      <td>${reslist.memberName}</td>
      <td>${reslist.memberMobile}</td>
      <td>${reslist.carModel}</td>
      <td>${reslist.carYear}</td>
      <td>${reslist.carNumber}</td>
      <td>${reslist.category}</td>
      <td>${reslist.serviceDate}</td>
    </tr>
  </table>
</div>
</body>
</html>
