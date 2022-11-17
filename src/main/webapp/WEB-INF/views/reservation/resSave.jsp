
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
      <form action="/reservation/save" method="post" name="resform">
         <div id="CC">
             <div id="serviceDate" name="serviceDate" class="mt-5">
                 <input class="datepicker form-control" placeholder="날짜를 선택해주세요.">
                 <div id="date1">
                     <script>
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
                         })
                         // $(function () {
                         //     $('.datepicker').datepicker();
                         // });
                         $( function() {
                             $( ".datepicker" ).datepicker({
                                 onSelect: function() {
                                     var date = $.datepicker.formatDate("yy-mm-dd",$(".datepicker").datepicker("getDate"));
                                     document.getElementById("serviceDate").value=date;
                                     console.log( document.getElementById("serviceDate").value)
                                 }
                             });
                         });

                     </script>
                 </div>
             </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="category" id="inlineRadio1" value="경정비" onclick="ab()">
              <label class="form-check-label" for="inlineRadio1">경정비</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="category" id="inlineRadio2" value="진단/소음"onclick="ac()">
              <label class="form-check-label" for="inlineRadio2">진단/소음</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="category" id="inlineRadio3" value="사고수리"onclick="asasd()">
              <label class="form-check-label" for="inlineRadio3">사고수리</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="category" id="inlineRadio4" value="리콜"onclick="asasdasd()">
              <label class="form-check-label" for="inlineRadio3">리콜</label>
          </div>
         </div>
          <div name="subcategory" id="subcategory" class="mt-5">
        </div>
          <div id="detail" name="detail" class="mt-5">
          </div>
          <div id="serviceCenter" name="serviceCenter" class="mt-5">

          </div>

          <div class="mt-4">
              <input type="button" class="btn btn-secondary" value="예약하기" onclick="save()">
          </div>

      </form>
    </div>
</body>
<script>
    const ab = () => {
      let input = "<select class='form-select'  id='Subcategory' onchange='qw()'>"
          input += "<option value='엔진오일/필터류 교환' id='1'>엔진오일/필터류 교환</option>"
          input += "<option value='브레이크 패드/디스크 점검/교환' id='2'>브레이크 패드/디스크 점검/교환</option> "
          input += "<option value='타이어 위치변경/교환' id='3'>타이어 위치변경/교환</option> "
          input += "<option value='차량 기본 점검' id='4'>차량 기본 점검</option>"
          input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
    const ac = () => {
        let input = "<select class='form-select'  id='Subcategory' onchange='qw()'>"
        input += "<option value='경고등 점등'>경고등 점등</option>"
        input += "<option value='차량 이상 증상'>차량 이상 증상</option> "
        input += "<option value='이상 소음'>이상 소음</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
    const asasd = () => {
        let input = "<select class='form-select'  id='Subcategory' onchange='qw()'>"
        input += "<option value='사고 수리(보험)'>사고 수리(보험)</option>"
        input += "<option value='일반 외관 수리'>일반 외관 수리</option> "
        input += "<option value='썬팅/블랙박스'>썬팅/블랙박스</option>"
        input += "<option value='외관 튜닝'>외관 튜닝</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
    const asasdasd = () => {
        let input = "<select class='form-select'  id='Subcategory' onchange='qw()'>"
        input += "<option value='리콜'>리콜</option>"
        input += "<option value='캠페인'>캠페인</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }

    const qw = () => {
        const subvalue=document.getElementById("Subcategory").value
        const value = document.getElementById("subcategory")
        value.value = subvalue;
        console.log(value.value);

        let detailarea = "<textarea  id=detailarea class='form-control' placeholder='100자 이내로 기입해주세요.' cols='30' row='100' onchange='detail()'>"
        detailarea += "</textarea>"
        document.getElementById("detail").innerHTML = detailarea;
            // console.log(document.getElementById("detailarea").value);
    }
    const detail = () => {
      const detailCk = document.getElementById("detailarea").value;
      const detail = document.getElementById("detail")
        detail.value = detailCk;
      console.log(detail.value)

        let servicecenter1 = "<select class=form-select id='servicecenter' onchange=center() placeholder='서비스센터를 선택해주세요'>"
        servicecenter1 += "<option value=강남서비스센터>강남서비스센터</option>"
        servicecenter1 += "<option value=용산서비스센터>용산서비스센터</option>"
        servicecenter1 += "<option value=송도서비스센터>송도서비스센터</option>"
        servicecenter1 += "<option value=수원서비스센터>수원서비스센터</option>"
        servicecenter1 += "<option value=대전서비스센터>대전서비스센터</option>"
        servicecenter1 += "<option value=대전서비스센터>울산서비스센터</option>"
        servicecenter1 += "<option value=대전서비스센터>대구서비스센터</option>"
        servicecenter1 += "<option value=대전서비스센터>부산서비스센터</option>"
        servicecenter1 +="</select>"
        document.getElementById("serviceCenter").innerHTML=servicecenter1
    }
    const center = () => {
      const servicecenterCK = document.getElementById("servicecenter").value;
      const servicecenter = document.getElementById("serviceCenter")
        servicecenter.value=servicecenterCK;
        console.log(servicecenter.value)

    }

const save = () => {
  document.getElementById("resform").submit();
}

</script>
</html>
