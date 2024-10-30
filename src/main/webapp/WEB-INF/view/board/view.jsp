<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>#[[$Title$]]#</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9">

            <h2 class="my-3">${board.id}번 게시물</h2>

            <%--            bootstrap 사용--%>
                <div class="mb-3">
                    <label for="" class="form-label">
                        제목
                    </label>
                    <input class="form-control" name="title" type="text" value="${board.title}" readonly>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        본문
                    </label>
                    <textarea class="form-control" name="content" id="" rows="10">${board.content}</textarea>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        작성자
                    </label>
                    <input class="form-control" name="writer" type="text" value="${board.writer}" readonly>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        작성일시
                    </label>
                    <input name="inserted" type="text" class="form-control" value="${board.inserted}" readonly>
                </div>

                <%--삭제, 수정 버튼들이 블록머시기라 버튼 좌우로 정렬이 안 돼서  form 밖으로 꺼냄 --%>
                <%-- 버튼이 form 밖에 있어서 form/ id 로 묶어줌  --%>
                <button form="deleteForm1" class="btn btn-outline-danger">
                    <i class="fa-regular fa-trash-can"></i>
                    삭제
                </button>
                <a class="btn btn-outline-primary" href="/board/edit?id=${board.id}">
                    <i class="fa-regular fa-pen-to-square"></i>
                    수정
                </a>
                <form id="deleteForm1" class="d-none" action="/board/delete" method="post">
                    <input type="hidden" name="id" value="${board.id}">
                </form>

        </div>
    </div>
</div>

<%--readonly 는 수정될 수 없다는 뜻--%>
<%--기존 view--%>
<%--<div>--%>
<%--    제목<input type="text" value="${board.title}" readonly>--%>
<%--</div>--%>
<%--<div>--%>
<%--    본문--%>
<%--    <textarea name="" id="" cols="30" rows="10" readonly>${board.content}</textarea>--%>
<%--</div>--%>
<%--<div>--%>
<%--    작성자--%>
<%--    <input type="text" value="${board.writer}" readonly>--%>
<%--</div>--%>
<%--<div>--%>
<%--    작성일시--%>
<%--    <input type="text" value="${board.inserted}" readonly>--%>
<%--</div>--%>

<%--<div>--%>
<%--    <form action="/board/delete" method="post">--%>
<%--        <input type="hidden" name="id" value="${board.id}">--%>
<%--        <button>삭제</button>--%>
<%--    </form>--%>
<%--</div>--%>
<%--이동해야하니까 a태그사용--%>
<%--<a href="/board/edit?id=${board.id}">수정</a>--%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>