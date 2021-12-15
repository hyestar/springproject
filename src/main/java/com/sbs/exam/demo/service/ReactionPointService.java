package com.sbs.exam.demo.service;

import org.springframework.stereotype.Service;

import com.sbs.exam.demo.repository.ReactionPointRepository;
import com.sbs.exam.demo.resultdata.ResultData;

@Service
public class ReactionPointService {
	private ReactionPointRepository reactionPointRepository;
	private ArticleService articleService;

	public ReactionPointService(ReactionPointRepository reactionPointRepository, ArticleService articleService) {
		this.reactionPointRepository = reactionPointRepository;
		this.articleService = articleService;
	}

	public boolean actorCanMakeReactionPoint(int actorId, String relTypeCode, int relId) {
		if (actorId == 0) {
			return false;
		}

		return reactionPointRepository.getSumReactionPointByMemberId(relTypeCode, relId, actorId) == 0;
	}
	public ResultData addGoodReactionPoint(int actorId, String relTypeCode, int relId) {
		reactionPointRepository.addGoodReactionPoint(actorId, relTypeCode, relId);

		switch (relTypeCode) {
		case "article":
			articleService.increaseGoodReactionPoint(relId);
			break;
		}

		return ResultData.from("S-1", "좋아요 성공!");
	}

	public ResultData addBadReactionPoint(int actorId, String relTypeCode, int relId) {
		reactionPointRepository.addBadReactionPoint(actorId, relTypeCode, relId);

		switch (relTypeCode) {
		case "article":
			articleService.increaseBadReactionPoint(relId);
			break;
		}

		return ResultData.from("S-1", "싫어요 성공!");
	}
}
