package edu.chunjae.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    final static String NOTICE_SELECT_ALL = "select * from notice order by no desc";
    final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
    final static String NOTICE_INSERT = "insert into notice values (default,?,?,default,default);";
    final static String NOTICE_SELECT_RANGE = "select * from notice order by no desc limit 5 offset ?";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
    final static String NOTICE_DELETE = "delete from notice where no=?";
    final static String NOTICE_COUNT = "select count(*) as cnt from notice";
    final static String NOTICE_COUNT_TITLE = "select count(*) as cnt from notice where title like ?";
    final static String NOTICE_COUNT_CONTENT = "select count(*) as cnt from notice where content like ?";
    final static String NOTICE_COUNT_ALL = "select count(*) as cnt from notice where title like ? or content like ?";
    final static String NOTICE_SELECT_TITLE_RANGE = "select * from notice where title like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_CONTENT_RANGE = "select * from notice where content like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_ALL_RANGE = "select * from notice where title like ? or content like ? order by resdate desc limit 5 offset ?";

    final static String CUSTOM_SELECT_ALL = "select * from custom order by regdate desc";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";
    final static String CUSTOM_SELECT_LOG = "select * from custom where id=?";
    final static String CUSTOM_INSERT = "insert into custom values (?,?,?,default,default,?,?,?,default,?)";
    final static String CUSTOM_UPDATE = "update custom set pw=?,tel=?,email=? where id=?";
    final static String CUSTOM_DELETE = "delete from custom where id=?";

    final static String PRODUCT_SELECT_ALL = "select * from product order by pno";
    final static String PRODUCT_SELECT_CATE = "select * from product where cate=? order by pno";
    final static String PRODUCT_SELECT_ONE = "select * from product where pno=?";
    final static String PRODUCT_SELECT_NEW = "select * from product order by pno desc limit 5";
    final static String PRODUCT_SELECT_BEST = "select * from product where pno in (select pno from payment group by pno order by sum(amount) desc limit 5)";
    final static String PRODUCT_INSERT = "insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, ?, default)";
    final static String PRODUCT_INSERT_UPDATE = "update product set prono = concat(cate, pno) where pno in (select pno from product order by resdate desc limit 1)";
    final static String PRODUCT_UPDATE = "update product set pname=?, pcomment=?, plist=?, price=?, imgsrc1=?, imgsrc2=?, imgsrc3=? where pno=?";
    final static String PRODUCT_DELETE = "delete from product where pno=?";

    //입고 처리 패턴
    final static String PRODUCT_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String CATEGORY_LOAD = "select * from category";

    //출고 처리 패턴
    final static String SERVE_PAYMENT = "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '')";
    final static String SERVE_INSERT = "insert into serve values(default, ?, ?, ?, default)";
    final static String DELIVERY_INSERT = "insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','')";
    final static String CART_DELETE = "delete from cart where cartno=?";
    final static String GET_SNO = "select sno from payment order by sno desc limit 1";

    //반품 처리 패턴
    final static String RETURN_PAYMENT = "delete from payment where sno=?";
    final static String RETURN_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String RETURN_SERVE = "delete from serve where sno=?";
    final static String RETURN_CART = "insert into cart values (default, ?, ?, ?)";
    final static String RETURN_DELEVERY = "delete from delivery where sno=?";

    //배송 처리
    final static String DELIVERY_PRO = "update delivery set pcom=?, ptel=?, pstate=1, sdate=current_timestamp, rdate=?, bcode=? where dno=?";
    final static String DELIVERY_COMPLETE = "update delivery set pstate=2 where dno=?";
    final static String DELIVERY_SALES_COMPLETE = "update delivery set pstate=3 where dno=?";
    final static String DELIVERY_SELECT_ONE = "select * from delivery where dno=?";
    final static String DELIVERY_SELECT_LIST = "select * from delivery order by dno desc";
    final static String DELIVERY_SELECT_SNO = "select * from delivery where sno=?";

    //재고 조회
    final static String INVENTORY_SELECT_ALL = "select * from inventory order by pno desc";
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pno=?";

    //입고 처리
    final static String RECEIVE_INSERT = "insert into receive values (default, ?, ?, ?, default)";

    //장바구니 기능
    final static String CART_INSERT = "insert into cart values (default,?,?,?)";
    final static String CART_SELECT_CID = "select * from cart where cid=?";

    //결제 정보
    final static String PAYMENT_SELECT_LIST ="select * from payment order by sno desc";
    final static String PAYMENT_SELECT_ONE ="select * from payment where sno=?";
    final static String PAYMENT_SELECT_CID ="select * from payment where cid=?";

    //리뷰 기능
    final static String REVIEW_INSERT = "insert into review values (default, ?, ?, ?, ?, default)";
    final static String REVIEW_SELECT_PNO = "select * from review where sno in (select sno from payment where pno=?)";
    final static String REVIEW_SELECT_LIST= "select * from review order by resdate desc";
    final static String REVIEW_DELETE = "delete from review where rno=?";

    //Api 테스트
    final static String TEST_SELECT_ONE = "select * from test where no=?";
    final static String TEST_SELECT_ALL = "select * from test";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
