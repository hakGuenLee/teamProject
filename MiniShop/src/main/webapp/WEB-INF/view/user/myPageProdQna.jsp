<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 마이페이지 첫 화면 -->

<jsp:include page="../include/header.jsp" />
<div class="container w-50 border shadow-sm p-5 mt-5">
	<h4>상품문의 조회</h4>


	<div class="d-flex">
		<div class="d-flex">
			<div class="form-floating mb-3 mt-3">
				<p class="me-3">조회기간</p>
			</div>
			
			<form action="<c:url value="/userQna/dateSearch"/>"  method="post">
			<div class="d-flex">
				<div class="d-flex form-floating mt-3 mb-3">
					<input class="form-control mb-2" type="hidden" id="stt_ymd1d"
						name="stt_ymd"  />
					<input class="form-control mb-2" type="hidden" id="end_ymd1d"
						name="end_ymd" />
				</div>
				<div class="form-floating mt-3 mb-3">
			<button type="submit" class="form-control" style="width: 60px;">오늘</button>
				</div>
			</div>
		</form>
					<form action="<c:url value="/userQna/dateSearch"/>"  method="post">
			<div class="d-flex">
				<div class="d-flex form-floating mt-3 mb-3">
					<input class="form-control mb-2" type="hidden" id="stt_ymd1w"
						name="stt_ymd"  />
					<input class="form-control mb-2" type="hidden" id="end_ymd1w"
						name="end_ymd" />
				</div>
				<div class="form-floating mt-3 mb-3">
			<button type="submit" class="form-control" style="width: 60px;">1주</button>
				</div>
			</div>
		</form>
					<form action="<c:url value="/userQna/dateSearch"/>"  method="post">
			<div class="d-flex">
				<div class="d-flex form-floating mt-3 mb-3">
					<input class="form-control mb-2" type="hidden" id="stt_ymd1m"
						name="stt_ymd"  />
					<input class="form-control mb-2" type="hidden" id="end_ymd1m"
						name="end_ymd" />
				</div>
				<div class="form-floating mt-3 mb-3">
			<button type="submit" class="form-control" style="width: 60px;">1달</button>
				</div>
			</div>
		</form>
					<form action="<c:url value="/userQna/dateSearch"/>"  method="post">
			<div class="d-flex">
				<div class="d-flex form-floating mt-3 mb-3">
					<input class="form-control mb-2" type="hidden" id="stt_ymd3m"
						name="stt_ymd"  />
					<input class="form-control mb-2" type="hidden" id="end_ymd3m"
						name="end_ymd" />
				</div>
				<div class="form-floating mt-3 mb-3">
			<button type="submit" class="form-control" style="width: 60px;">3달</button>
				</div>
			</div>
		</form>
			

			
		</div>

		<form action="<c:url value="/userQna/dateSearch"/>"  method="post">
			<div class="d-flex">
				<div class="d-flex form-floating mt-3 mb-3 me-3">
					<input class="form-control mb-2" type="date" id="stt_ymd"
						name="stt_ymd" max="9999-12-31"
						data-placeholder="검색기간(시작일)" required />
					<!-- 수정할것  -->
				 <b class="mt-3 p-2"> ~</b>
					<input class="form-control mb-2" type="date" id="end_ymd"
						name="end_ymd" max="9999-12-31"
						data-placeholder="검색기간(종료일)" required />
					<!-- 수정할것  -->
				</div>
				<div class="form-floating mt-3 mb-3">
					<button type="submit" class="btn btn-success btn-sm btn-outline">검색</button>
				</div>
			</div>
		</form>
		
		
	</div>
</div>


<div class="container w-50 mt-5">
	<h3>
		<b>${sessionScope.userDTO.user_nm}님의 상품문의 내역</b> <span>${QnaCount} 건</span>
	</h3>

	<table class="table mt-5">
		<thead class="table-secondary">
			<tr>
				<th>문의번호</th>
				<th>문의날짜</th>
				<th>문의유형</th>
				<th>상품명</th>
				<th>제목</th>
				<th>문의상태</th>
				<th>답변처리일</th>
				<th>상세</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="dto">
		<tbody>
			<tr>
				<td>${dto.qna_no}</td>
				<td>${dto.qna_dt}</td>
				<td>${dto.qna_code }</td>
				<td>${dto.prod_no }</td>
				<td>${dto.qna_ttl }</td>
				<td>${dto.proc_sts==1?' 답변대기중':''}</td>
				<td>${dto.proc_dt }</td>
				<td><a href="<c:url value="/userQna/QnaInfo?qna_no=${dto.qna_no}"/>" class="btn btn-sm btn-primary">상세보기</a></td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
</div>
		<ul class="pagination justify-content-center my-5">
        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/userQna/myPageProdQna?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
        </li>

        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
                <a class="page-link"
                   href="<c:url value="/userQna/myPageProdQna?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/userQna/myPageProdQna?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
        </li>
    </ul>

<script>

// getDate == 날자 // getMonth == 달 

document.getElementById('stt_ymd1d').value = new Date().toISOString().substring(0, 10);; // 오늘 조회하기
document.getElementById('end_ymd1d').value = new Date().toISOString().substring(0, 10);; // 오늘 조회하기


document.getElementById('end_ymd1w').value = new Date().toISOString().substring(0, 10);; // 1주일 조회하기
document.getElementById('stt_ymd1w').value = new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().substring(0, 10);; // 1주일 조회하기 

document.getElementById('end_ymd1m').value = new Date().toISOString().substring(0, 10);; // 1달 조회하기
document.getElementById('stt_ymd1m').value = new Date(new Date().setDate(new Date().getMonth() - 1)).toISOString().substring(0, 10);; // 1달 조회하기 

document.getElementById('end_ymd3m').value = new Date().toISOString().substring(0, 10);; // 3달 조회하기
document.getElementById('stt_ymd3m').value = new Date(new Date().setDate(new Date().getMonth() - 3)).toISOString().substring(0, 10);; // 3달 조회하기 

</script>




<jsp:include page="../include/footer.jsp" />


