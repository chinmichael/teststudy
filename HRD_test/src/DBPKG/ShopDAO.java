package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class ShopDAO {
	
	private ShopDAO() {
		
	}
	
	private static ShopDAO instance = new ShopDAO();
	
	public static ShopDAO getInstance() {
		return instance;
	}
	
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "kosea3";
		String pw = "kosea2019a";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url, id, pw);
		
		return con;
	}
	
	public int showNo () {
		
		int result = 0;
		String query = "select custno from (select custno from member_tbl_02 order by custno desc) where rownum = 1";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				result = rs.getInt("custno") + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public int insertMember(MemberVO mvo) {
		
		int result = 0;
		
		String query = "insert into member_tbl_02 values (?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, mvo.getCustno());
			pstmt.setString(2, mvo.getCustname());
			pstmt.setString(3, mvo.getPhone());
			pstmt.setString(4, mvo.getAddress());
			pstmt.setString(5, mvo.getJoindate());
			pstmt.setString(6, mvo.getGrade());
			pstmt.setString(7, mvo.getCity());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public Vector<MemberVO> printList() {
		
		Vector<MemberVO> list = new Vector<MemberVO>();
		
		String query = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') \"joindate\", grade, city from member_tbl_02";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
			int custno = rs.getInt("custno");
			String custname = rs.getString("custname");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			String joindate = rs.getString("joindate");
			String grade = rs.getString("grade");
			String city = rs.getString("city");
			
			MemberVO mv = new MemberVO(custno, custname, phone, address, joindate, grade, city);
			
			list.add(mv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public MemberVO memberInfo(int custno) {
		
		MemberVO mv = new MemberVO();
		
		String query = "select custname, phone, address, to_char(joindate, 'yyyy-mm-dd') \"joindate\", grade, city from member_tbl_02 where custno = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, custno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String joindate = rs.getString("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				
				mv = new MemberVO(custno, custname, phone, address, joindate, grade, city);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
		public int updateMember(MemberVO mvo) {
		
		int result = 0;
		
		String query = "update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, mvo.getCustname());
			pstmt.setString(2, mvo.getPhone());
			pstmt.setString(3, mvo.getAddress());
			pstmt.setString(4, mvo.getGrade());
			pstmt.setString(5, mvo.getCity());
			pstmt.setInt(6, mvo.getCustno());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
		
		public Vector<SellVO> printSell() {
			
			Vector<SellVO> list = new Vector<SellVO>();
			
			String query = "select a.custno, custname, grade, sum(price) from member_tbl_02 b, money_tbl_02 a where a.custno = b.custno group by a.custno, custname, grade order by sum(price) desc";
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				
				while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int sale = rs.getInt("sum(price)");

				
				SellVO sv = new SellVO(custno, custname, grade, sale);
				
				list.add(sv);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			
			} finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			return list;
		}
}
