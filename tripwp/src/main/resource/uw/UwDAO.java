package uw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UwDAO {
	private Connection conn;
	private ResultSet rs;
	
	public UwDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID="root";
			String dbPassword="4563";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace(); //오류출력 
		}
	} //데이터베이스 연결
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
		String SQL="select uwID from uw order by uwID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1; //첫 번째 게시물일 때
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int countUpdate(int uwCount, int uwID) {
		String SQL="update uw set uwCount =? where uwID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, uwCount);
			pstmt.setInt(2, uwID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int write(String uwTitle, String userID, String uwContent, int uwCount) {
		String SQL="insert into UW values(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, uwTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, uwContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, uwCount);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<Uw> getList(int pageNumber){
		String SQL="select * from UW where uwID < ? and uwAvailable=1 order by uwID desc limit 5";
		ArrayList<Uw> list= new ArrayList<Uw>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*5);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Uw uw =new Uw();
				uw.setUwID(rs.getInt(1));
				uw.setUwTitle(rs.getString(2));
				uw.setUserID(rs.getString(3));
				uw.setUwDate(rs.getString(4));
				uw.setUwContent(rs.getString(5));
				uw.setUwAvailable(rs.getInt(6));
				uw.setUwCount(rs.getInt(7));
				list.add(uw);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	public boolean nextPage(int pageNumber) {
		String SQL="select * from UW where uwID < ? and uwAvailable=1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*5);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	public Uw getUw(int uwID) {
		String SQL="select * from UW where uwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, uwID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Uw uw =new Uw();
				uw.setUwID(rs.getInt(1));
				uw.setUwTitle(rs.getString(2));
				uw.setUserID(rs.getString(3));
				uw.setUwDate(rs.getString(4));
				uw.setUwContent(rs.getString(5));
				uw.setUwAvailable(rs.getInt(6));
				int uwCount=rs.getInt(7);
				uw.setUwCount(uwCount);
				uwCount++;
				countUpdate(uwCount, uwID);
				return uw;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	public int update(int uwID, String uwTitle, String uwContent) {
		String SQL="update UW set uwTitle= ?, uwContent= ? where uwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, uwTitle);
			pstmt.setString(2, uwContent);
			pstmt.setInt(3, uwID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int uwID) {
		String SQL="update UW set uwAvailable = 0 where uwID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, uwID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}