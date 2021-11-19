<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="../member/doLogin">
      <table>
        <colgroup>
          <col width="200">
        </colgroup>
        <tbody>
          <tr>
            <th>로그인 아이디</th>
            <td>
              <input name="loginId" class="w-96 input input-bordered" type="text" placeholder="로그인 아이디" />
            </td>
          </tr>
          <tr>
            <th>로그인 비밀번호</th>
            <td>
              <input name="loginPw"  class="w-96 input input-bordered" type="password" placeholder="로그인 비밀번호" />
            </td>
          </tr>
          <tr>
            <th>로그인</th>
            <td>
              <input type="submit" value="로그인" />
              <button type="button" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>

    <div class="btns mt-2">
      <button class="btn btn-link" type="button"
        onclick="history.back();">뒤로가기</button>
      <a href="../article/modify?id=${article.id}"
        class="btn-text-link ml-2">게시물 수정</a>
      <c:if test="${ article.extra__actorCanDelete }">
        <a
          onclick="if ( confirm('게시물을 삭제하시겠습니까?') == false ) { return false; }"
          href="../article/doDelete?id=${article.id}"
          class="btn btn-link">게시물 삭제</a>
      </c:if>
    </div>
  </div>
</section>
<%@ include file="../common/foot.jspf"%> 