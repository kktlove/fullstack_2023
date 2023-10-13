<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<header class="header container-fluid" id="hd">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${path1 }">CHUNJAE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="${path1 }/ProList.do" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                상품
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=A">초등 교과서</a></li>
                                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=B">초등 참고서</a></li>
                                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=C">초등 참고서</a></li>
                                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=D">초등 기타</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${path1 }/ProList.do">전체</a></li>
                                <li><a class="dropdown-item" href="#">문제집</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                커뮤니티
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="#">묻고답하기</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">학습후기</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path1 }/FileUploadTest.do">파일 업로드</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path1 }/FileUploadTest2.do">파일 업로드2</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path1 }/Jsoup1">네이버 뉴스</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <ul class="nav justify-content-end">
                        <c:if test="${sid eq 'admin' }">
                            <li class="nav-item"><a href="${path1 }/Admin.do" class="nav-link">Admin</a></li>
                        </c:if>
                        <c:if test="${!empty sid }">
                            <li class="nav-item"><a href="${path1 }/Mypage.do" class="nav-link">Mypage</a></li>
                            <li class="nav-item"><a href="${path1 }/PaymentList.do" class="nav-link">PayList</a></li>
                            <li class="nav-item"><a href="${path1 }/CartList.do" class="nav-link">Cart Info</a></li>
                            <li class="nav-item"><a href="${path1 }/Logout.do" class="nav-link">Logout</a></li>
                            <li class="nav-item"><a href="${path1 }/Contact.do" class="nav-link">Contact US</a></li>
                        </c:if>
                        <c:if test="${empty sid }">
                            <li class="nav-item"><a href="${path1 }/Login.do" class="nav-link">Login</a></li>
                            <li class="nav-item"><a href="${path1 }/Term.do" class="nav-link">Join</a></li>
                            <li class="nav-item"><a href="${path1 }/Contact.do" class="nav-link">Contact US</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
