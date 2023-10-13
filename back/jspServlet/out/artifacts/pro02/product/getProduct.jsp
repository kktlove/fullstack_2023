<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세보기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
    th.item1 { width:16%; }
    #tb2 { width: 800px; margin:20px auto; }
    #tb2 .item1 { width:550px; }
    #tb2 .item2 { width:120px; }
    #tb2 .item3 { width:120px; }
    #tb2 p { width:500px; padding:14px; overflow:hidden; height:36px; white-space: nowrap; text-overflow: ellipsis; }
    #tb2 p.comment { text-align: center; }
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
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="${path }/ProList.do">Product</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">상품 상세보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty pro.imgSrc1}">
                            <img src="${path }/storage/${pro.imgSrc1 }" style="max-width:300px;" alt="대표 이미지">
                            </c:if>
                            <hr>
                            <c:if test="${!empty pro.imgSrc3}">
                            <img src="${path }/storage/${pro.imgSrc3 }" style="max-width:300px;" alt="대표 이미지">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th class="item1">도서 번호</th>
                        <td class="item2">${pro.prono }</td>
                    </tr>
                    <tr>
                        <th>도서명</th>
                        <td>${pro.pname }</td>
                    </tr>
                    <tr>
                        <th>도서 설명</th>
                        <td>
                            <pre>${pro.pcomment }</pre>
                        </td>
                    </tr>
                    <tr>
                        <th>도서 목차</th>
                        <td><pre>${pro.plist }</pre></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td>${pro.price }</td>
                    </tr>
                    <tr>
                        <th>남은 수량</th>
                        <td>
                            <c:if test="${amount <= 0}">
                                <span>절판</span>
                            </c:if>
                            <c:if test="${amount > 0}">
                                ${amount }
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty pro.imgSrc2}">
                            <img src="${path }/storage/${pro.imgSrc2 }" style="max-width:300px;" alt="대표 이미지">
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-wrap container">
                    <a href="${path }/ProList.do" class="btn btn-primary">제품 목록</a>
                    <c:if test="${sid.equals('admin') }">
                        <a href="${path }/AddReceive.do" class="btn btn-primary">상품 입고</a>
                        <a href="${path }/UpdateProduct.do?pno=${pro.pno }" class="btn btn-primary">상품 정보 수정</a>
                    </c:if>
                    <c:if test="${!empty sid }">
                        <a href="${path }/AddPayment.do?pno=${pro.pno }" class="btn btn-primary">구매하기</a>
                        <a href="${path }/AddCart.do?pno=${pro.pno }" class="btn btn-primary">장바구니 담기</a>
                    </c:if>
                </div>
                <hr>
                <div class="container">
                    <table class="table" id="tb2">
                        <tbody>
                        <c:if test="${!empty revList}">
                            <c:forEach var="rev" items="${revList}" varStatus="status">
                                <tr>
                                    <td class="item1"><p>${rev.content }</p></td>
                                    <td class="item2">
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
                                    <td class="item3"></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty revList}">
                        <tr>
                            <td colspan="3"><p class="comment"><strong style="font-size:16px;">아직 이용후기가 없습니다.</strong></p></td>
                        </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
