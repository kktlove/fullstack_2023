<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 구매</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                    <li class="breadcrumb-item"><a href="${path }/ProList.do">Product</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sale</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">상품 구매</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AddPaymentPro.do" method="post" onsubmit="return payCheck(this)">
                    <table class="table table-secondary" id="tb1">
                        <tbody>
                        <tr>
                            <td colspan="2">
                                <c:if test="${!empty pro.imgSrc1}">
                                    <img src="${path }/storage/${pro.imgSrc1 }" style="max-width:600px;" alt="대표 이미지">
                                </c:if>
                                <hr>
                                <c:if test="${!empty pro.imgSrc3}">
                                    <img src="${path }/storage/${pro.imgSrc3 }" style="max-width:600px;" alt="대표 이미지">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="item1">도서 번호</th>
                            <td class="item2">${pro.prono }</td>
                        </tr>
                        <tr>
                            <th>도서명</th>
                            <td>
                                ${pro.pname }
                                <input type="hidden" name="pname" id="proName" value="${pro.pname }">
                                <input type="hidden" name="from" id="from" value="${from }">
                                <c:if test="${from.equals('cart')}">
                                    <input type="hidden" name="cartno" id="cartno" value="${cartno }">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>도서 설명</th>
                            <td>
                                <pre>${pro.pcomment }</pre>
                            </td>
                        </tr>
                        <tr>
                            <th>도서 목차</th>
                            <td><pre>${pro.plist }</pre></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td>
                                ${pro.price*1.35 }
                                <input type="hidden" name="sprice" id="sprice" value="${pro.price*1.35 }">
                            </td>
                        </tr>
                        <tr>
                            <th>구매 수량</th>
                            <td>
                                <input type="hidden" name="pno" id="pno" value="${pro.pno }" />
                                <input type="number" name="amount" id="amount" class="form-control" min="1" value="1" max="${amount }" />
                                <c:if test="${amount==0}">
                                    <strong>절판</strong>
                                </c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <hr>
                    <h3>배송 정보</h3>
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>배송지 주소</th>
                            <td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required /><br>
                                <input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
                                <input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control" required>
                                <button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary" style="margin-bottom:36px;">우편번호 검색</button>
                            </td>
                        </tr>
                        <tr>
                            <th>받는 사람 연락처</th>
                            <td>
                                <input type="hidden" name="cid" id="cid" value="${cus.id }">
                                <input type="hidden" name="name" id="name" value="${cus.name }">
                                <input type="hidden" name="email" id="email" value="${cus.email }">
                                <input type="hidden" name="tel" id="tel" value="${cus.tel }">
                                <input type="hidden" name="addr" id="addr" value="${cus.addr }">
                                <input type="tel" name="custel" id="custel" class="form-control" required>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <hr>
                    <h3>결제 정보</h3>
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>결제 수단</th>
                            <td>
                                <select name="pmethod" id="pmethod" class="form-control">
                                    <option value="신용카드">신용카드</option>
                                    <option value="체크카드">체크카드</option>
                                    <option value="계좌이체">계좌이체</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>결제사</th>
                            <td>
                                <select name="pcom" id="pcom" class="form-control">
                                    <option value="선택안함">선택안함</option>
                                </select>
                                <input type="hidden" name="pcom2" id="pcom2" value="">
                            </td>
                        </tr>
                        <tr>
                            <th>결제 번호</th>
                            <td>
                                <input type="text" name="cnum" id="cnum" class="form-control" required>
                                <input type="hidden" name="payAmount" id="payAmount">
                                <input type="hidden" name="payCk" id="payCk" value="no">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" id="pay" value="결재" class="btn btn-primary">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-wrap container">
                        <c:if test="${!empty sid }">
                            <input type="submit" class="btn btn-primary" value="구매">
                        </c:if>
                        <a href="${path }/ProList.do" class="btn btn-primary">제품 목록</a>
                    </div>
                </form>
                <script>
                $(document).ready(function(){
                    var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
                    var cardArr2 = ["하나카드","농협카드","BC카드"];
                    var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
                    $("#pmethod").change(function(){
                       var th = $(this).val();
                       if(th==="신용카드"){
                           for(var i=0;i<cardArr1.length;i++) {
                               $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                           }
                       } else if(th==="체크카드"){
                           for(var i=0;i<cardArr2.length;i++) {
                               $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                           }
                       } else {
                           for(var i=0;i<bankArr.length;i++) {
                               $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                           }
                       }
                    }).change();
                    $("#pcom").change(function(){
                       $("#pcom2").val($(this).val());
                    });
                });
                </script>
                <script>
                //주소 연동 API
                function findAddr() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            console.log(data);
                            var roadAddr = data.roadAddress;
                            var jibunAddr = data.jibunAddress;
                            document.getElementById("postcode").value = data.zonecode;
                            if(roadAddr !== '') {
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
                <script>
                    //결제모듈 API 연동
                    $(document).ready(function(){
                        var totalPay=0;
                        var proName;
                        $("#pay").click(function(){
                            var email = $("#name").val();
                            var cname = $("#email").val();
                            var tel = $("#tel").val();
                            var addr = $("#addr").val();
                            var postcode = $("#postcode").val();
                            proName = $("#proName").val();
                            if($("#amount").val()!="") {
                                totalPay = parseInt($("#sprice").val()) * parseInt($("#amount").val());
                            } else {
                                alert("구매할 수량을 입력하지 않으셨습니다.");
                                $("#amount").focus();
                                return;
                            }
                            alert("결제할 금액 : "+totalPay);
                            //상품명_현재시간
                            var d = new Date();
                            var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
                            IMP.init('imp31083748'); // 결제 API를 사용하기 위한 코드 입력!
                            IMP.request_pay({		//결제 요청
                                merchant_uid : '상품명_' + date, //상점 거래 ID
                                name : proName,				// 결제 명
                                amount : totalPay,					// 결제금액
                                buyer_email : email, // 구매자 email
                                buyer_name : cname,				// 구매자 이름
                                buyer_tel : tel,		// 구매자 전화번호
                                buyer_addr : addr,		// 구매자 주소
                                buyer_postcode : postcode			// 구매자 우편번호
                            }, function(rsp){
                                if(rsp.success){
                                    console.log(rsp);
                                    var msg = '결제가 완료 되었습니다.';
                                    var r1 = '고유 아이디 : ' +rsp.imp_uid;
                                    var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                                    var r3 = '결제 금액 : ' +rsp.paid_amount;
                                    var r4 = '카드 승인 번호 : '+rsp.apply_num;

                                    //$("#payCk").val("yes");
                                    //$("#payAmount").val(rsp.paid_amount);
                                    //$("#pmethod").val(rsp.pay_method);
                                    //$("#pcom").val(rsp.pg_provider);
                                    //$("#cnum").val(rsp.apply_num);
                                    //alert(msg);
                                    //$("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                                } else{
                                    //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                                }
                                //테스트용이므로 실패시에도 그냥 통과시킴
                                $("#payCk").val("yes");
                                $("#payAmount").val(totalPay);
                                $("#pmethod").val("신용카드");
                                $("#pcom").val("삼성카드");
                                $("#cnum").val("123-1234-1234-1278");
                                $("#paymentResult").text("결제 완료 : "+totalPay);
                            });
                        });
                    });
                </script>
                <script>
                    function payCheck(f){
                        var payCk = f.payCk.value;
                        if(payCk!="yes"){
                            alert("아직 결제 전 입니다.");
                            return;
                        }
                    }
                </script>
            </div>
            <div class="container">
                <p id="paymentResult" style="color:red;font-size:28px;font-weight:800;">결제 전</p>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
