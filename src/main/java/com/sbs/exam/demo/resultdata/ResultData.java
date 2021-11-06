package com.sbs.exam.demo.resultdata;

import com.sbs.exam.demo.vo.Article;
import com.sbs.exam.demo.vo.Member;

import lombok.Getter;

public class ResultData<DT> {
	@Getter
	private String resultCode;
	@Getter
	private String msg;
	@Getter
	private String data1Name;
	@Getter
	private DT data1;
	
	private ResultData() {
		
	}
	
	public static <DT> ResultData from(String resultCode, String msg) {
		return from(resultCode, msg, null, null);
	}
	
	public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1) {
		ResultData<DT> rd = new ResultData<DT>();
		rd.resultCode = resultCode;
		rd.msg = msg;
		rd.data1Name=data1Name;
		rd.data1 = data1;
		return rd;
	}
	
	public boolean isSuccess() {
		return resultCode.startsWith("S-");
	}
	
	public boolean isFail() {
		return isSuccess() == false;
	}

	public static<DT> ResultData<DT> newData(ResultData oldRd, String data1Name, DT data1) {
		return from(oldRd.getResultCode(), oldRd.getMsg(), data1Name, data1);
	}
	
	
}
