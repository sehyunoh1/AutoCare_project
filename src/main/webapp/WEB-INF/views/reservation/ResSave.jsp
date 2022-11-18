
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>예약</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
  <script src="/resources/js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class="container">
  <h2>서비스 네트워크 예약</h2>
  <h4>온라인 예약으로 고객님이 원하는 장소와 시간에 차량관리를 받을수 있습니다.</h4>
  <form action="/reservation/save" method="post" name="saveform">
    <div id="CC">

        <input type="hidden" name="memberId" value="${sessionScope.member.id}">
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="category" id="inlineRadio1" value="경정비" onchange="ab()">
        <label class="form-check-label" for="inlineRadio1">경정비</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="category" id="inlineRadio2" value="진단/소음"onchange="ab()">
        <label class="form-check-label" for="inlineRadio2">진단/소음</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="category" id="inlineRadio3" value="사고수리"onchange="ab()">
        <label class="form-check-label" for="inlineRadio3">사고수리</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="category" id="inlineRadio4" value="리콜"onchange="ab()">
        <label class="form-check-label" for="inlineRadio3">리콜</label>
      </div>
      <div>
        <div id="sub1" class="mt-5 "  >
        <select class="form-select" name="subcategory" id="subcategory1" onchange="qw()" disabled >
          <option selected>세부항목을 선택해주세요.</option>
          <option value="엔진오일/필터류 교환" >엔진오일/필터류 교환</option>
          <option value="브레이크 패드/디스크 점검/교환" >브레이크 패드/디스크 점검/교환</option>
          <option value="타이어 위치변경/교환" >타이어 위치변경/교환</option>
          <option value="차량 기본 점검" >차량 기본 점검</option>
        </select>
      </div>
      <div id="sub2" class="mt-5 "  >
        <select class="form-select" name="subcategory" id="subcategory2" onchange="qw()" disabled >
          <option selected>세부항목을 선택해주세요.</option>
          <option value="경고등 점등">경고등 점등</option>
        <option value="차량 이상 증상">차량 이상 증상</option>
        <option value="이상 소음">이상 소음</option>
        </select>
      </div>
      <div id="sub3" class="mt-5 " >
        <select class="form-select"  name="subcategory" id="subcategory3" onchange="qw()" disabled>
          <option selected>세부항목을 선택해주세요.</option>
          <option value="사고 수리(보험)">사고 수리(보험)</option>
           <option value="일반 외관 수리">일반 외관 수리</option>
           <option value="썬팅/블랙박스">썬팅/블랙박스</option>
          <option value="외관 튜닝">외관 튜닝</option>
        </select>
      </div>
      <div id="sub4" class="mt-5" >
        <select class="form-select" name="subcategory" id="subcategory4" onchange="qw()" disabled >
          <option selected>세부항목을 선택해주세요.</option>
          <option value="리콜">리콜</option>
          <option value="캠페인">캠페인</option>
          </select>
      </div>
      </div>
        <div id="detaildiv" class="mt-5">
          <textarea name="detail" class="form-control" id="detail" cols="" rows="10" placeholder="100자이내로 세부사항을 적어주세요" onchange="detail1()" disabled  >
          </textarea>
        </div>
        <div id="centerdiv" class="mt-5">
          <select class="form-select" id="serviceCenter" name="serviceCenter" onchange="center()" placeholder="서비스센터를 선택해주세요" disabled>
            <option selected>서비스센터를 선택해주세요.</option>
            <option value="강남서비스센터">강남서비스센터</option>
            <option value="용산서비스센터">용산서비스센터</option>
            <option value="송도서비스센터">송도서비스센터</option>
            <option value="수원서비스센터">수원서비스센터</option>
            <option value="대전서비스센터">대전서비스센터</option>
            <option value="울산서비스센터">울산서비스센터</option>
            <option value="대구서비스센터">대구서비스센터</option>
            <option value="부산서비스센터">부산서비스센터</option>
            </select>
        </div>
            <div class="mt-5">
              <input  class="datepicker form-control" placeholder="날짜를 선택해주세요." id="datepicker" name="serviceDate" onchange="date()" >
              <script>
              </script>
            </div>
        <div id="deliverydiv" class="mt-5">
          <div>
            <span>딜리버리 서비스(탁송)</span>
          </div>
          <input class="form-check-input" type="radio" name="delivery" id="delivery1" value="yes" onchange="tn()" disabled>
          <label class="form-check-label" for="delivery1">O</label>
          <input class="form-check-input" type="radio" name="delivery" id="delivery2" value="no" onchange="tn()"disabled>
          <label class="form-check-label" for="delivery2">X</label>
        </div>
      <div class="mt-4" id="sas">
        <input type="button"  class="btn btn-secondary" value="예약하기" onclick="saveRes()" >
      </div>
    </div>
  </form>
</div>
</body>
<script>
  const ab = () => {
    if($('input:radio[id=inlineRadio1]').is(':checked')){
      $('#sub1').show();
      $('#subcategory1').attr('disabled', false);
      $('#sub2').hide();
      $('#sub3').hide();
      $('#sub4').hide();
      $('#detaildiv').hide();
      $('#centerdiv').hide();
      $('#submit').hide();
      $('#deliverydiv').hide();
      $('#sas').hide();
      $('#datepicker').hide();

    }else if($('input:radio[id=inlineRadio2]').is(':checked')){
      $('#sub1').hide();
      $('#subcategory2').attr('disabled', false);
      $('#sub2').show();
      $('#sub3').hide();
      $('#sub4').hide();
      $('#detaildiv').hide();
      $('#centerdiv').hide();
      $('#submit').hide();
      $('#deliverydiv').hide();
      $('#sas').hide();
      $('#datepicker').hide();
    }else if($('input:radio[id=inlineRadio3]').is(':checked')){
      $('#sub1').hide();
      $('#subcategory3').attr('disabled', false);
      $('#sub2').hide();
      $('#sub3').show();
      $('#sub4').hide();
      $('#detaildiv').hide();
      $('#centerdiv').hide();
      $('#submit').hide();
      $('#deliverydiv').hide();
      $('#sas').hide();
      $('#datepicker').hide();
    }else if($('input:radio[id=inlineRadio4]').is(':checked')){
      $('#sub1').hide();
      $('#subcategory4').attr('disabled', false);
      $('#sub2').hide();
      $('#sub3').hide();
      $('#sub4').show();
      $('#detaildiv').hide();
      $('#centerdiv').hide();
      $('#submit').hide();
      $('#deliverydiv').hide();
      $('#sas').hide();
      $('#datepicker').hide();
    }
  }

  const qw = () => {
    $('#detaildiv').show();
    $('#detail').attr('disabled', false);
    console.log(document.getElementById("detail").value)
  }
  const detail1 = () => {
    $('#centerdiv').show();
    $('#serviceCenter').attr('disabled', false);
    console.log(document.getElementById("serviceCenter").value)
  }
  const center = () => {
    $('#datepicker').show();

  }
const tn = () => {

    $('#sas').show();
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
  $('#deliverydiv').show();
  $('#delivery1').attr('disabled', false);
  $('#delivery2').attr('disabled', false);
}

  const saveRes = () => {
    document.saveform.submit();
  }

</script>
</html>

