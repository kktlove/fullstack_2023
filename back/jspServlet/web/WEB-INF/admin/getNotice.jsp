<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #111; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:70%; }
    .item3 { width:10%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
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
                    <li class="breadcrumb-item"><a href="#">Notice</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">공지사항 상세보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <td>${noti.no }</td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td>${noti.title }</td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td>${noti.content }</td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td>${noti.resdate }</td>
                    </tr>
                    <tr>
                        <th>읽은 횟수</th>
                        <td>${noti.visited }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/AdminNoticeList.do" class="btn btn-primary">글 목록</a>
                    <a href="${path }/UpdateNotice.do?no=${noti.no }" class="btn btn-primary">글 수정</a>
                    <a href="${path }/DeleteNotice.do?no=${noti.no }" class="btn btn-primary">글 삭제</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
