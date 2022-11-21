
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css/">
  <script src="/resources/js/jquery.js"></script>
</head>
<style>
  #memberName,#memberEmail,#sample3_address,#memberMobile,#carModel,#carYear,#carNumber{
    width: 300px;
  }
  #sample3_postcode,#sample3_extraAddress,#addressSearch,#telecom,#sample3_detailAddress{
    width:250px
  }
</style>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="update">
  <h2>회원정보 수정</h2>
    <div id="member" class="mt-3">
      <form action="/member/update" method="post" name="updateform">
      <table class="table table-hover">
        <input type="hidden" name="id" value="${sessionScope.member.id}">
        <tr>
          <th>이름</th>
          <td><input type="text" class="form-control" name="memberName" id="memberName" value="${sessionScope.member.memberName}"></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" class="form-control" name="memberEmail" id="memberEmail" value="${sessionScope.member.memberEmail}" readonly></td>
        </tr>
        <tr>
        <th>전화번호</th>
        <td>
          <label for="telecom">전화번호</label>
          <select  id="telecom" class="form-select">
            <option selected>통신사</option>
            <option>SKT</option>
            <option>KT</option>
            <option>LG U+</option>
            <option>알뜰폰</option>
          </select>
          <input type="text" class="form-control" name="memberMobile" id="memberMobile" placeholder="핸드폰 번호를 입력해주세요." onblur="mobileCk()">
          <span id="mobileck"></span>
        </td>
        </tr>
        <tr>
        <th>주소</th>
        <td>
          <div class="row">
            <div class="col-12 mb-3">
              <label for="sample3_address">주소</label>
              <input type="text" id="sample3_postcode" placeholder="우편번호" class="form-control"><div class="col">
              <input type="button" id="addressSearch" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" class="form-select"><br>
              <input type="text" name =memberAdress id="sample3_address" class="form-control" placeholder="주소"><br>
              <input type="text" id="sample3_detailAddress" placeholder="상세주소" class="form-control">
              <input type="text" id="sample3_extraAddress" placeholder="참고항목" class="form-control">

              <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
              </div>
              <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
              <script>
                // 우편번호 찾기 찾기 화면을 넣을 element
                var element_wrap = document.getElementById('wrap');

                function foldDaumPostcode() {
                  // iframe을 넣은 element를 안보이게 한다.
                  element_wrap.style.display = 'none';
                }
                function sample3_execDaumPostcode() {
                  // 현재 scroll 위치를 저장해놓는다.
                  var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                  new daum.Postcode({
                    oncomplete: function(data) {
                      // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var addr = ''; // 주소 변수
                      var extraAddr = ''; // 참고항목 변수

                      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                      }

                      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                      if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample3_extraAddress").value = extraAddr;

                      } else {
                        document.getElementById("sample3_extraAddress").value = '';
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('sample3_postcode').value = data.zonecode;
                      document.getElementById("sample3_address").value = addr;
                      // 커서를 상세주소 필드로 이동한다.
                      document.getElementById("sample3_detailAddress").focus();

                      // iframe을 넣은 element를 안보이게 한다.
                      // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                      element_wrap.style.display = 'none';

                      // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                      document.body.scrollTop = currentScroll;
                    },
                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                    onresize : function(size) {
                      element_wrap.style.height = size.height+'px';
                    },
                    width : '100%',
                    height : '100%'
                  }).embed(element_wrap);

                  // iframe을 넣은 element를 보이게 한다.
                  element_wrap.style.display = 'block';
                }
              </script>
            </div>
          </div>
          </div>
        </td>
        </tr>
      <tr>
        <th>차종</th>
        <td>
              <label for="carModel">차종</label>
              <select name="carModel" id="carModel" class="form-select">
                <option selected>${sessionScope.member.carModel}</option>
                <option value="모닝">모닝</option>
                <option value="레이">레이</option>
                <option value="쏘나타">쏘나타</option>
                <option value="아반떼">아반떼</option>
                <option value="그랜저">그랜저</option>
                <option value="K3">K3</option>
                <option value="K5">K5</option>
                <option value="K7">K7</option>
                <option value="카니발">카니발</option>
                <option value="G70">G70</option>
                <option value="G80">G80</option>
                <option value="GV70">GV70</option>
                <option value="GV80">GV80</option>
              </select>
        </td>
      </tr>
        <tr>
          <th>연식</th>
          <td>
            <label for="carYear">연식</label>
            <select name="carYear" id="carYear" class="form-select">
              <option selected>${sessionScope.member.carYear}</option>
              <option value="2022">2022</option>
              <option value="2021">2021</option>
              <option value="2020">2020</option>
              <option value="2019">2019</option>
              <option value="2018">2018</option>
              <option value="2017">2017</option>
              <option value="2016">2016</option>
              <option value="2015">2015</option>
              <option value="2014">2014</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
            </select></td>
        </tr>
        <tr>
          <th>차량 번호</th>
          <td>
            <input type="text" class="form-control" name="carNumber" id="carNumber" value="${sessionScope.member.carNumber}">
          </td>
        </tr>
      </table>
        <div class="mt-4">
        <input type="button" class="btn btn-primary" onclick="update()" value="회원정보 수정">
        </div>
      </form>
    </div>
</div>
</body>
<script>
  const update = () => {
      document.updateform.submit();
  }
</script>
</html>
