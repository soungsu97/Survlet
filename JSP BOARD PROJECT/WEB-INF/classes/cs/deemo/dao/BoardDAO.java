package cs.deemo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cs.deemo.dto.BoardDTO;

public class BoardDAO {
	private DataSource ds;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public ArrayList<BoardDTO> list(){
		String sql = "SELECT * FROM BOARD";
		
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {		
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getString("no"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContext(rs.getString("context"));
				dto.setRegdate(rs.getDate("regdate"));
				dtos.add(dto);		
			}
			rs.close(); pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dtos;
	}
	
	public BoardDTO view(String no) {
		String sql ="select title, writer, context, regdate from board where no=?";
		BoardDTO dto = new BoardDTO();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {		//상세보기를 위한 한 레코드셋을 DTO에 저장
				dto.setNo(no);
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContext(rs.getString("context"));
				dto.setRegdate(rs.getDate("regdate"));
			}
			
			rs.close();
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;	//DTO객체에 데이터를 담아서 반환
	}
	
	public boolean insert(BoardDTO dto) {	//DB에 저장이 잘되면 true, 잘안되었으면  false를 반환
		String sql = "insert into board(no, title, writer, context, regdate) values (board_ai.NEXTVAL,?,?,?,sysdate)"; 
		boolean check = false;
		try {  
			con = ds.getConnection();  //Connection객체 CP에서 얻어오기
			this.pstmt =con.prepareStatement(sql);  	//Connection객체를 통해 SQL문 준비
			this.pstmt.setString(1, dto.getTitle());
			this.pstmt.setString(2, dto.getWriter());
			this.pstmt.setString(3, dto.getContext());

			
			int x = pstmt.executeUpdate();	//SQL을 수행하고 결과 반환 : 결과는 입력이 된 행 갯수

			if(x<1) {	//1보다 적으면
				System.out.println("정상적으로 저장되지 않았습니다.");
			}else {		//1이상인 경우는 저장이 된 경우
				check=true;
			}
			pstmt.close();
		}catch(SQLException ex) {
			System.out.println("SQL insert 오류 : " + ex.getLocalizedMessage());
			check = false;
		}
		return check;
	}
	
	public boolean delete(String no) {
	    String sql = "delete from board where no=?";
	    boolean check = false;
	    try {
	      this.con = this.ds.getConnection();
	      this.pstmt = this.con.prepareStatement(sql);
	      this.pstmt.setString(1, no);
	      int x = this.pstmt.executeUpdate();
	      if (x < 1) {
	        System.out.println("삭제 실패");
	      } else {
	        check = true;
	      } 
	      this.pstmt.close();
	    } catch (SQLException ex) {
	      System.out.println("SQL insert : " + ex.getLocalizedMessage());
	      check = false;
	    } 
	    return check;
	  }
	  
	  public boolean update(BoardDTO dto) {
	    String sql = "update board set title=?, context=? where no=?";
	    boolean check = false;
	    try {
	      this.con = this.ds.getConnection();
	      this.pstmt = this.con.prepareStatement(sql);
	      this.pstmt.setString(1, dto.getTitle());
	      this.pstmt.setString(2, dto.getContext());
	      this.pstmt.setString(3, dto.getNo());
	      int x = this.pstmt.executeUpdate();
	      if (x < 1) {
	        System.out.println("수정 실패");
	      } else {
	        check = true;
	      } 
	      this.pstmt.close();
	    } catch (SQLException ex) {
	      System.out.println("SQL insert : " + ex.getLocalizedMessage());
	      check = false;
	    } 
	    return check;
	  }
	  
	  public int getCount(){
			int count = 0;
			String sql = "select count(*) from board";
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return count; // 총 레코드 수 리턴
		}
}
