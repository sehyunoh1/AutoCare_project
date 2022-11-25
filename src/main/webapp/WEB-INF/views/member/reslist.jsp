<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css/">
<script src="/resources/js/jquery.js"></script>
<html>
<head>
    <title>${sessionScope.member.memberName}님 예약 조회</title>
    <style>
        #fin{
            width: 150px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <button class="btn btn-secondary mt-5" onclick="desc()">날짜순↓</button>
    <button class="btn btn-secondary mt-5" onclick="asc()">날짜순↑</button>
  <table class="table table-hover" id="list">
    <tr>
      <th>예약 번호</th>
      <th>예약자명</th>
      <th>전화번호</th>
      <th>예약 차량모델</th>
      <th>예약 차량연식</th>
      <th>예약 차량번호</th>
      <th>카테고리</th>
      <th>예약 날짜</th>
        <th>진행현황</th>
    </tr>
   <div >
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
        <td>${list.fin}</td>
    </tr>
   </c:forEach>
   </div>
  </table>
    <form action="/reservation/sort">
        <select name="fin" id="fin" onchange="sort()" class="form-select">
            <option value="예약대기">예약대기</option>
            <option value="차량입고">차량입고</option>
            <option value="작업진행중">작업진행중</option>
            <option value="작업완료">작업완료</option>
            <option value="차량인도">차량인도</option>
        </select>
    </form>
</div>
</body>
<script>
    const desc = () => {
    location.href="/member/list/desc?id="+${sessionScope.member.id}
    }
    const asc = () => {
        location.href="/member/list?id="+${sessionScope.member.id}
    }
    const sort = () => {
      const finvalue = document.getElementById("fin").value;
      const memberId=${sessionScope.member.id};
      $.ajax({
          type:"get",
          url:"/reservation/sort",
          data:{fin : finvalue,
                id : memberId
          },
          dataType: "json",
          success: function(finList){
              $("#list").hide;
              let output = "<table class=table><tr>"
              output += "<th>예약번호</th>";
              output += "<th>이름</th>";
              output += "<th>전화번호</th>";
              output += "<th>차량모델</th>";
              output += "<th>연식</th>";
              output += "<th>차량번호</th>";
              output += "<th>카테고리</th>";
              output += "<th>예약날짜</th>";
              output += "<th>진행상태</th></tr>";

              for(let i in finList){
                  output ="<tr>"
                output += "<td><a href='/reservation/reservation?resId="+finList[i].resId+"'>"+ finList[i].resId+"</a></td>"
                output += "<td>"+ finList[i].memberName+"</td>"
                output += "<td>"+ finList[i].memberMobile+"</td>"
                output += "<td>"+ finList[i].carModel+"</td>"
                output += "<td>"+ finList[i].carYear+"</td>"
                output += "<td>"+ finList[i].carNumber+"</td>"
                output += "<td>"+ finList[i].category+"</td>"
                output += "<td>"+ finList[i].serviceDate+"</td>"
                output += "<td>"+ finList[i].fin+"</td>"
                output += "</tr>"
              }
              output += "</table>";
              document.getElementById('list').innerHTML=output;
          },
          error:function (){
              console.log("실패")
          }
      })
    }

</script>
</html>
