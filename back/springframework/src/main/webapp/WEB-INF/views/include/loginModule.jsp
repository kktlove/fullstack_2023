<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="/pro3_war" />
<div class="column is-3">
    <c:if test="${empty sid}">
        <form action="${path1 }/member/loginCheck.do" method="post">
            <fieldset>
                <h3>로그인</h3>
                <hr>
                <div class="control"><input type="text" name="id" id="id" placeholder="아이디 입력" class="input" required></div>
                <div class="control"><input type="password" name="pw" id="pw" placeholder="비밀번호 입력" class="input" required></div>
                <div class="control">
                    <button type="submit" class="button is-primary">로그인</button>
                    <a href="${path1}/member/term.do" class="button is-danger">회원가입</a>
                </div>
            </fieldset>
        </form>
    </c:if>
    <c:if test="${not empty sid}">
        <p>${member.name} 님이 로그인 중입니다.</p>
    </c:if>
</div>