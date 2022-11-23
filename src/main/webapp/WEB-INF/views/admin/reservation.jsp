<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>전체 예약 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table table-hover">
        <tr>
          <th>예약번호</th>
          <th>예약자명</th>
          <th>전화번호</th>
          <th>차량</th>
          <th>연식</th>
          <th>차량번호</th>
          <th>카테고리</th>
          <th>세부</th>
          <th>딜리버리</th>
          <th>작업현황</th>
        </tr>
        <c:forEach items="${resList}" var="resList">
            <tr>
                <td>${resList.resId}</td>
                <td>${resList.memberName}</td>
                <td>${resList.memberMobile}</td>
                <td>${resList.carModel}</td>
                <td>${resList.carYear}</td>
                <td>${resList.carNumber}</td>
                <td>${resList.category}</td>
                <td>${resList.subcategory}</td>
                <c:choose>
                    <c:when test="${resList.delivery == 1}">
                        <td>O</td>
                    </c:when>
                    <c:otherwise>
                        <td>X</td>
                    </c:otherwise>
                </c:choose>
               <td>${resList.fin}</td>
                <td><a href="/reservation/reservation?resId=${resList.resId}">세부사항 조회</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>

</script>
</html>
