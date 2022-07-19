<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="movie.MovieDAO"%>
<%@page import="movie.MovieDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("갱신되었습니다.")
	location.href="/jsp_project/member/managementForm.jsp"
</script>
</head>
<body>
<%
		Document doc = Jsoup.connect("https://movie.naver.com/movie/running/current.naver").get();
		ArrayList<MovieDTO> list = new ArrayList<>();
		MovieDAO dao = new MovieDAO();
		
		Elements elements = doc.select(".lst_detail_t1 li");
		for(Element e : elements) {
			MovieDTO dto = new MovieDTO();
			String link = "https://movie.naver.com/movie" + e.select(".tit a").attr("href");
			Document doc2 = Jsoup.connect(link).get();
			
			String name = e.select(".tit a").text();
			String story = doc2.select(".story_area .con_tx ").text();
			String age = e.select(".tit span").text();
			String genre = e.select(".info_txt1 .link_txt").first().select("a").text();
			String img = e.select(".thumb img").attr("src");
			
			dto.setM_name(name);
			dto.setStory(story);
			dto.setAge(age);
			dto.setImg(img);
			dto.setGenre(genre);
			
			list.add(dto);
		}
		dao.movieSave(list);
	%>
</body>
</html>