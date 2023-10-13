<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>메인 페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="/common.jsp"%>
  </head>
  <body>
  <div class="container-fluid">
      <%@ include file="/header.jsp"%>
      <div class="contents">
          <div class="container-fluid" style="">

          </div>
          <div class="container" style="min-height:100vh;">
              <h2 class="title">베스트셀러 상품</h2>
              <div class="box_wrap">
                  <ul class="list row">
                      <c:forEach var="pro" items="${bestList }" varStatus="status">
                          <li class="col-3">
                              <div class="card" style="width: 18rem;">
                                  <div class="img-wrap" style="height:286px;overflow:hidden;">
                                      <img src="${path }/storage/${pro.imgSrc1 }" class="card-img-top" alt="샘플이미지">
                                  </div>
                                  <div class="card-body">
                                      <h3 class="card-title" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${pro.pname }</h3>
                                      <p class="card-text">가격 : ${pro.price }</p>
                                      <a href="${path }/Product.do?pno=${pro.pno }" class="btn btn-primary">상세보기</a>
                                  </div>
                              </div>
                          </li>
                      </c:forEach>
                      <c:if test="${empty bestList}">
                          <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                      </c:if>
                  </ul>
              </div>
          </div>
          <div class="container" style="min-height:100vh;">
              <h2 class="title">신상품</h2>
              <div class="box_wrap">
                  <ul class="list row">
                      <c:forEach var="pro" items="${newList }" varStatus="status">
                          <li class="col-3">
                              <div class="card" style="width: 18rem;">
                                  <div class="img-wrap" style="height:286px;overflow:hidden;">
                                      <img src="${path }/storage/${pro.imgSrc1 }" class="card-img-top" alt="샘플이미지">
                                  </div>
                                  <div class="card-body">
                                      <h3 class="card-title" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${pro.pname }</h3>
                                      <p class="card-text">가격 : ${pro.price }</p>
                                      <a href="${path }/Product.do?pno=${pro.pno }" class="btn btn-primary">상세보기</a>
                                  </div>
                              </div>
                          </li>
                      </c:forEach>
                      <c:if test="${empty newList}">
                          <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                      </c:if>
                  </ul>
              </div>
          </div>
          <div class="container" style="min-height:100vh;">
              <h2 class="title">공지사항</h2>

          </div>
          <div class="container" style="min-height:100vh;">
              <h2 class="title">이벤트</h2>

          </div>
      </div>
      <%@ include file="/footer.jsp" %>
  </div>
  </body>
</html>
