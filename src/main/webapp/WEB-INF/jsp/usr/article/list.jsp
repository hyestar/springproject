<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!-- c라는 변수를 만들어서 jsp에서만 사용하기 위해 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 꼭 include 하기 전에 c변수 먼저 생성해줘야함 -->
<c:set var="pageTitle" value="${board.name } 게시판"/>
<%@ include file="../common/head.jspf" %>
<section class="mt-5">
  <div class="container mx-auto px-3">
  	<div>게시물 갯수 : ${articlesCount }개</div>
    <div class="table-box-type-1">
	  <table border=1 class="table w-full table-zebra">
	   <colgroup>
          <col width="80">
          <col width="150">
          <col width="150">
          <col width="150">
          <col>
        </colgroup>
		<tread>
		  <tr>
			<th>번호</th>
			<th>작성날짜</th>
			<th>수정날짜</th>
			<th>작성자</th>
			<th>제목</th>
		  </tr>
		</tread>
		<tbody>
      <c:forEach var="article" items="${articles }">
        <tr>
          <td>${article.id }</td>
          <td>${article.regDate.substring(2,16) }</td>
          <td>${article.updateDate.substring(2,16) }</td>
          <td>${article.extra__writerName}</td>
          <td>
            <a class="btn btn-ghost btn-outline" href="../article/detail?id=${article.id }">${article.title }</a>
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
