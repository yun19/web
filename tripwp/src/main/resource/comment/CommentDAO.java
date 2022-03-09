package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class CommentDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID="root";
			String dbPassword="4563";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace(); //오류출력 
		}
	}
	public String getDate() {
		String SQL="select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		String SQL="select commentID from comment order by commentID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1; //첫 번째 댓글일 때
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<Comment> getList(int uwID){
		String SQL="select * from comment where uwID = ? and commentAvailable=1 order by uwID desc";
		ArrayList<Comment> list= new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, uwID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentID(rs.getInt(1));
				cmt.setUwID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentDate(rs.getString(4));
				cmt.setCommentText(rs.getString(5));
				cmt.setCommentAvailable(rs.getInt(6));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	public Comment getComment(int commentID) {
		String SQL="select * from comment where commentID = ? order by commentID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Comment cmt = new Comment();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setUwID(rs.getInt(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setCommentText(rs.getString(6));
				cmt.setCommentAvailable(rs.getInt(7));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	public int write(int uwID, String userID, String commentText) {
		String SQL="insert into comment values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, uwID);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, commentText);
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int update(int commentID, String commentText) { //댓글수정
		String SQL="update commet set commentText= ? where commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentText);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int commentID) {   //댓글 삭제
		String SQL="delete from comment where commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
