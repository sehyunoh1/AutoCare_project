
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>로그인</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/sign-in/">




    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
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
        #memberEmail,#memberPassword{
            width:335px;
        }
        #member{
            margin-left: 480px;
            margin-bottom: 20px;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
</head>


<body class="text-center">
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
<main class="form-signin w-100 m-auto">
    <form action="/member/login" method="post" name="login">
        <h1 class="h3 mb-3 mt-3 fw-normal">LOGIN</h1>
       <div id="member">
        <div class="form-floating">
            <input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="name@example.com">
            <label for="memberEmail">Email address</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="Password">
            <label for="memberPassword">Password</label>
        </div>
       </div>
        <input type="button" class="w-24 btn btn-lg btn-primary" onclick="submit()" value="Sign in">
    </form>
</main>
</div>
</body>
<script>
   const submit = () => {
      for (let i=0 ; i<${member.size()} ; i++ ) {
          if (document.getElementById("memberEmail").value == "" || document.getElementById("memberPassword").value == "") {
              alert("이메일 및 비밀번호를 확인해주세요.")
          } else if (document.getElementById("memberEmail").value != ${member.get(i).memberEmail} || document.getElementById("memberPassword").value != ${member.get(i).memberPassword}) {
              alert("이메일 및 비밀번호를 확인해주세요.");
          } else {
              document.login.submit();
          }
      }
   }

</script>
</html>
