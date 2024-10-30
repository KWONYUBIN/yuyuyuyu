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

<c:import url="/WEB-INF/fragment/navbar.jsp">
    <c:param name="active" value="list"/>  <%--active 파라미터가 list에 붙어서 나옴--%>
</c:import>

<%--div.container>div.row>div.col--%>
<div class="container">
    <div class="row">
        <div class="col">

            <h2 class="my-3 ">게시물 목록</h2>
            <table class="table"> <%-- bootstrap에 table형식을 적용함 (class="table") --%>
                <thead>
                <tr>
                    <td>
                        <%--                        넘버--%>
                        <i class="fa-solid fa-hashtag"></i>
                    </td>
                    <%--                    w-50 = with-50 (너비가 50%라는 뜻)     --%>
                    <td class="w-50">제목</td>
                    <td>
                        <%--                        작성자--%>
                        <i class="fa-solid fa-user"></i>
                    </td>
                    <%-- d-none = display-none -> 안 보이게 하는 거 --%>
                    <%-- d-lg-table-cell -> large에서는 보이게 --%>
                    <%-- large보다 작을 때는 작성일시 숨기기--%>
                    <td class="d-none d-lg-table-cell">
                        <%--                        작성일시--%>
                        <i class="fa-solid fa-calendar-days"></i>
                    </td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <td>
                                <%--${board.title}을 누르면 /board/view?id=${board.id}로 간다는 뜻 --%>
                            <a href="/board/view?id=${board.id}">
                                    ${board.title}
                            </a>
                        </td>
                        <td>${board.writer}</td>
                            <%-- d-none = display-none -> 안 보이게 하는 거 --%>
                            <%-- d-lg-table-cell -> large에서는 보이게 --%>
                            <%-- large보다 작을 때는 작성일시 숨기기--%>
                        <td class="d-none d-lg-table-cell">${board.inserted}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- bootstrap pagination --%>
<nav class="mt-4">
    <ul class="pagination justify-content-center">
        <%-- 이전버튼--%>
        <c:if test="${pageInfo.hasPrevPage}">
            <li class="page-item ">
                <a href="/board/list?page=${pageInfo.prevPageNumber}" class="page-link">
                    &laquo;
                </a>
            </li>
        </c:if>
        <c:forEach begin="${pageInfo.leftPageNumber}"
                   end="${pageInfo.rightPageNumber}"
                   var="pageNumber">
            <li class="page-item ${pageInfo.currentPageNumber == pageNumber ? 'active' : ''}">
                <a href="/board/list?page=${pageNumber}" class="page-link">${pageNumber}</a> <%-- 숫자--%>
            </li>
            <%-- 다음버튼--%>
        </c:forEach>
        <c:if test="${pageInfo.hasNextPage}">
            <li class="page-item">
                <a href="/board/list?page=${pageInfo.nextPageNumber}" class="page-link">
                    &raquo;
                </a>
            </li>
        </c:if>
    </ul>
</nav>

<%--  pagination--%>
<div>
    <%--   이전버튼 --%>
    <c:if test="${pageInfo.hasPrevPage}">
        <a href="/board/list?page=${pageInfo.prevPageNumber}">이전</a>
    </c:if>
    <c:forEach begin="${pageInfo.leftPageNumber}"
               end="${pageInfo.rightPageNumber}"
               var="pageNumber">
        <%-- 현재 페이지에서 currentpage와 pagenumber가 같거나 다를 때
                같으면 active 추가 다르면 active추가 x--%>
        <a class="${pageInfo.currentPageNumber == pageNumber ? 'active' : ''}"
           href="/board/list?page=${pageNumber}">${pageNumber}</a>
    </c:forEach>
    <%--    다음버튼--%>
    <c:if test="${pageInfo.hasNextPage}">
        <a href="/board/list?page=${pageInfo.nextPageNumber}">다음</a>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>
