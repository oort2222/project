package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JDBC;
import vo.gradeVO;
import vo.resultVO;

public class gradeDAO {
	private ResultSet rs;
	private PreparedStatement stmt;
	private Connection conn;
	public ArrayList<gradeVO> gradeLook(){
		ArrayList<gradeVO> grade = null;
		try {
			conn=JDBC.getConn();
			String sql = "select membernum,member,math,eng,lang " + 
					"from grade ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			grade = new ArrayList<gradeVO>();
			while(rs.next()) {
				gradeVO vo = new gradeVO();
				vo.setMember(rs.getString("member"));
				vo.setMembernum(rs.getString("membernum"));
				vo.setLang(rs.getInt("lang"));
				vo.setMath(rs.getInt("Math"));
				vo.setEng(rs.getInt("eng"));
				grade.add(vo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return grade;
	}
	public ArrayList<gradeVO> gradeRank(){
		ArrayList<gradeVO> grade1 = null;
		try {
			conn=JDBC.getConn();
			String sql = "select membernum, member, round((math+eng+lang)/ 3,0)  result " + 
					"from grade g " + 
					"order by membernum desc ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			grade1 = new ArrayList<gradeVO>();
			while(rs.next()) {
				gradeVO vo = new gradeVO();
				vo.setMember(rs.getString("member"));
				vo.setMembernum(rs.getString("membernum"));
				vo.setResult(rs.getInt("result"));
				grade1.add(vo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return grade1;
	}
	public ArrayList<resultVO> result(){
		ArrayList<resultVO> result = null;
		try {
			conn=JDBC.getConn();
			String sql  = "select p.membernum, p.member, round((math+eng+lang)/ 3,0)  result " + 
					"from grade g, p_result p " + 
					"where p.membernum(+) = g.membernum and p.member(+) = g.member " + 
					"order by membernum desc ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			result = new ArrayList<resultVO>();
			while(rs.next()) {
				resultVO vo = new resultVO();
				vo.setMembernum(rs.getString("membernum"));
				vo.setMember(rs.getString("member"));
				vo.setResult(rs.getInt("result"));
				result.add(vo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return result;
	}
	public int MaxNO() {
		int max = 0;
		try {
			conn = JDBC.getConn();
			String sql = "select nvl(max(membernum),0)+1 max " + 
					"from GRADE ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("max");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return max;
	}
	public int addMember(gradeVO vo) {
		int cnt = 0;
		try {
			conn = JDBC.getConn();
			String sql = "insert into grade values(?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getMembernum());
			stmt.setString(2, vo.getMember());
			stmt.setInt(3, vo.getLang());
			stmt.setInt(4, vo.getMath());
			stmt.setInt(5, vo.getEng());
			cnt = stmt.executeUpdate();
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			JDBC.close(stmt, conn);
		}
		return cnt;
	}
}