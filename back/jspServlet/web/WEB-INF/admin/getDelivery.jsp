<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 배송 처리화면</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #111; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:70%; }
        .item3 { width:10%; }
        .item4 { width:10%; }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Delivery</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">관리자 배송 처리 화면</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/SurveyDelivery.do" method="post">
                    <table class="table table-secondary" id="tb1">
                        <tbody>
                        <tr>
                            <th>배송 번호</th>
                            <td>${del.dno }
                                <input type="hidden" name="dno" id="dno" value="${del.dno }">
                            </td>
                        </tr>
                        <tr>
                            <th>배송 상품</th>
                            <td><a href="${path }/Payment.do?sno=${del.sno }" title="${pro.pname }">${pro.pno }</a></td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td><a href="${path }/AdminCustom.do?cid=${cus.id }" title="${cus.name }">${del.cid }</a> / ${del.custel }</td>
                        </tr>
                        <tr>
                            <th>주문일시</th>
                            <td>${del.sdate }</td>
                        </tr>
                        <tr>
                            <th>배송 상태</th>
                            <td>
                                <c:if test="${del.pstate == 0}">
                                    <p>배송 전</p>
                                </c:if>
                                <c:if test="${del.pstate == 1}">
                                    <p>배송중</p>
                                </c:if>
                                <c:if test="${del.pstate == 2}">
                                    <p>배송완료</p>
                                </c:if>
                                <c:if test="${del.pstate == 3}">
                                    <p>구매완료</p>
                                </c:if>
                                <c:if test="${del.pstate != 3}">
                                <select name="pstate" id="pstate">
                                    <option value="0">배송전</option>
                                    <option value="1">배송중</option>
                                    <option value="2">배송완료</option>
                                    <option value="3">구매완료</option>
                                </select>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>배송사</th>
                            <td>
                                <c:if test="${empty del.pcom }">
                                <input type="text" name="pcom" id="pcom" class="form-control">
                                </c:if>
                                <c:if test="${!empty del.pcom }">
                                    <input type="text" name="pcom" id="pcom" value="${del.pcom }" class="form-control">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>배송처 연락처</th>
                            <td>
                                <c:if test="${empty del.ptel }">
                                    <input type="tel" name="ptel" id="ptel" class="form-control">
                                </c:if>
                                <c:if test="${!empty del.ptel }">
                                    <input type="tel" name="ptel" id="ptel" value="${del.ptel }" class="form-control">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>배송 시작일</th>
                            <td>
                                <c:if test="${empty del.sdate}">
                                    <input type="date" name="sdate" id="sdate" class="form-control">
                                </c:if>
                                <c:if test="${!empty del.sdate}">
                                    <input type="date" name="sdate" value="${del.sdate }" id="sdate" class="form-control">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>배송 완료일</th>
                            <td>
                                <c:if test="${empty del.rdate}">
                                    <input type="date" name="rdate" id="rdate" class="form-control">
                                </c:if>
                                <c:if test="${!empty del.sdate}">
                                    <input type="date" name="rdate" value="${del.rdate }" id="sdate" class="form-control">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>송장 번호</th>
                            <td>
                                <c:if test="${empty del.bcode }">
                                    <input type="text" name="bcode" id="bcode" class="form-control">
                                </c:if>
                                <c:if test="${!empty del.bcode }">
                                    <input type="text" name="bcode" id="bcode" value="${del.bcode }" class="form-control">
                                </c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="submit" value="배송 내용 변경" class="btn btn-primary">
                        <a href="${path }/CompleteDelivery.do?dno=${del.dno }" class="btn btn-primary">배송 완료 처리</a>
                        <a href="${path }/AdminSalesComplete.do?dno=${del.dno }" class="btn btn-primary">구매 완료 처리</a>
                        <a href="${path }/DeliveryList.do" class="btn btn-primary">배송 목록</a>
                        <a href="${path }/ReturnPayment.do?sno=${del.sno }" class="btn btn-primary">반품 처리</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>