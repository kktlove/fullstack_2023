<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="/pro3_war" />
<!-- 헤더 내용 기술 -->
<header id="hd" class="container is-fullhd">
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="https://bulma.io">
                <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
            </a>

            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item">
                    Home
                </a>

                <a class="navbar-item">
                    Documentation
                </a>

                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                        Community
                    </a>

                    <div class="navbar-dropdown">
                        <a href="${path1 }/board/list.do" class="navbar-item">
                            Board
                        </a>
                        <a href="${path1 }/sample2/list.do" class="navbar-item">
                            Sample
                        </a>
                        <a href="${path1 }/free/list.do" class="navbar-item">
                            Free
                        </a>
                        <a href="${path1 }/file/filelist1.do" class="navbar-item">
                            Fileboard
                        </a>
                        <c:if test="${sid.equals('admin')}">
                        <a href="${path1 }/file/fileupload1.do" class="navbar-item">
                            FileUpload
                        </a>
                        </c:if>
                        <a class="navbar-item">
                            Contact
                        </a>
                        <hr class="navbar-divider">
                        <a class="navbar-item">
                            Report an issue
                        </a>
                    </div>
                </div>
            </div>

            <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    <c:if test="${!empty sid}">
                        <a href="${path1}/member/mypage.do" class="button is-primary">
                            <strong>MyPage</strong>
                        </a>
                        <a href="${path1}/member/logout.do" class="button is-light">
                            LogOut
                        </a>
                    </c:if>
                    <c:if test="${empty sid}">
                        <a href="${path1}/member/term.do" class="button is-primary">
                            <strong>Sign up</strong>
                        </a>
                        <a href="${path1}/member/login.do" class="button is-light">
                            Log in
                        </a>
                    </c:if>
                    <c:if test="${sid.equals('admin')}">
                        <a href="${path1}/member/list.do" class="button is-light">
                            MemberList
                        </a>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>