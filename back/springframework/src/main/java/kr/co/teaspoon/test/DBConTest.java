package kr.co.teaspoon.test;

import java.sql.*;


public class DBConTest {
    static Connection con = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        JDBCConn db = new JDBCConn();
        con = db.connect();
        try {
            pstmt = con.prepareStatement("select * from sample");
            rs = pstmt.executeQuery();
            while(rs.next()){
                System.out.println(rs.getInt("no"));
                System.out.println(rs.getString("name"));
            }
            db.close(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
