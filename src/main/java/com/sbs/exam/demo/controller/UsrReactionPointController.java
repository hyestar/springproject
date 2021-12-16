package com.sbs.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.exam.demo.service.ReactionPointService;
import com.sbs.exam.demo.vo.Rq;

@Controller
public class UsrReactionPointController {

	private ReactionPointService reactionPointService;
	private Rq rq;

	public UsrReactionPointController(ReactionPointService reactionPointService, Rq rq) {

		this.reactionPointService = reactionPointService;
		this.rq = rq;
	}

	@RequestMapping("/usr/reactionPoint/doGoodReaction")
	@ResponseBody
	String doGoodReaction(String relTypeCode, int relId, String replaceUri) {
		boolean actorCanMakeReactionPoint = reactionPointService.actorCanMakeReactionPoint(rq.getLoginedMemberId(),
				relTypeCode, relId).isSuccess();

		if (actorCanMakeReactionPoint == false) {
			return rq.historyBackOnView("이미 처리되었습니다.");
		}

		reactionPointService.addGoodReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);

		return rq.jsReplace("좋아요!", replaceUri);
	}

	@RequestMapping("/usr/reactionPoint/doBadReaction")
	@ResponseBody
	String doBadReaction(String relTypeCode, int relId, String replaceUri) {
		boolean actorCanMakeReactionPoint = reactionPointService.actorCanMakeReactionPoint(rq.getLoginedMemberId(),
				relTypeCode, relId).isSuccess();

		if (actorCanMakeReactionPoint == false) {
			return rq.historyBackOnView("이미 처리되었습니다.");
		}

		reactionPointService.addBadReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);

		return rq.jsReplace("싫어요!", replaceUri);
	}

}
