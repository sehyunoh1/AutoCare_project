
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css/">
    <script src="/resources/js/jquery.js"></script>
    <style>
        h2{
            font-size: 50px;
        }
        #memberName,#memberPassword,#memberEmail,#sample3_detailAddress,#sample3_extraAddress{
            width: 410px;
        }
        #memberMobile{
            width:250px;
            margin-left: 10px;
            margin-top: 24px;
        }
        #telecom{
            width:150px;
        }
        #sample3_postcode{
            width:120px;
        }
        #addressSearch{
            width: 150px;
        }
        #sample3_address{
            width: 410px;
        }
        #carModel,#carYear{
            width: 200px;
        }
        #savebutton{
            margin-left: 330px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
 <div class="container m-lg-auto">
     <main>
       <div>
            <h2 class="mb-4 text-center">회원가입</h2>
       </div>
       <div class="row g-5">
         <div class="col-md-7 col-lg-8 ">
             <h4 class="mb-3">회원가입 목록</h4>
             <form action="/member/save" method="post" name="saveform">
                 <div class="row-cols-sm-6 mb-3">
                     <label for="memberEmail" class="form-label">이메일</label>
                     <input type="text" class="form-control" name="memberEmail" id="memberEmail" placeholder="이메일을 입력해주세요." onblur="emailCk()">
                     <span id="emailCk"></span>
                 </div>
                 <div class="col-12 mb-3">
                     <label for="memberPassword">비밀번호</label>
                     <input type="password" class="form-control" name="memberPassword" id="memberPassword" placeholder="8-15자의 영어 소문자,숫자,특수문자로 조합해주세요." onblur="passwordCk()">
                     <span id="passwordck"></span>
                 </div>
                 <div class="col-12 mb-3">
                     <label for="memberName">이름</label>
                     <input type="text" class="form-control" name="memberName" id="memberName" placeholder="이름을 입력해주세요.">
                     <span id="nameCk"></span>
                 </div>
                 <div class="mb-3" >
                   <div class="row">
                       <div class="col-2 mb-3">
                           <label for="telecom">전화번호</label>
                           <select  id="telecom" class="form-select">
                               <option selected>통신사</option>
                               <option>SKT</option>
                               <option>KT</option>
                               <option>LG U+</option>
                               <option>알뜰폰</option>
                           </select>
                       </div>
                       <div class="col">
                           <input type="text" class="form-control" name="memberMobile" id="memberMobile" placeholder="핸드폰 번호를 입력해주세요." onblur="mobileCk()">
                           <span id="mobileck"></span>
                       </div>
                   </div>
                    <div class="row">
                     <div class="col-12 mb-3">
                         <label for="sample3_address">주소</label>
<%--                         <input type="text" class="form-control" name="memberAdress" id="memberAdress" placeholder="주소를 입력해주세요">--%>
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
                   <div class="row mt-3">
                     <div class="col-3 mb-5">
                         <label for="carModel">차종</label>
                         <select name="carModel" id="carModel" class="form-select">
                             <option selected>차종을 선택해주세요</option>
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
                     </div>
                     <div class="col mb-5">
                         <label for="carYear">연식</label>
                         <select name="carYear" id="carYear" class="form-select">
                             <option selected>연식을 선택해주세요.</option>
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
                         </select>
                     </div>
                   </div>
                     <div>
                         <input type="button" id="savebutton" class="btn btn-success" onclick="save()" value="회원가입">
                     </div>
                 </div>
                    </div>
                    </div>

             </form>
         </div>
       </div>
     </main>
 </div>
</body>
<script>
    const save = () => {
        if(document.getElementById("memberEmail").value ==""){
            emailCk.innerHTML="필수 입력사항입니다."
            emailCk.style.color="red";
        }else if(document.getElementById("memberPassword").value ==""){
            passwordCk.innerHTML="필수 입력사항입니다."
            passwordCk.style.color="red";
        }else if(document.getElementById("memberName").value ==""){
            nameCk.innerHTML="필수 입력사항입니다."
            nameCk.style.color="red";
        }else {
            document.saveform.submit();
            alert("회원가입이 완료되었습니다.")
        }
        }
    const emailCk =() =>{
        memberEmail =document.getElementById("memberEmail").value;
        emaildb = document.getElementById("emailCk");
       $.ajax({
            type:"post",
            url:"/member/duplicate",
            data:{memberEmail,memberEmail},
            dataType:"text",
           success: function (result){
             if(result == "ok"){
                 emaildb.innerHTML="사용가능한 이메일입니다."
                 emaildb.style.color="green"
             }else if(result == "no"){
                 emaildb.innerHTML="이미 사용중인 이메일입니다."
                 emaildb.style.color="red"
             }
           }
       })
    }
    const passwordCk = () => {
     const memberPass = document.getElementById("memberPassword").value;
     const exp =/^(?=.*[a-z])(?=.*\d)(?=.*[!@#$])[A-Z a-z \d !@#$]{8,15}$/;
     if(memberPass.match (exp)){
         passwordck.innerHTML = "사용가능한 비밀번호입니다."
         passwordck.style.color="green"
     }else{
         passwordck.innerHTML="영어 소문자,숫자,특수문자(!@#$)를 포함한 8-15자인지 확인해주세요."
         passwordck.style.color = "red"
     }
    }
    const mobileCk = () => {
        const memberMobile = document.getElementById("memberMobile").value;
        const exp =/^\d{3}-\d{4}-\d{4}$/;
        if(memberMobile .match(exp)){
            mobileck.innerHTML="사용가능한 전화번호입니다."
            mobileck.style.color = "green"
        }else{
            mobileck.innerHTML="전화번호 형식이 맞는지 확인해주세요."
            mobileck.style.color = "red"
        }
    }
</script>
</html>
