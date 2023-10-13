<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>회원가입</title>
    <jsp:include page="../common.jsp" />
    <style>
        .title { padding-top:36px; padding-bottom:20px; }
        #id { width:780px; float:left; margin-right:30px; margin-left:6px; }
    </style>
</head>
<body>
<jsp:include page="../header.jsp" />
<section class="section">
    <div class="container">
        <h2 class="title">회원가입</h2>
        <form name="frm1" id="frm1" action="${path }/JoinPro.do" method="post" onsubmit="return joinCheck(this)">
            <table class="table">
                <tbody>
                <tr>
                    <th>아이디</th>
                    <td>
                        <div class="form-row">
                            <input type="text" name="id" id="id" placeholder="영문소문자 및 숫자를 혼용하여 아이디 입력" class="form-control" pattern="^[a-z0-9]{8,16}" maxlength="16" autofocus required />
                            <input type="button" class="btn btn-primary" value="아이디 중복 확인" onclick="idCheck()">
                            <input type="hidden" name="idck" id="idck" value="no">
                        </div>
                        <div>
                            <c:if test="${empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
                            </c:if>
                            <c:if test="${not empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pw" id="pw" placeholder="비밀번호 입력" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required />
                        <p>비밀번호는 최소 8자리에서 최대 16자리까지 숫자, 영문, 특수문자 각 1개 이상 포함되어야 함</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="pw2" id="pw2" placeholder="비밀번호  확인 입력" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required /></td>
                </tr>
                <tr>
                    <th>회원이름</th>
                    <td><input type="text" name="name" id="name" placeholder="이름 입력" class="form-control" required /></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" id="email" placeholder="이메일 입력" class="form-control" required></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="date" name="birth" id="birth" placeholder="생년월일 입력" class="form-control" required></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><input type="tel" name="tel" id="tel" maxlength="11" placeholder="전화번호 숫자만 입력 00000000000" class="form-control" required></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required /><br>
                        <input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
                        <input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
                        <button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn-group">
                <input type="submit" name="submit-btn" class="btn btn-primary" value="회원가입">
                <input type="reset" name="reset-btn" class="btn btn-primary" value="취소">
                <a href="${path }/Login.do" class="btn btn-primary">로그인</a>
            </div>
        </form>
        <script>
            $(document).ready(function(){
                $("#id").keyup(function(){
                    $("#idck").val("no");
                    if($(this).val()!=""){
                        $("#msg").html("<strong>아이디 입력중입니다.</strong>");
                        $("#id").focus();
                    } else {
                        $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
                    }
                });
            });
        function idCheck(){
            if($("#id").val()==""){
                alert("아이디를 입력하지 않았습니다.");
                $("#id").focus();                return;
            }
            var params = { id:$("#id").val() }
            $.ajax({
               url:"${path }/IdCheck.do",
               type:"post",
               dataType:"json",
               data:params,
               success:function(data){   //console.log(data.result);
                    var idPass = data.result;
                    if(idPass==false){
                        $("#idck").val("no");
                        $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디입니다. 다시 입력하시기 바랍니다.</strong>");
                        $("#id").focus();
                    } else if(idPass==true){
                        $("#idck").val("yes");
                        $("#msg").html("<strong style='color:red'>사용 가능한 아이디입니다.</strong>");
                    } else if(idPass==""){
                        $("#msg").text("<strong style='color:blue'>아이디가 확인되지 않았습니다. 다시 시도하시기 바랍니다.</strong>");
                    }
               }
            });
        }
        </script>
        <script>
            function joinCheck(f){
                if(f.pw.value!=f.pw2.value){
                    alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                    f.pw.focus();
                    return false;
                }
                if(f.idck.value!="yes"){
                    alert("아이디 중복 체크를 하지 않으셨습니다.");
                    return false;
                }
            }
            function findAddr(){
                new daum.Postcode({
                    oncomplete:function(data){
                        console.log(data);
                        var roadAddr = data.roadAddress;
                        var jibunAddr = data.jibunAddress;
                        document.getElementById("postcode").value = data.zonecode;
                        if(roadAddr !== ''){
                            document.getElementById("address1").value = roadAddr;
                        } else if(jibunAddr !== ''){
                            document.getElementById("address1").value = jibunAddr;
                        }
                        document.getElementById("address2").focus();
                    }
                }).open();
            }
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>