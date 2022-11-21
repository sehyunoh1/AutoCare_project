<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" class="h-100"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Auto Care Service</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/cover/">





    <link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">
</head>
<body class="d-flex h-100 text-center text-bg-dark">

<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
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
    <main class="px-3">
       <c:choose>
        <c:when test="${sessionScope.member.memberEmail != null}">
            <h1>${sessionScope.member.memberName}님 반갑습니다.</h1>
<%--            <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>--%>
            <p class="lead">
                <a href="/member/member?id="+${sessionScope.member.id} class="btn btn-lg btn-secondary fw-bold border-white ">마이페이지</a>
                <a href="/reservation/save" class="btn btn-lg btn-secondary fw-bold border-white ">정비 예약</a>
            </p>
         <c:if test="${sessionScope.member.id == 4}">
             <h1>Admin Page</h1>
             <%--            <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>--%>
             <p class="lead">
                 <a href="/admin/member" class="btn btn-lg btn-secondary fw-bold border-white ">회원 목록</a>
                 <a href="/admin/reservation" class="btn btn-lg btn-secondary fw-bold border-white ">전체 예약리스트</a>
             </p>
         </c:if>
        </c:when>
        <c:otherwise>
        <h1>빠르게 예약해보세요.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
            <a href="/member/save" class="btn btn-lg btn-secondary fw-bold border-white ">회원 가입</a>
            <a href="/member/login" class="btn btn-lg btn-secondary fw-bold border-white ">로그인</a>
        </p>
        </c:otherwise>
       </c:choose>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
    </footer>
</div>





</body>
</html>