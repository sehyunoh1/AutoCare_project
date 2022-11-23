<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>세부내용</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #fin{
            width:100px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mt-5">
      <table class="table">
         <tr>
             <th>예약 번호</th>
             <td>${detail.resId}</td>
         </tr>
          <tr>
              <th>예약자명</th>
              <td>${detail.memberName}</td>
          </tr>
          <tr>
              <th>전화번호</th>
              <td>${detail.memberMobile}</td>
          </tr>
          <tr>
              <th>차량 모델</th>
              <td>${detail.carModel}</td>
          </tr>
          <tr>
              <th>차량 연식</th>
              <td>${detail.carYear}</td>
          </tr>
          <tr>
              <th>차량 번호</th>
              <td>${detail.carNumber}</td>
          </tr>
          <tr>
              <th>카테고리</th>
              <td>${detail.category}</td>
          </tr>
          <tr>
              <th>세부 카테고리</th>
              <td>${detail.subcategory}</td>
          </tr>
          <tr>
              <th>내용</th>
              <td>${detail.detail}</td>
          </tr>

          <tr>
              <th>딜리버리</th>
              <c:choose>
              <c:when test="${detail.delivery == 1}">
              <td>O</td>
              </c:when>
              <c:otherwise>
               <td>X</td>
              </c:otherwise>
              </c:choose>
          </tr>
          <tr>
              <th>현재 상태</th>
            <td>${finish.fin}</td>
          </tr>
      </table>
        <c:if test="${sessionScope.member.id == 4}">
            <form action="/reservation/fin" method="get">
                <select name="fin" id="fin" class="form-select" onchange="fin1()">
                    <option value="예약대기">예약대기</option>
                    <option value="차량입고">차량입고</option>
                    <option value="작업진행중">작업진행중</option>
                    <option value="작업완료">작업완료</option>
                    <option value="차량인도">차량인도</option>
                </select>
            </form>
        </c:if>
    </div>
</body>
<script>
    const fin1 = () => {
        const fin = document.getElementById("fin").value
      location.href="/reservation/fin?resId=${detail.resId}&fin="+fin
    }
</script>
</html>
