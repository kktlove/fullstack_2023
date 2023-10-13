<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용후기 작성하기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        th.item1 { width:16%; }
        .label_box { width:100px; background-image:url("${path }/images/star2.jpg"); background-repeat: repeat-x; height:20px;
        overflow: hidden; }
        #star1:checked ~ .label_box { width:20px; }
        #star2:checked ~ .label_box { width:40px; }
        #star3:checked ~ .label_box { width:60px; }
        #star4:checked ~ .label_box { width:80px; }
        #star5:checked ~ .label_box { width:100px; }
        .label_box .lb_wrap { width:100px; height:20px; }
        .label_box .lb_wrap label { display:block; width:20px; height:20px; float:left; }
        #tb1 td { background-color:#fff; }
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
                    <li class="breadcrumb-item"><a href="${path }/PaymentList.do">Review</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Add</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">이용후기 작성하기</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AddReviewPro.do" method="post">
                    <table class="table table-secondary" id="tb1">
                        <tbody>
                        <tr>
                            <th class="item1">구매 상품 정보</th>
                            <td class="item2">
                                <span title="${pro.pname }">${pro.pname }</span>
                                <input type="hidden" name="pno" id="pno" value="${pro.pno }">
                            </td>
                        </tr>
                        <tr>
                            <th>결제 정보</th>
                            <td>
                                <p class="pmethod">결제 방법 : ${pay.pmethod }</p>
                                <p class="pcom">결제사 : ${pay.pcom }</p>
                                <p class="cnum">결제 번호 : ${pay.cnum }</p>
                                <p class="payprice">결제 금액 : <fmt:formatNumber value="${pay.payprice }" pattern="#,##0" /></p>
                                <input type="hidden" name="sno" id="sno" value="${pay.sno }">
                            </td>
                        </tr>
                        <tr>
                            <th>배송 정보</th>
                            <td>
                                <p class="daddr">배송지 : ${del.daddr }</p>
                                <p class="pcom">배송사 : ${del.pcom }</p>
                                <p class="ptel">배송처 연락처 : ${del.ptel }</p>
                                <p class="cnum">출발일 : ${del.sdate }</p>
                                <p class="cnum">도착일 : ${del.rdate }</p>
                                <input type="hidden" name="cid" id="cid" value="${cus.id }">
                            </td>
                        </tr>
                        <tr>
                            <th>이용 후기</th>
                            <td>
                                <textarea name="content" id="content" cols="100" rows="8" maxlength="498" class="form-control" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>만족도</th>
                            <td>
                                <input type="radio" name="star" id="star1" value="1" style="display:none">
                                <input type="radio" name="star" id="star2" value="2" style="display:none">
                                <input type="radio" name="star" id="star3" value="3" style="display:none">
                                <input type="radio" name="star" id="star4" value="4" style="display:none">
                                <input type="radio" name="star" id="star5" value="5" style="display:none" checked>
                                <div class="label_box">
                                    <div class="lb_wrap">
                                        <label for="star1" id="lb1"></label>
                                        <label for="star2" id="lb2"></label>
                                        <label for="star3" id="lb3"></label>
                                        <label for="star4" id="lb4"></label>
                                        <label for="star5" id="lb5"></label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-wrap container">
                        <a href="${path }/PaymentList.do" class="btn btn-primary">결제 목록</a>
                        <input type="submit" value="구매결정완료" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>