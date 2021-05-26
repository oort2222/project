package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.JDBC;
import vo.gradeVO;

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
	public ArrayList<resultVO> result(){
		ArrayList<resultVO> result = null;
		try {
			conn=JDBC.getConn();
			String sql  = "select p.membernum, p.member, round((math+eng+lang)/ 3,0)  result " + 
					"from grade g, p_result p " + 
					"where p.membernum = g.membernum and p.member = g.member " + 
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
}
