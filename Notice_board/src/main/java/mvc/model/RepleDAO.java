package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class RepleDAO {

	 private static RepleDAO instance;

	    private RepleDAO() {

	    }
	    
	    public static RepleDAO getInstance() {
	        if (instance == null)
	            instance = new RepleDAO();
	        return instance;
	    }

	    
	    
	    

	// 댓글 가져오는 메서드
	public ArrayList<RepleDTO> getRepleList(int replenum) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
	
	    String sql;
	    sql = "select * from reple where replenum=?";
	
	    ArrayList<RepleDTO> list = new ArrayList<RepleDTO>();
	
	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	        pstmt.setInt(1, replenum);
	        rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	            RepleDTO reple = new RepleDTO();
	            reple.setNum(rs.getInt("num"));
	            reple.setReplenum(rs.getInt("replenum"));
	            reple.setId(rs.getString("id"));
	            reple.setReple(rs.getString("reple"));
	            reple.setRegist_day(rs.getString("regist_day"));
	            
	            list.add(reple);
	
	            System.out.println("1");
	        }
	        return list;
	    } catch (Exception ex) {
	        System.out.println("getRepleList() 에러 : " + ex);
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (pstmt != null)
	                pstmt.close();
	            if (conn != null)
	                conn.close();
	        } catch (Exception ex) {
	            throw new RuntimeException(ex.getMessage());
	        }
	    }
	    return null;
	}
	// 댓글 작성하는 메서드
	public void insertReple(RepleDTO reple) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "insert into reple values(?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, reple.getNum());
            pstmt.setInt(2, reple.getReplenum());
            pstmt.setString(3, reple.getId());
            pstmt.setString(4, reple.getReple());
            pstmt.setString(5, reple.getRegist_day());

            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("insertReple() 에러 : " + ex);
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception ex) {
                throw new RuntimeException(ex.getMessage());
            }
        }
    }
	
    
    // 선택된 댓글을 삭제하는 메서드
    public void deleteBoard(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "delete from board where num=?";

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();

        } catch (Exception ex) {
            System.out.println("deleteBoard() 에러 : " + ex);
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception ex) {
                throw new RuntimeException(ex.getMessage());
            }
        }
    }
	
}

