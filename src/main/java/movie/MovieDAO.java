package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	public ArrayList<MovieDTO> list() { 
		// 데이터 베이스 저장된거 전체 가져오기
		// 평점순으로 정렬
		
		ArrayList<MovieDTO> li = new ArrayList<MovieDTO>();
		
		String sql = "select * from movie order by grade desc";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				li.add( getMovie() );
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	
	public ArrayList<MovieDTO> hitList() {
		// 데이터 베이스 저장된거 전체 가져오기
		// 조회순으로 정렬
		
		String sql = "select * from movie order by hit desc"; 
		
		ArrayList<MovieDTO> hli = new ArrayList<MovieDTO>();
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				hli.add(getMovie());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hli;
	}
	
	private MovieDTO getMovie() {
		MovieDTO dto = new MovieDTO();
		
		try {
			
			dto.setM_name( rs.getString("m_name") );
			dto.setHit( rs.getInt("hit") );
			dto.setGrade( rs.getFloat("grade") );
			dto.setStory( rs.getString("story") );
			dto.setGenre( rs.getString("genre") );
			dto.setAge( rs.getString("age") );
			dto.setImg( rs.getString("img") );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	

	private void upHit(String m_name) {
		// 클릭할때 조회수 올리기 
		String sql = "update movie set hit=hit+1 where m_name='"+m_name+"'";
		
		try {
			ps= con.prepareStatement(sql);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MovieDTO getInfo(String m_name) {
		// 영화 상세페이지에서 영화이름에 해당하는 정보 불러오기
		upHit(m_name);
		
		String sql = "select * from movie where m_name='"+m_name+"'";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if( rs.next() ) {
				return getMovie();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public void update(MovieDTO dto) {
		// 영화 정보 수정
		
		String sql = "update movie set story=?, genre=?, age=? where m_name=?";
		
		System.out.println(dto.getGenre());
		System.out.println(dto.getStory());
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getStory());
			ps.setString(2, dto.getGenre());
			ps.setString(3, dto.getAge());
			ps.setString(4, dto.getM_name());
			
			ps.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String m_name) {
		// 영화 삭제 
		
		String sql = "delete from movie where m_name='"+m_name+"'";
		
		try {
			ps = con.prepareStatement(sql);
			ps.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void movieSave(ArrayList<MovieDTO> list) {
		String sql = "insert into movie(grade, hit, m_name,story,genre,age,img) values(0, 0, ?, ?, ?, ?, ?)";
		
		for(MovieDTO dto : list) {
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getM_name());
				ps.setString(2, dto.getStory());
				ps.setString(3, dto.getGenre());
				ps.setString(4, dto.getAge());
				ps.setString(5, dto.getImg());
				ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<MovieDTO> getTopMovie() {
		String sql = "select * from movie where rownum between 1 and 30 order by hit desc";
		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(getMovie());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MovieDTO> getSearch(String word) {
		String sql = "select * from movie where m_name like ?";
		ArrayList<MovieDTO> list = new ArrayList<>();
		try {
			if(!word.equals("")) {
				ps = con.prepareStatement(sql);
				ps.setString(1, "%" + word + "%");
				rs = ps.executeQuery();
				while(rs.next()) {
					list.add( getMovie() );
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MovieDTO> getMovieList() {
		// 영화 홈 조회수 순위 10개 가져오기 
		
		String sql = "select * from movie where rownum between 1 and 10 order by hit desc";
		ArrayList<MovieDTO> mli = new ArrayList<MovieDTO>();
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				mli.add(getMovie());
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mli;
	}

}
