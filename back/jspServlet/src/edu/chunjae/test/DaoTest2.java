package edu.chunjae.test;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.DBConnect;
import edu.chunjae.model.PostgreCon;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoTest2 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static Statement stmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        Notice noti = new Notice();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "select * from notice where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, 5);
            rs = pstmt.executeQuery();

            if(rs.next()){
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisited(rs.getInt("visited"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        System.out.println(noti.toString());
    }
}
