package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class ReviewDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public ReviewDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	public String rNum() {
		//리뷰 번호 1씩 증가하여 가져오기
		String sql = "select nvl(max(num)+1, 1) as r1 from review";
		String num = null;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				num = rs.getString("r1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	public ArrayList<ReviewDTO> list(){
		//번호 높은 순으로 정렬
		String sql =
				"select * from review order by num desc";
		ArrayList<ReviewDTO> li = new ArrayList<ReviewDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getReview());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	private ReviewDTO getReview() {
		//리뷰 가져오기
		ReviewDTO dto = new ReviewDTO();
		try {
			dto.setNum(rs.getInt("num"));
			dto.setM_name(rs.getString("m_name"));
			dto.setId(rs.getString("id"));
			dto.setTime(rs.getString("time"));
			dto.setR_grade(rs.getFloat("r_grade"));
			dto.setContent(rs.getString("content"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void insert(ReviewDTO dto) {
		//리뷰 등록
		String sql = 
				"insert into review (num, m_name, id, time, r_grade, content)"+
						"values(?,?,?,sysdate,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getM_name());
			ps.setString(3, dto.getId());
			ps.setFloat(4, dto.getR_grade());
			ps.setString(5, dto.getContent());
			ps.executeUpdate();
			avgGrade(dto.getM_name());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void avgGrade(String m_name) {
		//리뷰 테이블에 저장된 평점 평균값을 구해서 영화 테이블 grade에 저장하기
		String sql = "update movie set grade=(select round(avg(r_grade), 1) from (select * from review where m_name=?) group by m_name) where m_name=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, m_name);
			ps.setString(2, m_name);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ReviewDTO getInfo(String num) {
		//리뷰 번호에 해당하는 모든 정보 가져오기
		ReviewDTO dto = new ReviewDTO();
		String sql =
				"select * from review where num = '"+num+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setM_name(rs.getString("m_name"));
				dto.setId(rs.getString("id"));
				dto.setTime(rs.getString("time"));
				dto.setR_grade(rs.getFloat("r_grade"));
				dto.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void update(ReviewDTO dto) {
		//수정 내용 DB 업데이트
		String sql = "update review set r_grade=?, content=? where num=?";
		System.out.println(dto.getNum());
		System.out.println(dto.getR_grade());
		System.out.println(dto.getContent());
		try {
			ps = con.prepareStatement(sql);
			ps.setFloat(1, dto.getR_grade());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNum());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delete(String num) {
		//리뷰 번호에 해당하는 정보 모두 삭제
		String sql = "delete from review where num="+num;
		
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<ReviewDTO> MyIn(String id) {
		//해당 id의 정보 가져오기
		String sql = "select * from review where id='"+id+"' order by num desc";
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setM_name(rs.getString("m_name"));
				dto.setId(rs.getString("id"));
				dto.setTime(rs.getString("time"));
				dto.setR_grade(rs.getFloat("r_grade"));
				dto.setContent(rs.getString("content"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
