<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 입고</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
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
                    <li class="breadcrumb-item active" aria-current="page">Receive</li>
                </ol>
            </div>
        </nav>
        <div class="container-fluid">
            <h2 class="title">상품 입고</h2>
            <aside class="col-3">
                <%@ include file="../adminNav.jsp"%>
            </aside>
            <article class="col-9">
                <form name="frm1" id="frm1" action="${path }/AddReceivePro.do" method="post">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="form-row">
                                    <span id="cate"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pno">상품명</label></th>
                            <td>
                                <c:set var="cate" />
                                <select name="pno" id="pno">
                                    <option value="1" cate="B" price="40000">선택안함</option>
                                    <c:forEach var="pro" items="${proList }" varStatus="status">
                                        <option value="${pro.pno }" cate="${pro.cate }" price="${pro.price }">${pro.pname }</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="amount">수량</label></th>
                            <td><input type="number" name="amount" id="amount" placeholder="입고 수량 입력" class="form-control" value="1" min="1" max="1000" required></td>
                        </tr>
                        <tr>
                            <th><label for="rprice">가격</label></th>
                            <td><input type="number" name="rprice" id="rprice" placeholder="입고 가격 입력" class="form-control" value="" min="1000" required></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="submit" name="submit-btn" class="btn btn-primary" value="상품입고">
                        <input type="reset" name="reset-btn" class="btn btn-primary" value="취소">
                        <a href="${path }/ProList.do" class="btn btn-primary">상품목록</a>
                    </div>
                </form>
                <script>
                $(document).ready(function(){
                   $("#pno").change(function(){
                        var v = $(this).val();
                        var cate = $(this).find("option:selected").attr("cate");
                        var price = parseInt($(this).find("option:selected").attr("price"));
                        $("#cate").text(cate);
                        $("#rprice").val(price);
                   });
                });
                </script>
            </article>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>