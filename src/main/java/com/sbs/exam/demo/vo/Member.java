package com.sbs.exam.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String loginId;
	private String loginPw;
	public String name;
	private String nickname;
	private String cellphoneNo;
	private String email;
}