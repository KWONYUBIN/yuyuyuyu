<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<h2>${board.id}번 게시물</h2>
<%--readonly 는 수정될 수 없다는 뜻--%>

<div>
    제목<input type="text" value="${board.title}" readonly>
</div>
<div>
    본문
    <textarea name="" id="" cols="30" rows="10" readonly>${board.content}</textarea>
</div>
<div>
    작성자
    <input type="text" value="${board.writer}" readonly>
</div>
<div>
    작성일시
    <input type="text" value="${board.inserted}" readonly>
</div>

<div>
    <form action="/board/delete" method="post">
        <input type="hidden" name="id" value="${board.id}">
        <button>삭제</button>
    </form>
</div>
<%--이동해야하니까 a태그사용--%>
<a href="/board/edit?id=${board.id}">수정</a>

</body>
</html>