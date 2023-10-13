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

          </div>
          <div class="container" style="min-height:100vh;">
              <h2 class="title">신상품</h2>

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
