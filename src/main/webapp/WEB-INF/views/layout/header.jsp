<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>헤더</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
        #res,#res1{
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="px-3 py-2 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>
            <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                <li>
                    <a href="/" class="nav-link text-secondary">
                        <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#home"/></svg>
                        Home
                    </a>
                </li>
                <li>
                 <c:choose>
                   <c:when test="${sessionScope.member.memberEmail != null}">
                      <c:choose>
                       <c:when test="${result >= 1}">
                           <button type="button" class="btn btn-secondary position-relative" id="res1" onclick="list()">
                               예약 내역
                               <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                            <span class="visually-hidden">New alerts</span>
                              </span>
                           </button>
                       </c:when>
                       <c:otherwise>
                           <button type="button" class="btn btn-secondary position-relative" id="res" onclick="list()">
                           예약 내역
                           </button>
                       <c:if test="${sessionScope.member.id == 4}">
                           <button type="button" class="btn btn-secondary position-relative" id="res_admin" onclick="adminlist()">
                               전체 예약 리스트
                           </button>
                       </c:if>
                       </c:otherwise>
                      </c:choose>
                   </c:when>
                   <c:otherwise>
                       <a href="/member/save" class="nav-link text-white">
                           <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"/></svg>
                           회원가입
                       </a>
                   </c:otherwise>
                 </c:choose>
                </li>
                <li>
                   <c:choose>
                    <c:when test="${sessionScope.member.memberEmail != null}">
                        <a href="/logout" class="nav-link text-white">
                            <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"/></svg>
                            로그아웃
                        </a>
                    </c:when>
                   </c:choose>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
<script>
    const list = () => {
      location.href="/member/list?id="+${sessionScope.member.id};
    }
    const adminlist = () => {
        $("res").hide();
        location.href="/admin/reservation";
    }
</script>
</html>
