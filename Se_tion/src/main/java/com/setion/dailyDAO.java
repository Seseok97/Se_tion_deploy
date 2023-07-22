package com.setion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class dailyDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// DB연결 메서드
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext(); 
		DataSource ds
			= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		
		System.out.println("DAO: DB연결 성공!!  con: "+ con);
		return con;
	}// getCon() method end
	
	// DB 자원 해제
	public void closeDB() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null ) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}// closeDB() method end
	
	public void setData(dailyDTO dto) {
		try {
			con = getCon();
			sql="insert into setion (one,two,three,four,five,date)"
					+ " values(?,?,?,?,?,now())";
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getOne());
			pstmt.setString(2, dto.getTwo());
			pstmt.setString(3, dto.getThree());
			pstmt.setString(4, dto.getFour());
			pstmt.setString(5, dto.getFive());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO: 정보입력 정상작동.");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}// t-c-f end
		
	}// setData() method end
	
	public int dayCheck() {
		int result = 0; // 가능
		try {
			con = getCon();
			sql="select date from setion where date=now()";
			pstmt= con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
//			if(rs.getDate("date") == null) {
//				result=1; // 불가능
//			}
			System.out.println("DAO: dayChedk() 정상작동! : "+result);
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}// t-c-f end
		return 1;
	}// dayCheck() method end
	
	// 게시글의 수를 리턴하는 메서드
		public int getBoardCount() {
			int result = 0;
			try {
				con = getCon();
				String sql = "select count(*) from setion";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
					// 글이 없는 게시판의 경우, count(*)은 0을 반환한다.
					System.out.println("DAO: 전체 글 개수 = "+result);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return result;
		}//getBoardCount() method end
		
		//게시판 목록 가져오기
		public ArrayList getBoardList(int startRow, int pageSize) {
			ArrayList boardList = new ArrayList(); 
			try {
				// connection pool
				con = getCon();
				String sql
					= "select * from setion"
							+ " order by id desc limit ?,?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow -1);
				pstmt.setInt(2, pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dailyDTO dto = new dailyDTO();
					dto.setId(rs.getInt("id"));
					dto.setOne(rs.getString("one"));
					dto.setTwo(rs.getString("two"));
					dto.setThree(rs.getString("three"));
					dto.setFour(rs.getString("four"));
					dto.setFive(rs.getString("five"));
					dto.setDate(rs.getDate("date"));
					
					boardList.add(dto);
				}// while end
				System.out.println("DAO: 게시판 글 정보 저장 완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			} // t - c - f end
			return boardList;
		}// getBoardList() method end
		
		// 내용 가져오기
		public dailyDTO getBoard(int id) {
			dailyDTO dto = null;
			try {
				con = getCon();
				sql = "select * from setion where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new dailyDTO();
					dto.setId(rs.getInt("id"));
					dto.setOne(rs.getString("one"));
					dto.setTwo(rs.getString("two"));
					dto.setThree(rs.getString("three"));
					dto.setFour(rs.getString("four"));
					dto.setFive(rs.getString("five"));
					dto.setDate(rs.getDate("date"));
					
					System.out.println("DAO: dto에 "+id+"번 글 정보 저장 완료!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}// tcf end
			return dto;
		}// getBoard() method end

}// dailyDAO class end