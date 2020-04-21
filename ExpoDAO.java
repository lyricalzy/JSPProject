package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExpoDAO {
	private String sql;
	private PreparedStatement ps;
	private Connection con;
	private DBConnectionMgr mgr;
	private ResultSet rs;

	public ExpoDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public ArrayList<ExpoDTO> selectPage(ExpoPageDTO pdto) {
		ArrayList<ExpoDTO> list = new ArrayList<>();
		ExpoDTO dto = null;
		try {
			con = mgr.getConnection();
			String sql = "select * from expo order by id desc limit ?, ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, (pdto.getPage() - 1) * pdto.getCountList());
			ps.setInt(2, pdto.getCountList());
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new ExpoDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setPlace(rs.getString(3));
				dto.setWhen(rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setName(rs.getString(6));
				dto.setBrand(rs.getString(7));
				dto.setHome(rs.getString(8));
				dto.setTime(rs.getString(9));
				dto.setContent(rs.getString(10));
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectPage 오류!");

		}

		return list;
	}

	public ExpoDTO select(ExpoDTO dto) {
		ExpoDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			sql = "select * from expo where id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());

			// 4) sql문 전송
			rs = ps.executeQuery();

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new ExpoDTO();
				dto2.setId(rs.getInt(1));
				dto2.setTitle(rs.getString(2));
				dto2.setPlace(rs.getString(3));
				dto2.setWhen(rs.getString(4));
				dto2.setTel(rs.getString(5));
				dto2.setName(rs.getString(6));
				dto2.setBrand(rs.getString(7));
				dto2.setHome(rs.getString(8));
				dto2.setTime(rs.getString(9));
				dto2.setContent(rs.getString(10));
			}
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	}

	public int insert(ExpoDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정

			sql = "insert into expo values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getPlace());
			ps.setString(4, dto.getWhen());
			ps.setString(5, dto.getTel());
			ps.setString(6, dto.getName());
			ps.setString(7, dto.getBrand());
			ps.setString(8, dto.getHome());
			ps.setString(9, dto.getTime());
			ps.setString(10, dto.getContent());

			// 4) sql문 전송
			result = ps.executeUpdate();

			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(ExpoDTO dto) {
		int result = 0;
		// 매개변수(파라메터, parameter), 지역변수
		try {
			con = mgr.getConnection();
			// 3) sql문 결정

			sql = "delete from expo where id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());

			// 4) sql문 전송
			result = ps.executeUpdate();

			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int countRow() {
		int result = 0;
		try {
			con = mgr.getConnection();
			sql = "select count(*) as cnt from expo";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			mgr.freeConnection(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("countRow 에러가 있습니다.");
		}

		return result;
	}

}
