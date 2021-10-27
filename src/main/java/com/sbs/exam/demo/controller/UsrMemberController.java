package com.sbs.exam.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.exam.demo.vo.Member;

@Controller
public class UsrMemberController {
//	@Autowired
//	private MemberService memberService;
	private List<Member> members;

	public UsrMemberController() {
		members = new ArrayList<>();
	}
	// 액션 메서드 시작
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNo, String email) {

		Member member = new Member(loginId, loginPw, name, nickname, cellphoneNo, email);

		return name + "님이 가입 완료 되었습니다.";
	}

}
