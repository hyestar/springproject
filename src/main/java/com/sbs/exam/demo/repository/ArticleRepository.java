package com.sbs.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sbs.exam.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	public void writeArticle(@Param("memberId") int memberId, @Param("boardId") int boardId, @Param("title") String title, @Param("body") String body);

	@Select("""
			<script>
			SELECT A.*,
			M.nickname AS extra__writerName,
			IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
			IFNULL(SUM(IF(RP.point &gt; 0, RP.point, 0)),0) AS extra__goodReactionPoint,
			IFNULL(SUM(IF(RP.point &lt; 0, RP.point, 0)),0) AS extra__badReactionPoint
			FROM article AS A
			LEFT JOIN member AS M
			ON A.memberId = M.id
			LEFT JOIN reactionPoint AS RP
			ON RP.relTypeCode = 'article'
			AND A.id = RP.relId
			WHERE 1
			AND A.id = #{id}
			GROUP BY A.id
			</script>
			""")
	public Article getForPrintArticle(@Param("id") int id);

	public void deleteArticle(@Param("id") int id);

	public void modifyArticle(@Param("id") int id, @Param("title") String title, @Param("body") String body);

	public List<Article> getForPrintArticles(int boardId, String searchKeywordTypeCode, String searchKeyword,
			int limitStart, int limitTake);

	public int getLastInsertId();
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);
	
	@Update("""
			<script>
			UPDATE article
			SET hitCount = hitCount + 1
			WHERE id = #{id}
			</script>
			""")
	public int increaseHitCount(int id);
	
	@Select("""
			<script>
			SELECT hitCount
			FROM article
			WHERE id = #{id}
			</script>
			""")
	public int getArticleHitCount(int id);
}
