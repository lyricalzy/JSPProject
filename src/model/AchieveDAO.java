package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AchieveDAO {
	private String sql;
	private PreparedStatement ps;
	private Connection con;
	private DBConnectionMgr mgr;
	private ResultSet rs;

	public AchieveDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public ArrayList<AchieveDTO> selectPage(AchievePageDTO pdto) {
		ArrayList<AchieveDTO> list = new ArrayList<>();
		AchieveDTO dto = null;
		try {
			con = mgr.getConnection();
			sql = "select * from achieve order by id desc limit ?, ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, (pdto.getPage() - 1) * pdto.getCountList());
			ps.setInt(2, pdto.getCountList());
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new AchieveDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTime(rs.getString(4));
				dto.setContent(rs.getString(5));
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectPage 오류!");

		}

		return list;
	}

	public AchieveDTO select(AchieveDTO dto) {
		AchieveDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			sql = "select * from achieve where id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new AchieveDTO();
				dto2.setId(rs.getInt(1));
				dto2.setTitle(rs.getString(2));
				dto2.setName(rs.getString(3));
				dto2.setTime(rs.getString(4));
				dto2.setContent(rs.getString(5));
			}
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	}

	public int insert(AchieveDTO dto) {
		int result = 0;
		// 매개변수(파라메터, parameter), 지역변수
		try {
			con = mgr.getConnection();
			// 3) sql문 결정

			sql = "insert into achieve values (?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTime());
			ps.setString(5, dto.getContent());

			// 4) sql문 전송
			result = ps.executeUpdate();

			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(AchieveDTO dto) {
		int result = 0;
		// 매개변수(파라메터, parameter), 지역변수
		try {
			con = mgr.getConnection();
			// 3) sql문 결정

			sql = "delete from achieve where id = ?";
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
			sql = "select count(*) as cnt from achieve";
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
