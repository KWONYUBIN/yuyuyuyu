<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>게사물 목록</h2>
<table>
  <thead>
  <tr>
    <td>번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>작성일시</td>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${boardList}" var="board">
    <tr>
      <td>${board.id}</td>
      <td>${board.title}</td>
      <td>${board.writer}</td>
      <td>${board.inserted}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>