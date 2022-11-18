
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <title>${sessionScope.member.memberName}님 마이페이지</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css/">
  <script src="/resources/js/jquery.js"></script>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
  <div class="container mt-4">
    <div id="member">
      <table class="table table-hover">
          <tr>
            <th>이름</th>
            <td>${member.memberName}</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>${member.memberEmail}</td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td>${member.memberMobile}</td>
          </tr>
          <tr>
            <th>차량모델</th>
            <td>${member.carModel}</td>
          </tr>
          <tr>
            <th>차량연식</th>
            <td>${member.carYear}</td>
          </tr>
          <tr>
              <th>차량 번호</th>
              <td>${member.carNumber}</td>
            </tr>
      </table>
    </div>
      <div class="mt-5" id="button">
          <a href="/member/list" class="btn btn-secondary">예약내역 확인</a>
          <a href="/member/update" class="btn btn-primary">회원정보 수정</a>
          <a href="/member/delete" class="btn btn-danger">회원탈퇴</a>
      </div>
  </div>

</body>
</html>
