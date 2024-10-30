<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 이 navbar에선 Dropdown, Disabled, form은 필요없어서 지움 --%>
<div class="mb-4">
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
<%----%>
<c:if test="${not empty message}">
    <div class="container mb-4">
        <div class="row justify-content-center">  <%--가운데로 오게 함--%>
            <div class="col col-md-8 col-xl-6">
                <div class="alert alert-${message.type} alert-dismissible fade show">
                        ${message.text}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
    </div>
</c:if>
