<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 상세보기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        th.item1 { width:16%; }
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
                    <li class="breadcrumb-item"><a href="${path }/PaymentList.do">Payment</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">결제/배송 상세보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th class="item1">결재 번호</th>
                        <td class="item2">${pay.sno }</td>
                    </tr>
                    <tr>
                        <th>상품 정보</th>
                        <td><span title="${pro.pname }">${pro.pno }</span></td>
                    </tr>
                    <tr>
                        <th>고객 정보</th>
                        <td>
                            <span title="${cus.name }">${cus.id }</span>
                        </td>
                    </tr>
                    <tr>
                        <th>구매 수량</th>
                        <td><span>${pay.amount }</span></td>
                    </tr>
                    <tr>
                        <th>결제 가격</th>
                        <td><fmt:formatNumber value="${pay.payprice }" pattern="#,##0" /></td>
                    </tr>
                    <tr>
                        <th>결제 정보</th>
                        <td>
                            <p class="pmethod">${pay.pmethod }</p>
                            <p class="pcom">${pay.pcom }</p>
                            <p class="cnum">${pay.cnum }</p>
                        </td>
                    </tr>
                    <tr>
                        <th>배송 정보</th>
                        <td>
                            <p class="daddr">배송지 : ${del.daddr }</p>
                            <c:if test="${del.pstate!=0}">
                            <p class="pcom">배송사 : ${del.pcom }</p>
                            <p class="ptel">배송처 연락처 : ${del.ptel }</p>
                            <p class="cnum">출발일 : ${del.sdate }</p>
                            <p class="cnum">도착일 : ${del.rdate }</p>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-wrap container">
                    <a href="${path }/PaymentList.do" class="btn btn-primary">결제 목록</a>
                    <c:if test="${!empty sid && sid.equals(cus.id) && del.pstate==0}">
                        <a href="${path }/RequestReturn.do?sno=${pay.sno }" class="btn btn-primary">반품 요청</a>
                    </c:if>
                    <c:if test="${!empty sid && sid.equals(cus.id) && del.pstate==2}">
                        <a href="${path }/AddReview.do?sno=${pay.sno }" class="btn btn-primary">구매 완료</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>