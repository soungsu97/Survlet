package cs.deemo.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CommentDAO {
	private DataSource ds;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/DEEMO");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(con !=null) {
				con.close();
				con=null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void register(String cboard, String ccontent, String cid) {
		String sql = "insert into b_comment(cnum, cboard, cid, cdate, ccontent) values(comment_ai.nextval,?,?,sysdate, ?)";
		
		try {
			con = ds.getConnection();  
			pstmt = con.prepareStatement(sql);  	
			pstmt.setString(1, cboard);	
			pstmt.setString(2, cid);	
			pstmt.setString(3, ccontent);
			int x = pstmt.executeUpdate();	//SQL을 수행하고 결과 반환 : 결과는 입력이 된 행 갯수

			if(x<1) {	//1보다 적으면
				System.out.println("정상적으로 저장되지 않았습니다.");
			}else {		//1이상인 경우는 저장이 된 경우
				System.out.println("저장 성공");
			}
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("CommentDAO.register(): SQL insert 오류 : " + e.getLocalizedMessage());
		}
	}
	
	public JSONArray rlist(String cboard) {
		String sql = "select * from b_comment where cboard = ? order by cnum desc";
		JSONArray list = new JSONArray();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cboard);
			rs = pstmt.executeQuery();
			
			System.out.println("list부분dao");
			while(rs.next()) {
				JSONObject json = new JSONObject();
				json.put("cnum", rs.getString("cnum") + "");
				json.put("cboard", rs.getString("cboard") + "");
				json.put("cid", rs.getString("cid") + "");
				json.put("cdate", rs.getDate("cdate") + "");
				json.put("ccontent", rs.getString("ccontent"));
				list.add(json);
				
			}rs.close();pstmt.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
