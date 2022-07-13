package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MovieDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MovieDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MovieDTO> getMovie() { // 저장된거 전체 가져오기
		
		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
		
		String sql = "select * from movie";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				MovieDTO dto = new MovieDTO();
				dto.setM_name( rs.getString("m_name") );
				dto.setHit( rs.getInt("hit") );
				dto.setGrade( rs.getFloat("grade") );
				dto.setStory( rs.getString("story") );
				dto.setGenre( rs.getString("genre") );
				dto.setAge( rs.getString("age") );
				dto.setImg( rs.getString("img") );
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
