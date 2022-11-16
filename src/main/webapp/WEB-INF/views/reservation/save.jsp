
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예약</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<header class="mb-auto">
    <div>
        <h3 class="float-md-start mb-0">Auto care Service</h3>
        <nav class="nav nav-masthead justify-content-center float-md-end">
            <a class="nav-link fw-bold py-1 px-0 active" aria-current="page" href="#">Home</a>
            <a class="nav-link fw-bold py-1 px-0" href="#">Features</a>
            <a class="nav-link fw-bold py-1 px-0" href="#">Contact</a>
        </nav>
    </div>
</header>
    <div class="container">
        <h2>서비스 네트워크 예약</h2>
        <h4>온라인 예약으로 고객님이 원하는 장소와 시간에 차량관리를 받을수 있습니다.</h4>
      <form action="/reservation/save" method="post" name="resform">
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="category" id="inlineRadio1" value="경정비" onclick="ab(value)">
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
        <div id="subcategory">

        </div>
      </form>
    </div>
</body>
<script>
    const ab = (click) => {
      console.log(click)
      let input = "<select class='form-select' name='subcategory'>"
          input += "<option value='엔진오일/필터류 교환'>엔진오일/필터류 교환</option>"
          input += "<option value='브레이크 패드/디스크 점검/교환'>브레이크 패드/디스크 점검/교환</option> "
          input += "<option value='타이어 위치변경/교환'>타이어 위치변경/교환</option> "
          input += "<option value='차량 기본 점검'>차량 기본 점검</option>"
          input += "</select>"
        document.getElementById("subcategory").innerHTML = input;


    }
    const ac = () => {
        let input = "<select class='form-select' name='subcategory'>"
        input += "<option value='경고등 점등'>경고등 점등</option>"
        input += "<option value='차량 이상 증상'>차량 이상 증상</option> "
        input += "<option value='이상 소음'>이상 소음</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
    const asasd = () => {
        let input = "<select class='form-select' name='subcategory'>"
        input += "<option value='사고 수리(보험)'>사고 수리(보험)</option>"
        input += "<option value='일반 외관 수리'>일반 외관 수리</option> "
        input += "<option value='썬팅/블랙박스'>썬팅/블랙박스</option>"
        input += "<option value='외관 튜닝'>외관 튜닝</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
    const asasdasd = () => {
        let input = "<select class='form-select' name='subcategory'>"
        input += "<option value='리콜'>리콜</option>"
        input += "<option value='캠페인'>캠페인</option>"
        input += "</select>"
        document.getElementById("subcategory").innerHTML = input;
    }
</script>
</html>
