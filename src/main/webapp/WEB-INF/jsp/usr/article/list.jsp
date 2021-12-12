<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!-- c라는 변수를 만들어서 jsp에서만 사용하기 위해 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 꼭 include 하기 전에 c변수 먼저 생성해줘야함 -->
<c:set var="pageTitle" value="${board.name } 게시판"/>
<%@ include file="../common/head.jspf" %>
<section class="mt-5">
  <div class="container mx-auto px-3">
  	<div class="flex">
      <div>
        게시물 갯수 :
        <span class="badge badge-ghost">${articlesCount }</span>
        개
      </div>
      <div class="flex-grow"></div>
      <form class="flex">

        <input type="hidden" name="boardId" value="${param.boardId }" />

        <select data-value="${param.searchKeywordTypeCode }"
          name="searchKeywordTypeCode"
          class="select select-ghost select-bordered">
          <option disabled="disabled">검색타입</option>
          <option value="title">제목</option>
          <option value="body">내용</option>
          <option value="title,body">제목 + 내용</option>
        </select>


        <input name="searchKeyword" type="text"
          class="ml-2 w-96 input input-bordered"
          placeholder="검색어를 입력해주세요" maxlength="20"
          value="${param.searchKeyword }" />

          <button class="ml-3 btn btn-outline btn-ghost" type="submit"> 검색</button>
      </form>

    </div>
    <div class="mt-2">
	  <table border=1 class="table w-full table-zebra table-fixed">
	   <colgroup>
          <col width="50">
          <col width="100">
          <col width="100">
          <col width="50">
          <col width="50">
          <col width="150">
          <col>
        </colgroup>
		<tread>
		  <tr>
			<th>번호</th>
			<th>작성날짜</th>
			<th>수정날짜</th>
			<th>조회수</th>
			<th>추천</th>
			<th>작성자</th>
			<th>제목</th>
		  </tr>
		</tread>
		<tbody>
      <c:forEach var="article" items="${articles }">
        <tr>
          <td>${article.id }</td>
          <td>${article.forPrintType1RegDate }</td>
          <td>${article.forPrintType1UpdateDate }</td>
          <td>${article.hitCount}</td>
		  <td>${article.goodReactionPoint}</td>
          <td>${article.extra__writerName}</td>
          <td>
            <a class="btn btn-ghost btn-outline w-full block truncate" href="../article/detail?id=${article.id }">${article.title }</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
	</table>
   </div>
    <div class="page-menu mt-3">
      <div class="btn-group justify-center">
        <c:set var="pageMemuArmLen" value="4" />
        <c:set var="startPage"
          value="${page - pageMemuArmLen >= 1 ? page - pageMemuArmLen : 1}" />
        <c:set var="endPage"
          value="${page + pageMemuArmLen <= pagesCount ? page + pageMemuArmLen : pagesCount}" />
      <c:set var="pageBaseUri" value="?boarId=${boardId }" />
        <c:set var="pageBaseUri"
          value="?pageBaseUri=${pageBaseUri }&searchKeywordTypeCode=${param.searchKeywordTypeCode }" />
        <c:set var="pageBaseUri"
          value="?pageBaseUri=${pageBaseUri }&searchKeyword=${param.searchKeyword }" />
        <c:if test="${startPage > 1}">
          <a class="btn btn-sm" href="${pageBaseUri }&page=1">1</a>
          <c:if test="${startPage > 2}">
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if>
        </c:if>
        <c:forEach begin="${startPage }" end="${endPage }" var="i">
          <a class="btn btn-sm ${page == i ? 'btn-active' : ''}"
            href="${pageBaseUri }&page=${i}">${i}</a>
        </c:forEach>
         <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if>
          <a class="btn btn-sm" href="${pageBaseUri }&page=${pagesCount }">${pagesCount }</a>
        </c:if>
      </div>
    </div>
  </div>
</section>
	<%@ include file="../common/foot.jspf" %>
