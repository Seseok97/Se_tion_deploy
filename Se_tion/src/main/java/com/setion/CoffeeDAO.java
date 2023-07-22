package com.setion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CoffeeDAO {
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
	
	public void setData(CoffeeDTO dto) {
		try {
			con = getCon();
			sql="insert into setion_coffee (date,bean_country,bean_info,bean_process,bean_process_detail,grind_method,grind_click,brew_method,brew_info,tasting_result,tasting_info)"
					+ " values(now(),?,?,?,?,?,?,?,?,?,?)";
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBean_country());
			pstmt.setString(2, dto.getBean_info());
			pstmt.setString(3, dto.getBean_process());
			pstmt.setString(4, dto.getBean_process_detail());
			pstmt.setString(5, dto.getGrind_method());
			pstmt.setString(6, dto.getGrind_click());
			pstmt.setString(7, dto.getBrew_method());
			pstmt.setString(8, dto.getBrew_info());
			pstmt.setString(9, dto.getTasting_result());
			pstmt.setString(10, dto.getTasting_info());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO: 정보입력 정상작동.");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}// t-c-f end
//		System.out.println("dto:"+ dto);
		
	}// setData() method end
	
	// 게시글의 수를 리턴하는 메서드
		public int getBoardCount() {
			int result = 0;
			try {
				con = getCon();
				String sql = "select count(*) from setion_coffee";
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
					= "select * from setion_coffee"
							+ " order by id desc limit ?,?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow -1);
				pstmt.setInt(2, pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CoffeeDTO dto = new CoffeeDTO();
					dto.setBean_country(rs.getString("bean_country"));
					dto.setBean_info(rs.getString("bean_info"));
					dto.setBean_process(rs.getString("bean_process"));
					dto.setBean_process_detail(rs.getString("bean_process_detail"));
					dto.setGrind_method(rs.getString("grind_method"));
					dto.setGrind_click(rs.getString("grind_click"));
					dto.setBrew_method(rs.getString("brew_method"));
					dto.setBrew_info(rs.getString("brew_info"));
					dto.setTasting_result(rs.getString("tasting_result"));
					dto.setTasting_info(rs.getString("tasting_info"));
					dto.setDate(rs.getDate("date"));
					dto.setId(rs.getInt("id"));
					
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
		public CoffeeDTO getBoard(int id) {
			CoffeeDTO dto = null;
			try {
				con = getCon();
				sql = "select * from setion_coffee where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new CoffeeDTO();
					dto.setBean_country(rs.getString("bean_country"));
					dto.setBean_info(rs.getString("bean_info"));
					dto.setBean_process(rs.getString("bean_process"));
					dto.setBean_process_detail(rs.getString("bean_process_detail"));
					dto.setGrind_method(rs.getString("grind_method"));
					dto.setGrind_click(rs.getString("grind_click"));
					dto.setBrew_method(rs.getString("brew_method"));
					dto.setBrew_info(rs.getString("brew_info"));
					dto.setTasting_result(rs.getString("tasting_result"));
					dto.setTasting_info(rs.getString("tasting_info"));
					dto.setDate(rs.getDate("date"));
					dto.setId(rs.getInt("id"));
					
					System.out.println("DAO: dto에 "+id+"번 글 정보 저장 완료!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}// tcf end
			return dto;
		}// getBoard() method end
		
		// 업데이트
		public int coffeeUpdate(CoffeeDTO dto) {
			int result=0;
			try {
				con = getCon();
				sql="UPDATE setion_coffee "
						+ "SET bean_country=?, "
						+ "bean_info=?, "
						+ "bean_process=?, "
						+ "bean_process_detail=?, "
						+ "grind_method=?, "
						+ "grind_click=?, "
						+ "brew_method=?, "
						+ "brew_info=?, "
						+ "tasting_result=?, "
						+ "tasting_info=? "
						+ "WHERE id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getBean_country());
				pstmt.setString(2, dto.getBean_info());
				pstmt.setString(3, dto.getBean_process());
				pstmt.setString(4, dto.getBean_process_detail());
				pstmt.setString(5, dto.getGrind_method());
				pstmt.setString(6, dto.getGrind_click());
				pstmt.setString(7, dto.getBrew_method());
				pstmt.setString(8, dto.getBrew_info());
				pstmt.setString(9, dto.getTasting_result());
				pstmt.setString(10, dto.getTasting_info());
				pstmt.setInt(11, dto.getId());
				
				result = pstmt.executeUpdate();
				
				System.out.println(dto.getId()+"번 기록 수정.");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}// tcf end
			System.out.println(result +": 수정 성공 > 1");
			return result;
		}//coffeeUpdate() method end
		
		public int coffeeDelete(String id) {
			int result = 0;
			try {
				int id2 = Integer.parseInt(id);
				con = getCon();
				sql="DELETE FROM setion_coffee WHERE id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, id2);
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}// tcf end
			System.out.println("result = 1인 경우 성공. result = "+result);
			return result;
		}// coffeeDelete() method end

}// CoffeeDAO class end


































