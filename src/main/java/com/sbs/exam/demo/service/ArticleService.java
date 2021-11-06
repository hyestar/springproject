package com.sbs.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sbs.exam.demo.repository.ArticleRepository;
import com.sbs.exam.demo.resultdata.ResultData;
import com.sbs.exam.demo.util.Ut;
import com.sbs.exam.demo.vo.Article;

@Service
public class ArticleService {
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public ResultData<Integer> writeArticle(int memberId, String title, String body) {

		articleRepository.writeArticle(memberId, title, body);
		int id = articleRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id),"id", id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public ResultData<Article> modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
		Article article = getArticle(id);
		return ResultData.from("S-1", Ut.f("%d번 게시물을 수정하였습니다.", id), "article", article);
	}

}
