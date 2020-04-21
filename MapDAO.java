package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MapDAO {
	private String sql;
	private PreparedStatement ps;
	private Connection con;
	private DBConnectionMgr mgr;
	private ResultSet rs;

	public MapDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public ArrayList<SangDTO> selectAll() {
		ArrayList<SangDTO> list = new ArrayList<>();
		SangDTO dto = null;
		try {
			con = mgr.getConnection();
			sql = "select * from sang";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new SangDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setGiant(rs.getString(3));
				dto.setBig(rs.getString(4));
				dto.setMiddle(rs.getString(5));
				dto.setSmall(rs.getString(6));
				dto.setSido(rs.getString(7));
				dto.setGugun(rs.getString(8));
				dto.setLongtitude(rs.getString(9));
				dto.setLatitude(rs.getString(10));
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectPage 오류!");

		}

		return list;
	}

	public ArrayList<SangDTO> selectBig(String big) {
		ArrayList<SangDTO> list = new ArrayList<>();
		SangDTO dto = null;
		try {
			con = mgr.getConnection();
			sql = "select title, longtitude, latitude from sang where big = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, big);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new SangDTO();
				dto.setTitle(rs.getString(1));
				dto.setLongtitude(rs.getString(2));
				dto.setLatitude(rs.getString(3));
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
