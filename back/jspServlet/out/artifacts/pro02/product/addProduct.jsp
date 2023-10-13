<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
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
                    <li class="breadcrumb-item active" aria-current="page">Add</li>
                </ol>
            </div>
        </nav>
        <div class="container-fluid">
            <h2 class="title">상품 등록</h2>
            <aside class="col-3">
                <%@ include file="../adminNav.jsp"%>
            </aside>
            <article class="col-9">
                <form name="frm1" id="frm1" action="${path }/AddProductPro.do" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="form-row">
                                    <select name="cate" id="cate" class="form-control">
                                        <option value="A">선택안함</option>
                                        <c:forEach var="cate" items="${cateList }" varStatus="status">
                                            <option value="${cate.cno }">${cate.cname }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pname">상품명</label></th>
                            <td>
                                <input type="text" name="pname" id="pname" placeholder="상품명 입력" class="form-control" maxlength="90" required />
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pcomment">상품설명</label></th>
                            <td><textarea rows="10" cols="100" name="pcomment" id="pcomment" placeholder="상품의 자세한 정보를 입력하세요" class="form-control" maxlength="1990" required></textarea></td>
                        </tr>
                        <tr>
                            <th><label for="plist">상품목차</label></th>
                            <td><textarea rows="10" cols="100" name="plist" id="plist" placeholder="도서 상품의 목차를 입력하세요" class="form-control" maxlength="1990" required></textarea></td>
                        </tr>
                        <tr>
                            <th><label for="price">가격</label></th>
                            <td><input type="number" name="price" id="price" placeholder="상품 가격 입력" class="form-control" value="1000" min="1000" step="100" required></td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc1">상품 이미지(메인 이미지)</label></th>
                            <td><input type="file" name="imgsrc1" id="imgsrc1" placeholder="상품 메인이미지" class="form-control" required></td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc2">상품 이미지(서브 이미지)</label></th>
                            <td><input type="file" name="imgsrc2" id="imgsrc2" placeholder="상품 서브이미지" class="form-control" required></td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc3">상품 이미지(서브 이미지2)</label></th>
                            <td><input type="file" name="imgsrc3" id="imgsrc3" placeholder="상품 서브이미지2" class="form-control" required></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="submit" name="submit-btn" class="btn btn-primary" value="상품등록">
                        <input type="reset" name="reset-btn" class="btn btn-primary" value="취소">
                        <a href="${path }/ProList.do" class="btn btn-primary">상품목록</a>
                    </div>
                </form>
            </article>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>