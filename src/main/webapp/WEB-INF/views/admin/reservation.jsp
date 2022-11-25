<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>전체 예약 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
    <script src="/resources/js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table table-hover" id="list">
        <tr>
          <th>예약번호</th>
          <th>예약자명</th>
          <th>전화번호</th>
          <th>차량</th>
          <th>연식</th>
          <th>차량번호</th>
          <th>예약날짜</th>
          <th>카테고리</th>
          <th>세부</th>
          <th>딜리버리</th>
          <th>작업현황</th>
        </tr>
        <c:forEach items="${resList}" var="resList">
            <tr>
                <td id="resId">${resList.resId}</td>
                <td>${resList.memberName}</td>
                <td>${resList.memberMobile}</td>
                <td>${resList.carModel}</td>
                <td>${resList.carYear}</td>
                <td>${resList.carNumber}</td>
                <td id="date">${resList.serviceDate}</td>
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
                    <a class="page-link" href="/admin/reservation/?page=${paging.page-1}">[이전]</a>
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
                        <a href="/admin/reservation/?page=${i}" class="page-link">${i}</a>
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
                    <a class="page-link" href="/admin/reservation/?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
    <button type="button" class="datepicker btn btn-secondary" id="datepicker" name="serviceDate" onclick="date()">
<%--        <input type="button" class="datepicker btn btn-secondary" id="datepicker" name="serviceDate" onclick="date()">--%>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-date" viewBox="0 0 16 16">
            <path d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z"></path>
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
        </svg>
    </button>
</div>
</body>
<script>
const today = () => {
    const date = document.getElementById("date").value;
    const resID = document.getElementById("resId").value;
  $.ajax({
      type:"get",
      url:"/admin/today",
      data:{
          serviceDate:date ,
          resId : resId
      },
      dataType:"json",
      success:function (dateList){
        $("#list").hide()
          let output = "<table class=table><tr>"
          output += "<th>예약번호</th>";
          output += "<th>예약자명</th>";
          output += "<th>전화번호</th>";
          output += "<th>차량</th>";
          output += "<th>연식</th>";
          output += "<th>차량번호</th>";
          output += "<th>예약날짜</th>";
          output += "<th>카테고리</th>";
          output += "<th>세부내용</th>";
          output += "<th>딜리버리</th>";
          output += "<th>작업현황</th></tr>";

          for(let i in dateList){
              output +="<tr>"
              output += "<td><a href='/reservation/reservation?resId="+dateList[i].resId+"'>"+ dateList[i].resId+"</a></td>"
              output += "<td>"+ dateList[i].memberName+"</td>"
              output += "<td>"+ dateList[i].memberMobile+"</td>"
              output += "<td>"+ dateList[i].carModel+"</td>"
              output += "<td>"+ dateList[i].carYear+"</td>"
              output += "<td>"+ dateList[i].carNumber+"</td>"
              output += "<td>"+ dateList[i].serviceDate+"</td>"
              output += "<td>"+ dateList[i].category+"</td>"
              output += "<td>"+ dateList[i].detail+"</td>"
              output += "<td>"+ dateList[i].delivery+"</td>"
              output += "<td>"+ dateList[i].fin+"</td>"
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
const date = () => {
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    $( function() {
        $( '#datepicker' ).datepicker({
            onSelect: function() {
                var date = $.datepicker.formatDate('yy-mm-dd',$('#datepicker').datepicker('getDate'));
                document.getElementById('datepicker').value = date
                console.log(document.getElementById('datepicker').value)
            }
        });
    });
}
</script>
</html>
