<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #111; color:#fff; }
        .item1 { width:8%; }
        .item2 { width:8%; }
        .item3 { width:12%; }
        .item4 { width:30%; }
        .item5 { width:10%; }
        .star { background-image: url("${path }/images/star2.jpg"); background-repeat:repeat-x; height:20px; overflow:hidden; }
        .star1 { width:20px; }
        .star2 { width:40px; }
        .star3 { width:60px; }
        .star4 { width:80px; }
        .star5 { width:100px; }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner" style="max-height:300px;overflow:hidden;">
                <div class="carousel-item active">
                    <img src="${path }/images/sub_vs01.jpg" class="d-block w-100" alt="천재교과서">
                </div>
                <div class="carousel-item">
                    <img src="${path }/images/sub_vs02.jpg" class="d-block w-100" alt="천재문제집">
                </div>
                <div class="carousel-item">
                    <img src="${path }/images/sub_vs03.jpg" class="d-block w-100" alt="천재참고서">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Review</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">리뷰 목록</h2>
        <p class="msg">${msg }</p>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">연번</th>
                        <th class="item2">결제번호</th>
                        <th class="item3">작성자</th>
                        <th class="item4">내용</th>
                        <th class="item5">별점</th>
                        <th class="item6">작업</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="rev" items="${revList }" varStatus="status">
                        <tr>
                            <td class="item1">${status.count }</td>
                            <td class="item2">
                                <span title="${rev.sno }">${rev.sno }</span>
                            </td>
                            <td class="item3">
                                <span>${rev.cid }</span>
                            </td>
                            <td class="item4">
                                <span>${rev.content }</span>
                            </td>
                            <td class="item5">
                                <div class="author" title="${rev.cid }">
                                    <c:if test="${rev.star==5}">
                                        <div class="star star5"></div>
                                    </c:if>
                                    <c:if test="${rev.star==4}">
                                        <div class="star star4"></div>
                                    </c:if>
                                    <c:if test="${rev.star==3}">
                                        <div class="star star3"></div>
                                    </c:if>
                                    <c:if test="${rev.star==2}">
                                        <div class="star star2"></div>
                                    </c:if>
                                    <c:if test="${rev.star==1}">
                                        <div class="star star1"></div>
                                    </c:if>
                                </div>
                            </td>
                            <td class="item6">
                                <a href="${path }/DelReview.do?rno=${rev.rno }" class="btn btn-primary">리뷰 삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty revList}">
                        <tr>
                            <td colspan="6">리뷰가 존재하지 않습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>