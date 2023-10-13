<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드</title>
    <jsp:include page="../common.jsp" />
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
    <h2>파일 첨부 테스트</h2>
    <form action="${path }/FileUploadProTest.do" method="post" enctype="multipart/form-data">
       <table class="table">
           <tbody>
           <tr>
               <th><label for="uname">이름</label></th>
               <td><input type="text" name="uname" id="uname" class="form-control"></td>
           </tr>
           <tr>
               <th><label for="subject">제목</label></th>
               <td><input type="text" name="subject" id="subject" class="form-control"></td>
           </tr>
           <tr>
               <th><label for="content">내용</label></th>
               <td><textarea name="content" id="content" class="form-control"></textarea></td>
           </tr>
           <tr>
               <th><label for="filename">첨부 파일</label></th>
               <td><input type="file" name="filename" id="filename" class="form-control"></td>
           </tr>
           <tr>
               <td colspan="2"><input type="submit" value="등록" class="btn btn-primary"></td>
           </tr>
           </tbody>
       </table>
    </form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
