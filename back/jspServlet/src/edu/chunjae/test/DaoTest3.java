package edu.chunjae.test;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.DBConnect;
import edu.chunjae.model.PostgreCon;

import java.sql.*;

public class DaoTest3 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static Statement stmt = null;

    public static void main(String[] args) {
        Notice noti = new Notice();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "insert into notice values(default,?,?,default,default)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "DAO테스트1");
            pstmt.setString(2, "DAO테스트내용입니다.1");
            int cnt = pstmt.executeUpdate();
            if(cnt>0){
                System.out.println("1건의 레코드가 추가되었습니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }
}
