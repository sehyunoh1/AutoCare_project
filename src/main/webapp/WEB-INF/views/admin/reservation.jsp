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
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">이전</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item active">
                        <a href="/board/?page=${i}" class="page-link">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
<script>

</script>
</html>
