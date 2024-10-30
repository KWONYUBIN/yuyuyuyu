<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 이 navbar에선 Dropdown, Disabled, form은 필요없어서 지움 --%>
<div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="/board/list">JSP게시판</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">                                   <%--아래에 aria 머시기 있었는데 지움--%>
                        <a class="nav-link ${param.active == 'list' ? 'active' : ''}" href="/board/list">
<%--      active가 현재 위치를 알려주고 있음/  param과 연결/ 따라서 list일때 active --%>
                            <i class="fa-solid fa-list"></i>
                            목록
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.active == 'new' ? 'active' : ''}" href="/board/new">
<%--      active가 현재 위치를 알려주고 있음/  param과 연결/ 따라서 new일때 active --%>
                            <i class="fa-solid fa-pencil"></i>
                            작성
                        </a>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
</div>

<div>

    <c:if test="${not empty message}">
        <style>
            h5 {
                padding: 10px;
            }

            .success {
                background-color: skyblue;
            }

            .warning {
                background-color: darkorange;
            }

            .save {
                background-color: darkorange;
            }
        </style>
        <div class="${message.type}">
            <h5>
                    ${message.text}
            </h5>
        </div>
    </c:if>
</div>