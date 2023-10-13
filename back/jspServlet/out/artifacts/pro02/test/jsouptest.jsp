<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jsoup Test1</title>
</head>
<body>
<h1>Jsoup Naver News Crawler</h1>
<ul class="lst">
    <c:if test="${!empty newsList}">
    <c:forEach items="${newsList }" var="news">
        <li>
            <div class="item-title">
                ${news.title }
            </div>
            <div class="item-image">
                <img src="${news.img }" alt="${news.title }">
            </div>
            <div class="item-text">
                ${news.content }
            </div>
        </li>
    </c:forEach>
    </c:if>
    <c:if test="${empty newsList}">
        <li>검색된 뉴스가 존재하지 않습니다.</li>
    </c:if>
</ul>
</body>
</html>
